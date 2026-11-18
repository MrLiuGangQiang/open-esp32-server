"""Server-side MCP manager."""

import asyncio
import hashlib
import os
import json
import re
from typing import Dict, Any, List

from mcp.types import LoggingMessageNotificationParams

import base64
import json as system_json
from urllib.parse import parse_qs, urlencode, urljoin, urlparse, urlsplit, urlunsplit

import httpx
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives.ciphers.aead import AESGCM

from config.config_loader import get_project_dir
from config.logger import setup_logging
from .mcp_client import ServerMCPClient

TAG = __name__
logger = setup_logging()


class ServerMCPManager:
    """Manage multiple server-side MCP services."""

    def __init__(self, conn) -> None:
        self.conn = conn
        self.config_path = get_project_dir() + "data/.mcp_server_settings.json"
        if not os.path.exists(self.config_path):
            self.config_path = ""
        self.runtime_config = (getattr(conn, "config", None) or {}).get("mcp") or {}
        self.device_accounts = (getattr(conn, "config", None) or {}).get("mcp_accounts") or []
        self.device_id = getattr(conn, "device_id", None)
        self.tokens = {}
        self.clients: Dict[str, ServerMCPClient] = {}
        self.tool_registry: Dict[str, Dict[str, Any]] = {}
        self._init_lock = asyncio.Lock()

    def load_config(self) -> Dict[str, Any]:
        """Load DB-configured MCP services, falling back to local file."""
        runtime_servers = self.runtime_config.get("servers")
        if isinstance(runtime_servers, list) and runtime_servers:
            authorized = set(self.runtime_config.get("authorized_server_ids") or [])
            enabled_servers = [
                server for server in runtime_servers if server.get("enabled", True)
            ]
            if authorized:
                enabled_servers = [
                    server for server in enabled_servers
                    if server.get("id") in authorized
                ]

            servers: Dict[str, Any] = {}
            for server in enabled_servers:
                name = str(server.get("name") or server.get("id") or "").strip()
                if not name:
                    continue

                # Standard MCP config supports both local stdio servers and
                # remote streamable-http / SSE servers.
                common_config = {
                    "id": server.get("id"),
                    "name": name,
                    "description": server.get("description") or "",
                    "auth_mode": server.get("authMode", "client"),
                    "auth_config": server.get("authConfig") or {},
                }
                if server.get("command"):
                    client_config = {
                        **common_config,
                        "command": server.get("command"),
                        "args": server.get("args") or [],
                        "env": server.get("env") or {},
                    }
                else:
                    client_config = {
                        **common_config,
                        "url": server.get("endpoint"),
                        "transport": server.get("transport") or "streamable-http",
                    }
                    auth_mode = server.get("authMode", "client")
                    headers = server.get("headers")
                    if isinstance(headers, dict) and headers:
                        client_config["headers"] = headers
                servers[name] = client_config
            return servers

        if len(self.config_path) == 0:
            return {}

        try:
            with open(self.config_path, "r", encoding="utf-8") as f:
                config = json.load(f)
            return config.get("mcpServers", {})
        except Exception as e:
            logger.bind(tag=TAG).error(
                f"Error loading MCP config from {self.config_path}: {e}"
            )
            return {}

    def _find_account(self, server: Dict[str, Any]):
        server_id = server.get("id")
        for account in self.device_accounts:
            if account.get("serverId") == server_id:
                return account
        return None

    def _decrypt_password(self, cipher: str) -> str:
        secret = str(self.conn.config.get("manager-api", {}).get("secret", ""))
        key = __import__("hashlib").sha256(
            (secret + ":mcp-device-password").encode("utf-8")
        ).digest()
        raw = base64.b64decode(cipher)
        return AESGCM(key).decrypt(raw[:12], raw[12:], None).decode("utf-8")

    def _origin(self, endpoint: str) -> str:
        parsed = urlsplit(endpoint)
        return f"{parsed.scheme}://{parsed.netloc}"

    async def _cloudpivot_login(self, endpoint: str, auth_config: Dict[str, Any],
                                username: str, password: str) -> Dict[str, Any]:
        """Log in through the same browser flow used by the CloudPivot login page."""
        origin = auth_config.get("baseUrl") or self._origin(endpoint)
        corp_id = auth_config.get("corpId") or auth_config.get("corpIdValue")
        redirect_uri = f"{origin}/oauth"
        authorize_url = f"{origin}/user/oauth/authorize?" + urlencode({
            "client_id": "api",
            "response_type": "code",
            "scope": "read",
            "redirect_uri": redirect_uri,
        })

        headers = {"X-LowCode-Corpid": corp_id}
        async with httpx.AsyncClient(timeout=20, follow_redirects=True) as client:
            response = await client.get(authorize_url, headers=headers)
            response.raise_for_status()
            login_url = str(response.url)
            match = re.search(r'name="_csrf" value="([^"]+)', response.text)
            if not match:
                raise RuntimeError("CloudPivot login page did not contain a CSRF token")

            key_response = await client.get(f"{origin}/api/public/getKey", headers=headers)
            key_response.raise_for_status()
            key_data = key_response.json()
            public_key = serialization.load_der_public_key(base64.b64decode(key_data["key"]))
            encrypted_password = base64.b64encode(
                public_key.encrypt(password.encode("utf-8"), padding.PKCS1v15())
            ).decode("utf-8")

            form = {
                "_csrf": match.group(1),
                "username": username,
                "password": encrypted_password,
                "index": key_data.get("index", ""),
            }
            response = await client.post(
                f"{origin}/user/login",
                data=form,
                headers={**headers, "Referer": login_url},
            )
            code = parse_qs(urlparse(str(response.url)).query).get("code", [""])[0]
            if not code and "/login?error" in str(response.url):
                raise RuntimeError("CloudPivot username or password is incorrect")
            if not code:
                raise RuntimeError("CloudPivot login did not return an authorization code")

            client_secret = auth_config.get("clientSecret") or os.getenv(
                "CLOUDPIVOT_CLIENT_SECRET"
            )
            if not client_secret:
                raise RuntimeError("CloudPivot client secret is not configured")
            token_response = await client.get(
                f"{origin}/user/login/Authentication/get_token",
                params={
                    "code": code,
                    "url": f"{origin}/user",
                    "client_secret": client_secret,
                    "client_id": auth_config.get("clientId", "api"),
                    "redirect_uri": redirect_uri,
                    "corpId": corp_id,
                },
                headers=headers,
            )
            token_response.raise_for_status()
            token_data = token_response.json()
            if not token_data.get("access_token"):
                raise RuntimeError(f"CloudPivot token exchange failed: {token_data}")
            return {
                "access_token": token_data.get("access_token"),
                "refresh_token": token_data.get("refresh_token"),
                "expires_in": token_data.get("expires_in"),
            }

    async def _account_headers(self, server: Dict[str, Any]) -> Dict[str, str]:
        if server.get("authMode", "client") == "server":
            return {}
        account = self._find_account(server)
        if not account:
            return {}
        token_cipher = account.get("tokenCipher")
        if token_cipher:
            token = self._decrypt_password(token_cipher).strip()
            if token:
                if not token.lower().startswith("bearer "):
                    token = f"Bearer {token}"
                return {"Authorization": token}
        server_id = server.get("id")
        cached = self.tokens.get((self.device_id, server_id))
        if cached:
            return {
                "Authorization": f"Bearer {cached['access_token']}",
                "X-Refresh-Token": cached.get("refresh_token", ""),
            }

        auth_config = server.get("auth_config") or server.get("authConfig") or {}
        username = account.get("username")
        password = self._decrypt_password(account.get("passwordCipher", ""))
        if auth_config.get("authType", "cloudpivot_password") != "cloudpivot_password":
            return {}
        tokens = await self._cloudpivot_login(
            server.get("endpoint"), auth_config, username, password
        )
        self.tokens[(self.device_id, server_id)] = tokens
        return {
            "Authorization": f"Bearer {tokens['access_token']}",
            "X-Refresh-Token": tokens.get("refresh_token", ""),
        }

    async def _init_server(self, name: str, srv_config: Dict[str, Any]):
        client = None
        try:
            logger.bind(tag=TAG).info(f"Initializing server-side MCP client: {name}")
            headers = await self._account_headers(srv_config)
            if headers:
                srv_config = dict(srv_config)
                srv_config["headers"] = headers
            client = ServerMCPClient(srv_config)
            await asyncio.wait_for(
                client.initialize(logging_callback=self.logging_callback), timeout=10
            )

            async with self._init_lock:
                self.clients[name] = client
                client_tools = client.get_available_tools()
                service_name = str(srv_config.get("name") or name)
                service_description = re.sub(r"<[^>]+>", " ", str(srv_config.get("description") or ""))
                service_description = re.sub(r"\s+", " ", service_description).strip()
                service_summary = (
                    f"MCP服务「{service_name}」：{service_description or '未填写服务描述'}"
                )
                prefix = self._service_tool_prefix(srv_config, name)
                for tool in client_tools:
                    function = tool.get("function") or {}
                    original_name = function.get("name")
                    if not original_name:
                        continue
                    unique_name = self._unique_tool_name(prefix, original_name)
                    raw_description = str(function.get("description") or "").strip()
                    display_name = self._tool_display_name(raw_description, original_name)
                    tool["function"]["name"] = unique_name
                    tool["function"]["description"] = (
                        f"{service_summary}\n"
                        f"调用前必须根据上面的服务描述判断用户请求是否属于该系统/环境。\n"
                        f"工具功能：{raw_description or original_name}"
                    )
                    self.tool_registry[unique_name] = {
                        "definition": tool,
                        "client": client,
                        "original_name": original_name,
                        "display_name": display_name,
                    }

        except asyncio.TimeoutError:
            logger.bind(tag=TAG).error(f"Failed to initialize MCP server {name}: Timeout")
            if client:
                await client.cleanup()
        except Exception as e:
            logger.bind(tag=TAG).error(f"Failed to initialize MCP server {name}: {e}")
            if client:
                await client.cleanup()

    @staticmethod
    def _tool_display_name(description: str, fallback_name: str) -> str:
        text = re.sub(r"<[^>]+>", " ", description or "")
        text = re.sub(r"\s+", " ", text).strip()
        text = re.sub(r"^(工具(?:功能)?|功能(?:描述)?|描述|接口)\s*[:：]\s*", "", text)
        if not text:
            return fallback_name
        first = re.split(r"[。；;!？?\n]", text, 1)[0].strip()
        if len(first) > 28:
            first = re.split(r"[，,]", first, 1)[0].strip() or first
        return first[:32] or fallback_name

    @staticmethod
    def _service_tool_prefix(srv_config: Dict[str, Any], fallback_name: str) -> str:
        source = str(srv_config.get("name") or srv_config.get("id") or fallback_name)
        readable = re.sub(r"[^A-Za-z0-9_]+", "_", source).strip("_").lower()
        if not readable:
            readable = hashlib.md5(source.encode("utf-8")).hexdigest()[:10]
        return readable[:20]

    @staticmethod
    def _unique_tool_name(prefix: str, original_name: str) -> str:
        sanitized = re.sub(r"[^A-Za-z0-9_-]", "_", original_name).strip("_")
        suffix = sanitized[:36].lower() or hashlib.md5(original_name.encode("utf-8")).hexdigest()[:12]
        return f"mcp_{prefix}_{suffix}"[:64]

    async def initialize_servers(self) -> None:
        config = self.load_config()
        tasks = []
        for name, srv_config in config.items():
            if not srv_config.get("command") and not srv_config.get("url"):
                logger.bind(tag=TAG).warning(
                    f"Skipping server {name}: neither command nor url specified"
                )
                continue
            tasks.append(self._init_server(name, srv_config))

        if tasks:
            await asyncio.gather(*tasks)

        if hasattr(self.conn, "func_handler") and self.conn.func_handler:
            if hasattr(self.conn.func_handler, "tool_manager"):
                self.conn.func_handler.tool_manager.refresh_tools()
            self.conn.func_handler.current_support_functions()

    def get_all_tools(self) -> List[Dict[str, Any]]:
        return [item["definition"] for item in self.tool_registry.values()]

    def is_mcp_tool(self, tool_name: str) -> bool:
        return tool_name in self.tool_registry

    def get_tool_display_name(self, tool_name: str) -> str:
        item = self.tool_registry.get(tool_name)
        if not item:
            return tool_name
        return item.get("display_name") or item.get("original_name") or tool_name

    async def execute_tool(self, tool_name: str, arguments: Dict[str, Any]) -> Any:
        logger.bind(tag=TAG).info(f"Executing server-side MCP tool {tool_name}, arguments: {arguments}")

        max_retries = 3
        retry_interval = 2
        route = self.tool_registry.get(tool_name)
        if not route:
            logger.bind(tag=TAG).error(
                f"MCP tool route missing: tool={tool_name}, clients={list(self.clients.keys())}, registry={list(self.tool_registry.keys())}"
            )
            raise ValueError(f"Tool {tool_name} was not found in any MCP service")

        target_client = route["client"]
        original_tool_name = route["original_name"]

        last_error = None
        for attempt in range(max_retries):
            try:
                return await target_client.call_tool(original_tool_name, arguments)
            except Exception as e:
                last_error = e
                logger.bind(tag=TAG).warning(
                    f"MCP tool {tool_name} execution failed, attempt {attempt + 1}: {e}"
                )
                if attempt < max_retries - 1:
                    await asyncio.sleep(retry_interval)

        raise RuntimeError(f"MCP tool {tool_name} failed after retries: {last_error}")

    async def cleanup_all(self) -> None:
        for name, client in list(self.clients.items()):
            try:
                if hasattr(client, "cleanup"):
                    await asyncio.wait_for(client.cleanup(), timeout=20)
                logger.bind(tag=TAG).info(f"Server-side MCP client closed: {name}")
            except (asyncio.TimeoutError, Exception) as e:
                logger.bind(tag=TAG).error(f"Error closing server-side MCP client {name}: {e}")
        self.clients.clear()
        self.tool_registry = {}

    async def logging_callback(self, params: LoggingMessageNotificationParams):
        logger.bind(tag=TAG).info(f"[Server Log - {str(params.level).upper()}] {params.data}")
