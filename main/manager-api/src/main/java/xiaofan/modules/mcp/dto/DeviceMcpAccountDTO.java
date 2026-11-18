package xiaofan.modules.mcp.dto;

import lombok.Data;

@Data
public class DeviceMcpAccountDTO {
    private Long id;
    private String macAddress;
    private String serverId;
    private String serverName;
    private String username;
    private String password;
    private Integer enabled;
}
