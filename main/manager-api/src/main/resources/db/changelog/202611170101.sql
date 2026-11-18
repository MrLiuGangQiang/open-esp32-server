-- Allow Token-only device MCP bindings.
ALTER TABLE ai_device_mcp_account
    ALTER COLUMN username DROP NOT NULL;
