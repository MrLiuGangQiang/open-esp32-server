-- Token-only bindings do not require legacy username/password.
ALTER TABLE ai_device_mcp_account
    ALTER COLUMN password_cipher DROP NOT NULL;
