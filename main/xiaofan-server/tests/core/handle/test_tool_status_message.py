import asyncio
import json
from types import SimpleNamespace

from core.handle.sendAudioHandle import send_tool_status_message


class FakeWebSocket:
    def __init__(self):
        self.messages = []

    async def send(self, payload):
        self.messages.append(json.loads(payload))


def _send(features, status="running"):
    websocket = FakeWebSocket()
    conn = SimpleNamespace(
        websocket=websocket,
        session_id="session-1",
        features=features,
    )
    asyncio.run(
        send_tool_status_message(
            conn,
            tool_name="get_weather",
            display_name="查天气",
            status=status,
        )
    )
    return websocket.messages[0]


def test_tool_status_uses_dedicated_message_type():
    message = _send({"tool_status": True})

    assert message == {
        "type": "tool_status",
        "status": "running",
        "tool_name": "get_weather",
        "display_name": "查天气",
        "text": "正在调用：查天气",
        "session_id": "session-1",
    }
    assert not message["text"].startswith("%")


def test_legacy_client_gets_stt_fallback_without_percent():
    message = _send({})

    assert message["type"] == "stt"
    assert message["display_type"] == "tool_status"
    assert message["text"] == "正在调用：查天气"
    assert not message["text"].startswith("%")
