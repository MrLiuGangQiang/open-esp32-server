"""服务端MCP工具执行器"""

import json
from typing import Dict, Any, Optional
from ..base import ToolType, ToolDefinition, ToolExecutor
from plugins_func.register import Action, ActionResponse
from .mcp_manager import ServerMCPManager


class ServerMCPExecutor(ToolExecutor):
    """服务端MCP工具执行器"""

    def __init__(self, conn):
        self.conn = conn
        self.mcp_manager: Optional[ServerMCPManager] = None
        self._initialized = False

    async def initialize(self):
        """初始化MCP管理器"""
        if not self._initialized:
            self.mcp_manager = ServerMCPManager(self.conn)
            self._initialized = True
            await self.mcp_manager.initialize_servers()

    MAX_TOOL_RESULT_CHARS = 12000
    MAX_SAMPLE_ITEMS = 3

    @classmethod
    def _compact_mcp_result(cls, result) -> str:
        """Keep MCP results compact enough for LLM context."""
        raw = None
        structured = getattr(result, "structuredContent", None)
        if structured is not None:
            raw = structured
        else:
            parts = []
            for item in getattr(result, "content", None) or []:
                text = getattr(item, "text", None)
                if text is not None:
                    parts.append(text)
            raw = "\n".join(parts)

        if raw is None:
            raw = str(result)

        if isinstance(raw, (dict, list)):
            try:
                raw = json.dumps(raw, ensure_ascii=False)
            except Exception:
                raw = str(raw)

        raw = str(raw)
        if len(raw) <= cls.MAX_TOOL_RESULT_CHARS:
            return raw

        compacted = {
            "compacted": True,
            "originalChars": len(raw),
            "note": "Result was truncated to protect model context. Use filters/pagination for more detail.",
        }

        parsed = None
        try:
            parsed = json.loads(raw)
        except Exception:
            parsed = None

        if isinstance(parsed, dict):
            for key in ("total", "count", "page", "size", "pageSize", "totalElements"):
                if key in parsed:
                    compacted[key] = parsed[key]

            for key in ("list", "data", "rows", "records", "items", "content"):
                value = parsed.get(key)
                if isinstance(value, list):
                    compacted["returnedCount"] = len(value)
                    compacted["sample"] = value[: cls.MAX_SAMPLE_ITEMS]
                    compacted["note"] = (
                        f"Showing first {min(len(value), cls.MAX_SAMPLE_ITEMS)} of "
                        f"{len(value)} returned rows. Use pagination/filters for more."
                    )
                    break

            try:
                text = json.dumps(compacted, ensure_ascii=False)
            except Exception:
                text = str(compacted)
            return text[: cls.MAX_TOOL_RESULT_CHARS] + "\n...[truncated]"

        return raw[: cls.MAX_TOOL_RESULT_CHARS] + "\n...[truncated]"

    async def execute(
        self, conn, tool_name: str, arguments: Dict[str, Any]
    ) -> ActionResponse:
        """执行服务端MCP工具"""
        if not self._initialized or not self.mcp_manager:
            return ActionResponse(
                action=Action.ERROR,
                response="MCP管理器未初始化",
            )

        try:
            result = await self.mcp_manager.execute_tool(tool_name, arguments)

            compacted_result = self._compact_mcp_result(result)
            return ActionResponse(action=Action.REQLLM, result=compacted_result)

        except ValueError as e:
            return ActionResponse(
                action=Action.NOTFOUND,
                response=str(e),
            )
        except Exception as e:
            return ActionResponse(
                action=Action.ERROR,
                response=str(e),
            )

    def get_tools(self) -> Dict[str, ToolDefinition]:
        """获取所有服务端MCP工具"""
        if not self._initialized or not self.mcp_manager:
            return {}

        tools = {}
        mcp_tools = self.mcp_manager.get_all_tools()

        for tool in mcp_tools:
            func_def = tool.get("function", {})
            tool_name = func_def.get("name", "")
            if tool_name == "":
                continue
            tools[tool_name] = ToolDefinition(
                name=tool_name, description=tool, tool_type=ToolType.SERVER_MCP
            )

        return tools

    def has_tool(self, tool_name: str) -> bool:
        """Check whether the namespaced server-side MCP tool exists."""
        if not self._initialized or not self.mcp_manager:
            return False
        return self.mcp_manager.is_mcp_tool(tool_name)

    def get_tool_display_name(self, tool_name: str) -> str:
        if not self._initialized or not self.mcp_manager:
            return tool_name
        return self.mcp_manager.get_tool_display_name(tool_name)

    async def cleanup(self):
        """清理MCP连接"""
        if self.mcp_manager:
            await self.mcp_manager.cleanup_all()
