-- Standard MCP token authentication for connection tests and per-device runtime auth.
ALTER TABLE ai_mcp_server
    ADD COLUMN IF NOT EXISTS test_token_cipher VARCHAR(2048);

ALTER TABLE ai_device_mcp_account
    ADD COLUMN IF NOT EXISTS token_cipher VARCHAR(2048);
