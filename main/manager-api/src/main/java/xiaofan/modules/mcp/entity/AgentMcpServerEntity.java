package xiaofan.modules.mcp.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@TableName("ai_agent_mcp_server")
@Schema(description = "Agent MCP server authorization")
public class AgentMcpServerEntity implements Serializable {
    @TableId(type = IdType.ASSIGN_ID)
    @Schema(description = "Mapping ID")
    private Long id;

    @Schema(description = "Agent ID")
    private String agentId;

    @Schema(description = "MCP server ID")
    private String serverId;
}
