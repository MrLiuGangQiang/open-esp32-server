package xiaofan.modules.mcp.service;

import java.util.List;
import java.util.Map;

import xiaofan.modules.mcp.dto.DeviceMcpAccountSaveDTO;
import xiaofan.modules.mcp.dto.McpServerDTO;

public interface McpServerService {
    List<McpServerDTO> listAll();
    List<McpServerDTO> listEnabled();
    List<Map<String, Object>> runtimeServers(List<String> authorizedIds);
    List<String> getAuthorizedServerIds(String agentId);
    void saveAuthorization(String agentId, List<String> serverIds);
    void deleteByServerId(String serverId);
    Map<String, Object> testConnection(McpServerDTO dto);
    void applyTestCredentials(McpServerDTO dto, xiaofan.modules.mcp.entity.McpServerEntity entity);
    Map<String, Object> describeCapability(McpServerDTO dto);
    List<Map<String, Object>> listDeviceAccounts(String macAddress);
    List<Map<String, Object>> runtimeDeviceAccounts(String macAddress, List<String> authorizedIds);
    void saveDeviceAccounts(String macAddress, List<DeviceMcpAccountSaveDTO.DeviceAccountItem> accounts, Long userId);
}
