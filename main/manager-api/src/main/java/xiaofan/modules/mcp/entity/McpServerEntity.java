package xiaofan.modules.mcp.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@TableName("ai_mcp_server")
@Schema(description = "Server-side MCP service")
public class McpServerEntity implements Serializable {
    @TableId(type = IdType.ASSIGN_UUID)
    @Schema(description = "MCP server ID")
    private String id;

    @Schema(description = "Display name")
    private String name;

    @Schema(description = "Description")
    private String description;

    @Schema(description = "Remote MCP endpoint")
    private String endpoint;

    @Schema(description = "stdio/sse/http/streamable-http")
    private String transport;

    @Schema(description = "stdio command")
    private String command;

    @Schema(description = "stdio args JSON")
    private String argsJson;

    @Schema(description = "stdio env JSON")
    private String envJson;

    @Schema(description = "HTTP headers JSON")
    private String headersJson;
    @Schema(description = "Password auth configuration JSON")
    private String authConfigJson;

    @Schema(description = "server/client auth boundary")
    private String authMode;

    @Schema(description = "Optional username used only for connection tests")
    private String testUsername;

    @Schema(description = "Encrypted optional password used only for connection tests")
    private String testPasswordCipher;

    @Schema(description = "Encrypted optional Bearer token used only for connection tests and capability analysis")
    private String testTokenCipher;

    @Schema(description = "0 disabled, 1 enabled")
    private Integer enabled;

    @Schema(description = "Creator")
    private Long creator;

    @Schema(description = "Create date")
    private Date createDate;

    @Schema(description = "Updater")
    private Long updater;

    @Schema(description = "Update date")
    private Date updateDate;
}
