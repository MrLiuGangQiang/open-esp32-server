-- Global MCP service registry and agent authorization.
CREATE TABLE ai_mcp_server (
    id VARCHAR(64) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(500) NULL,
    endpoint VARCHAR(1000) NULL,
    transport VARCHAR(30) NOT NULL DEFAULT 'streamable-http',
    command TEXT NULL,
    args_json TEXT NULL,
    env_json TEXT NULL,
    headers_json TEXT NULL,
    auth_config_json TEXT NULL,
    enabled SMALLINT NOT NULL DEFAULT 1,
    creator BIGINT NULL,
    create_date TIMESTAMP WITH TIME ZONE NULL,
    updater BIGINT NULL,
    update_date TIMESTAMP WITH TIME ZONE NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_ai_mcp_server_name UNIQUE (name)
);

CREATE TABLE ai_agent_mcp_server (
    id BIGINT NOT NULL,
    agent_id VARCHAR(64) NOT NULL,
    server_id VARCHAR(64) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_agent_mcp_server UNIQUE (agent_id, server_id)
);

CREATE TABLE ai_device_mcp_account (
    id BIGINT NOT NULL,
    mac_address VARCHAR(32) NOT NULL,
    server_id VARCHAR(64) NOT NULL,
    username VARCHAR(100) NOT NULL,
    password_cipher TEXT NOT NULL,
    enabled SMALLINT NOT NULL DEFAULT 1,
    creator BIGINT NULL,
    create_date TIMESTAMP WITH TIME ZONE NULL,
    updater BIGINT NULL,
    update_date TIMESTAMP WITH TIME ZONE NULL,
    PRIMARY KEY (id),
    CONSTRAINT uk_device_mcp_server UNIQUE (mac_address, server_id)
);

CREATE INDEX idx_device_mcp_account_mac ON ai_device_mcp_account (mac_address);
CREATE INDEX idx_device_mcp_account_server ON ai_device_mcp_account (server_id);

CREATE INDEX idx_agent_mcp_server_agent ON ai_agent_mcp_server (agent_id);
CREATE INDEX idx_agent_mcp_server_server ON ai_agent_mcp_server (server_id);

ALTER TABLE ai_mcp_server ALTER COLUMN endpoint DROP NOT NULL;
