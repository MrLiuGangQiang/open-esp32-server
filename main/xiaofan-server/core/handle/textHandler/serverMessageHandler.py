import asyncio
import json
from typing import Dict, Any, List

from core.handle.textMessageHandler import TextMessageHandler
from core.handle.textMessageType import TextMessageType
from core.providers.tools.device_mcp import handle_mcp_message

TAG = __name__

class ServerTextMessageHandler(TextMessageHandler):
    """MCP消息处理器"""

    @property
    def message_type(self) -> TextMessageType:
        return TextMessageType.SERVER

    async def handle(self, conn, msg_json: Dict[str, Any]) -> None:
        # 如果配置是从API读取的，则需要验证secret
        if not conn.read_config_from_api:
            return
        # 获取post请求的secret
        post_secret = msg_json.get("content", {}).get("secret", "")
        secret = conn.config["manager-api"].get("secret", "")
        # 如果secret不匹配，则返回
        if post_secret != secret:
            await conn.websocket.send(
                json.dumps(
                    {
                        "type": "server",
                        "status": "error",
                        "message": "服务器密钥验证失败",
                    }
                )
            )
            return
        # 动态更新配置
        if msg_json["action"] == "update_config":
            try:
                # 更新WebSocketServer的配置
                if not conn.server:
                    await conn.websocket.send(
                        json.dumps(
                            {
                                "type": "server",
                                "status": "error",
                                "message": "无法获取服务器实例",
                                "content": {"action": "update_config"},
                            }
                        )
                    )
                    return

                if not await conn.server.update_config():
                    await conn.websocket.send(
                        json.dumps(
                            {
                                "type": "server",
                                "status": "error",
                                "message": "更新服务器配置失败",
                                "content": {"action": "update_config"},
                            }
                        )
                    )
                    return

                # 发送成功响应
                await conn.websocket.send(
                    json.dumps(
                        {
                            "type": "server",
                            "status": "success",
                            "message": "配置更新成功",
                            "content": {"action": "update_config"},
                        }
                    )
                )
            except Exception as e:
                conn.logger.bind(tag=TAG).error(f"更新配置失败: {str(e)}")
                await conn.websocket.send(
                    json.dumps(
                        {
                            "type": "server",
                            "status": "error",
                            "message": f"更新配置失败: {str(e)}",
                            "content": {"action": "update_config"},
                        }
                    )
                )
        # 重启服务器
        elif msg_json["action"] == "get_mcp_servers":
            servers = await get_server_mcp_snapshot(conn)
            await conn.websocket.send(
                json.dumps(
                    {
                        "type": "server",
                        "status": "success",
                        "message": "?????MCP????",
                        "content": {
                            "action": "get_mcp_servers",
                            "servers": servers,
                        },
                    }
                )
            )
        elif msg_json["action"] == "restart":
            await conn.handle_restart(msg_json)

async def get_server_mcp_snapshot(conn) -> List[Dict[str, Any]]:
    """Return sanitized service-side MCP summaries for the console."""
    # Build an independent manager so this action works even on a temporary
    # admin connection that has not initialized TTS/LLM components.
    from core.providers.tools.server_mcp.mcp_manager import ServerMCPManager

    manager = ServerMCPManager(conn)
    try:
        await asyncio.wait_for(manager.initialize_servers(), timeout=20)
        raw_config = manager.load_config()
        snapshots: List[Dict[str, Any]] = []
        for name, config in raw_config.items():
            client = manager.clients.get(name)
            tools: List[Dict[str, Any]] = []
            if client is not None:
                try:
                    tools = client.get_available_tools()
                except Exception:
                    tools = []

            endpoint = config.get("url", "")
            if not endpoint and config.get("command"):
                args = " ".join(str(item) for item in config.get("args", []))
                endpoint = str(config["command"]) + (f" {args}" if args else "")

            snapshots.append(
                {
                    "name": name,
                    "endpoint": endpoint,
                    "transport": config.get(
                        "transport",
                        "stdio" if config.get("command") else "sse",
                    ),
                    "connected": client is not None,
                    "tool_count": len(tools),
                    "tools": [
                        {
                            "name": tool.get("function", {}).get("name", ""),
                            "description": tool.get("function", {}).get(
                                "description", ""
                            ),
                        }
                        for tool in tools
                    ],
                }
            )
        return snapshots
    finally:
        try:
            await asyncio.wait_for(manager.cleanup_all(), timeout=20)
        except Exception:
            pass
