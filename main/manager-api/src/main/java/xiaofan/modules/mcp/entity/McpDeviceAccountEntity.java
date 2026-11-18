package xiaofan.modules.mcp.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@TableName("ai_device_mcp_account")
@Schema(description = "Device MCP account binding")
public class McpDeviceAccountEntity implements Serializable {
    @TableId(type = IdType.ASSIGN_ID)
    @Schema(description = "Binding ID")
    private Long id;

    @Schema(description = "Device MAC address")
    private String macAddress;

    @Schema(description = "MCP server ID")
    private String serverId;

    @Schema(description = "Third-party username")
    private String username;

    @Schema(description = "Encrypted third-party password")
    private String passwordCipher;

    @Schema(description = "Encrypted device-specific MCP Bearer token")
    private String tokenCipher;

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
