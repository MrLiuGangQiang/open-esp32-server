package xiaofan.modules.mcp.dto;

import java.util.List;

import lombok.Data;

@Data
public class DeviceMcpAccountSaveDTO {
    private String macAddress;
    private List<DeviceAccountItem> accounts;

    @Data
    public static class DeviceAccountItem {
        private String serverId;
        private String username;
        private String password;
        private String token;
        private Integer enabled;
    }
}
