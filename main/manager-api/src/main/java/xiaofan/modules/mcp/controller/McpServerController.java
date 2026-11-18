package xiaofan.modules.mcp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import xiaofan.common.exception.ErrorCode;
import xiaofan.common.exception.RenException;
import xiaofan.common.utils.Result;
import xiaofan.common.utils.JsonUtils;
import xiaofan.modules.security.user.SecurityUser;
import xiaofan.modules.agent.service.AgentService;
import xiaofan.modules.device.service.DeviceService;
import xiaofan.modules.mcp.dto.AgentMcpServerDTO;
import xiaofan.modules.mcp.dto.DeviceMcpAccountSaveDTO;
import xiaofan.modules.mcp.dto.McpServerDTO;
import xiaofan.modules.mcp.entity.McpServerEntity;
import xiaofan.modules.mcp.dao.McpServerDao;
import xiaofan.modules.mcp.service.McpServerService;

@Validated
@RestController
@RequestMapping("/mcp")
@Tag(name = "Capability MCP")
@AllArgsConstructor
public class McpServerController {
    private final McpServerDao mcpServerDao;
    private final McpServerService mcpServerService;
    private final DeviceService deviceService;
    private final AgentService agentService;

    @GetMapping("/servers/all")
    @Operation(summary = "List all global MCP servers")
    public Result<List<McpServerDTO>> listAll() {
        return new Result<List<McpServerDTO>>().ok(mcpServerService.listAll());
    }

    @GetMapping("/device/{macAddress}/accounts")
    @Operation(summary = "List device MCP accounts")
    @RequiresPermissions("sys:role:normal")
    public Result<List<Map<String, Object>>> listDeviceAccounts(@PathVariable String macAddress) {
        if (deviceService.getOwnedDeviceByMacAddress(macAddress) == null) {
            throw new RenException(ErrorCode.DEVICE_NOT_EXIST);
        }
        return new Result<List<Map<String, Object>>>().ok(mcpServerService.listDeviceAccounts(macAddress));
    }

    @PutMapping("/device/{macAddress}/accounts")
    @Operation(summary = "Save device MCP accounts")
    @RequiresPermissions("sys:role:normal")
    public Result<List<Map<String, Object>>> saveDeviceAccounts(
            @PathVariable String macAddress,
            @RequestBody DeviceMcpAccountSaveDTO dto) {
        if (deviceService.getOwnedDeviceByMacAddress(macAddress) == null) {
            throw new RenException(ErrorCode.DEVICE_NOT_EXIST);
        }
        if (dto == null || !macAddress.equals(dto.getMacAddress())) {
            throw new RenException(ErrorCode.PARAMS_GET_ERROR);
        }
        mcpServerService.saveDeviceAccounts(macAddress, dto.getAccounts(), SecurityUser.getUserId());
        return new Result<List<Map<String, Object>>>().ok(mcpServerService.listDeviceAccounts(macAddress));
    }

    @PostMapping("/servers/test")
    @Operation(summary = "Test a global MCP server")
    public Result<Map<String, Object>> test(@RequestBody McpServerDTO dto) {
        return new Result<Map<String, Object>>().ok(mcpServerService.testConnection(dto));
    }

    @PostMapping("/servers/describe")
    @Operation(summary = "Generate an MCP capability description from tools")
    @RequiresPermissions("sys:role:normal")
    public Result<Map<String, Object>> describe(@RequestBody McpServerDTO dto) {
        return new Result<Map<String, Object>>().ok(mcpServerService.describeCapability(dto));
    }

    @PostMapping("/servers")
    @Operation(summary = "Create a global MCP server")
    public Result<McpServerDTO> create(@RequestBody McpServerDTO dto) {
        validate(dto);
        McpServerEntity entity = new McpServerEntity();
        copy(dto, entity);
        entity.setEnabled(dto.getEnabled() == null ? 1 : dto.getEnabled());
        entity.setCreator(SecurityUser.getUserId());
        entity.setUpdater(SecurityUser.getUserId());
        mcpServerDao.insert(entity);
        dto.setId(entity.getId());
        return new Result<McpServerDTO>().ok(dto);
    }

    @PutMapping("/servers/{id}")
    @Operation(summary = "Update a global MCP server")
    public Result<McpServerDTO> update(@PathVariable String id, @RequestBody McpServerDTO dto) {
        McpServerEntity entity = mcpServerDao.selectById(id);
        if (entity == null) {
            throw new RenException(ErrorCode.RESOURCE_NOT_FOUND);
        }
        validate(dto);
        copy(dto, entity);
        entity.setId(id);
        entity.setEnabled(dto.getEnabled() == null ? entity.getEnabled() : dto.getEnabled());
        entity.setUpdater(SecurityUser.getUserId());
        mcpServerDao.updateById(entity);
        dto.setId(id);
        return new Result<McpServerDTO>().ok(dto);
    }

    @DeleteMapping("/servers/{id}")
    @Operation(summary = "Delete a global MCP server")
    public Result<Void> delete(@PathVariable String id) {
        mcpServerService.deleteByServerId(id);
        mcpServerDao.deleteById(id);
        return new Result<Void>();
    }

    @GetMapping("/agent/{agentId}")
    @Operation(summary = "Get agent MCP authorization")
    public Result<Map<String, Object>> getAgentAuthorization(@PathVariable String agentId) {
        requireAgentPermission(agentId);
        Map<String, Object> result = new HashMap<>();
        result.put("servers", mcpServerService.listEnabled());
        result.put("authorizedServerIds", mcpServerService.getAuthorizedServerIds(agentId));
        return new Result<Map<String, Object>>().ok(result);
    }

    @PutMapping("/agent/{agentId}")
    @Operation(summary = "Update agent MCP authorization")
    public Result<List<String>> saveAgentAuthorization(
            @PathVariable String agentId,
            @RequestBody AgentMcpServerDTO dto) {
        requireAgentPermission(agentId);
        mcpServerService.saveAuthorization(agentId, dto.getServerIds());
        return new Result<List<String>>().ok(mcpServerService.getAuthorizedServerIds(agentId));
    }

    private void requireAgentPermission(String agentId) {
        if (!agentService.checkAgentPermission(agentId, SecurityUser.getUserId())) {
            throw new RenException(ErrorCode.NO_PERMISSION);
        }
    }

    private void validate(McpServerDTO dto) {
        if (dto == null || StringUtils.isBlank(dto.getName())
                || StringUtils.isBlank(dto.getDescription()) || StringUtils.isBlank(dto.getEndpoint())) {
            throw new RenException(ErrorCode.PARAMS_GET_ERROR);
        }
        String transport = StringUtils.defaultIfBlank(dto.getTransport(), "streamable-http");
        String authMode = StringUtils.defaultIfBlank(dto.getAuthMode(), "client");
        if (!"streamable-http".equals(transport) && !"sse".equals(transport) && !"stdio".equals(transport)) {
            throw new RenException(ErrorCode.PARAM_TYPE_INVALID);
        }
        if (!"server".equals(authMode) && !"client".equals(authMode)) {
            throw new RenException(ErrorCode.PARAM_TYPE_INVALID);
        }
        if (!"stdio".equals(transport) && !dto.getEndpoint().startsWith("http://") && !dto.getEndpoint().startsWith("https://")) {
            throw new RenException(ErrorCode.MCP_URL_INVALID);
        }
        try {
            if (dto.getHeaders() != null && !dto.getHeaders().isEmpty()) {
                JsonUtils.toJsonString(dto.getHeaders());
            }
        } catch (Exception e) {
            throw new RenException(ErrorCode.PARAM_JSON_INVALID);
        }
    }

    private String normalizeAuthMode(String authMode) {
        return "server".equals(StringUtils.defaultIfBlank(authMode, "client")) ? "server" : "client";
    }

    private void copy(McpServerDTO dto, McpServerEntity entity) {
        entity.setName(dto.getName());
        entity.setDescription(dto.getDescription());
        entity.setEndpoint(dto.getEndpoint());
        entity.setTransport(StringUtils.defaultIfBlank(dto.getTransport(), "streamable-http"));
        entity.setHeadersJson(dto.getHeaders() == null || dto.getHeaders().isEmpty()
                ? null : JsonUtils.toJsonString(dto.getHeaders()));
        entity.setAuthMode(normalizeAuthMode(dto.getAuthMode()));
        mcpServerService.applyTestCredentials(dto, entity);
    }
}
