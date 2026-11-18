package xiaofan.modules.mcp.dto;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class McpServerDTO {
    private String id;
    private String name;
    private String description;
    private String endpoint;
    private String transport;
    private Map<String, String> headers;
    private String command;
    private List<String> args;
    private Map<String, String> env;
    private String authType;
    private String authMode;
    private Map<String, Object> authConfig;
    private String testUsername;
    private String testPassword;
    private Boolean hasTestPassword;
    private String testToken;
    private Boolean hasTestToken;
    private Integer deviceAccountCount;
    private Integer enabledDeviceAccountCount;
    private Integer agentCount;
    private Integer enabled;
}
