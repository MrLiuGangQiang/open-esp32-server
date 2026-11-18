-- Add an explicit auth boundary for capability MCP services.
ALTER TABLE ai_mcp_server
    ADD COLUMN IF NOT EXISTS auth_mode VARCHAR(30) NOT NULL DEFAULT 'client';

UPDATE ai_mcp_server
SET auth_mode = 'server'
WHERE auth_config_json IS NULL
   OR auth_config_json NOT LIKE '%cloudpivot_password%';
