-- Persist optional test credentials for client-auth connection testing.
ALTER TABLE ai_mcp_server
    ADD COLUMN IF NOT EXISTS test_username VARCHAR(150),
    ADD COLUMN IF NOT EXISTS test_password_cipher VARCHAR(255);
