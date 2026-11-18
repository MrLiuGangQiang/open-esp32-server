package xiaofan.modules.sys.controller;

import java.util.*;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.WebSocketHttpHeaders;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import xiaofan.common.annotation.LogOperation;
import xiaofan.common.constant.Constant;
import xiaofan.common.exception.ErrorCode;
import xiaofan.common.exception.RenException;
import xiaofan.common.utils.Result;
import xiaofan.modules.sys.dto.EmitSeverActionDTO;
import xiaofan.modules.sys.dto.ServerActionPayloadDTO;
import xiaofan.modules.sys.dto.ServerActionResponseDTO;
import xiaofan.modules.sys.enums.ServerActionEnum;
import xiaofan.modules.sys.service.SysParamsService;
import xiaofan.modules.sys.utils.WebSocketClientManager;
import xiaofan.modules.device.service.DeviceService;
import xiaofan.common.redis.RedisUtils;

/**
 * 服务端管理控制器
 */
@RestController
@RequestMapping("/admin/server")
@Tag(name = "服务端管理")
@AllArgsConstructor
public class ServerSideManageController {
    private final SysParamsService sysParamsService;
    private final DeviceService deviceService;
    private final RedisUtils redisUtils;
    private static final ObjectMapper objectMapper;
    static {
        objectMapper = new ObjectMapper();
        // 忽略json字符串中存在，但pojo中不存在对应字段的情况
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    @Operation(summary = "获取Ws服务端列表")
    @GetMapping("/server-list")
    @RequiresPermissions("sys:role:superAdmin")
    public Result<List<String>> getWsServerList() {
        String wsText = sysParamsService.getValue(Constant.SERVER_WEBSOCKET, true);
        if (StringUtils.isBlank(wsText)) {
            return new Result<List<String>>().ok(Collections.emptyList());
        }
        return new Result<List<String>>().ok(Arrays.asList(wsText.split(";")));
    }

    @Operation(summary = "Get server-side MCP servers")
    @GetMapping("/mcp-servers")
    @RequiresPermissions("sys:role:superAdmin")
    public Result<List<Map<String, Object>>> getMcpServers() {
        String wsText = sysParamsService.getValue(Constant.SERVER_WEBSOCKET, true);
        if (StringUtils.isBlank(wsText)) {
            return new Result<List<Map<String, Object>>>().ok(Collections.emptyList());
        }

        List<Map<String, Object>> result = new ArrayList<>();
        for (String targetWs : wsText.split(";")) {
            Map<String, Object> item = getMcpServersByWs(targetWs);
            item.put("wsTarget", targetWs);
            result.add(item);
        }
        return new Result<List<Map<String, Object>>>().ok(result);
    }

    @Operation(summary = "Notify Python server to update config")
    @PostMapping("/emit-action")
    @LogOperation("通知python服务端更新配置")
    @RequiresPermissions("sys:role:superAdmin")
    public Result<Boolean> emitServerAction(@RequestBody @Valid EmitSeverActionDTO emitSeverActionDTO) {
        if (emitSeverActionDTO.getAction() == null) {
            throw new RenException(ErrorCode.INVALID_SERVER_ACTION);
        }
        String wsText = sysParamsService.getValue(Constant.SERVER_WEBSOCKET, true);
        if (StringUtils.isBlank(wsText)) {
            throw new RenException(ErrorCode.SERVER_WEBSOCKET_NOT_CONFIGURED);
        }
        String targetWs = emitSeverActionDTO.getTargetWs();
        String[] wsList = wsText.split(";");
        // 找到需要发起的
        if (StringUtils.isBlank(targetWs) || !Arrays.asList(wsList).contains(targetWs)) {
            throw new RenException(ErrorCode.TARGET_WEBSOCKET_NOT_EXIST);
        }
        return new Result<Boolean>().ok(emitServerActionByWs(targetWs, emitSeverActionDTO.getAction()));
    }

    private Boolean emitServerActionByWs(String targetWsUri, ServerActionEnum actionEnum) {
        if (StringUtils.isBlank(targetWsUri) || actionEnum == null) {
            return false;
        }
        String serverSK = sysParamsService.getValue(Constant.SERVER_SECRET, true);

        String deviceId = UUID.randomUUID().toString();
        String clientId = UUID.randomUUID().toString();

        String redisKey = xiaofan.common.redis.RedisKeys.getTmpRegisterMacKey(deviceId);
        redisUtils.set(redisKey, "true", 300); // 5分钟有效期

        WebSocketHttpHeaders headers = new WebSocketHttpHeaders();
        headers.add("device-id", deviceId);
        headers.add("client-id", clientId);
        try {
            String token = deviceService.generateWebSocketToken(clientId, deviceId);
            headers.add("authorization", "Bearer " + token);
        } catch (Exception e) {
            throw new RenException(ErrorCode.WEB_SOCKET_CONNECT_FAILED);
        }

        try (WebSocketClientManager client = new WebSocketClientManager.Builder()
                .connectTimeout(3, TimeUnit.SECONDS)
                .maxSessionDuration(120, TimeUnit.SECONDS)
                .uri(targetWsUri)
                .headers(headers)
                .build()) {
            // 如果连接成功则发送一个json数据包并等待服务端响应
            client.sendJson(
                    ServerActionPayloadDTO.build(
                            actionEnum,
                            Map.of("secret", serverSK)));
            // 等待服务端响应并持续监听信息
            client.listener((jsonText) -> {
                if (StringUtils.isBlank(jsonText)) {
                    return false;
                }
                try {
                    ServerActionResponseDTO response = objectMapper.readValue(jsonText, ServerActionResponseDTO.class);
                    Boolean isSuccess = ServerActionResponseDTO.isSuccess(response);
                    return isSuccess;
                } catch (JsonProcessingException e) {
                    return false;
                }
            });
        } catch (Exception e) {
            // 捕获全部错误，由全局异常处理器返回
            throw new RenException(ErrorCode.WEB_SOCKET_CONNECT_FAILED);
        }
        return true;
    }
    private Map<String, Object> getMcpServersByWs(String targetWsUri) {
        if (StringUtils.isBlank(targetWsUri)) {
            throw new RenException(ErrorCode.TARGET_WEBSOCKET_NOT_EXIST);
        }

        String serverSK = sysParamsService.getValue(Constant.SERVER_SECRET, true);
        String deviceId = UUID.randomUUID().toString();
        String clientId = UUID.randomUUID().toString();
        String redisKey = xiaofan.common.redis.RedisKeys.getTmpRegisterMacKey(deviceId);
        redisUtils.set(redisKey, "true", 300);

        WebSocketHttpHeaders headers = new WebSocketHttpHeaders();
        headers.add("device-id", deviceId);
        headers.add("client-id", clientId);
        try {
            String token = deviceService.generateWebSocketToken(clientId, deviceId);
            headers.add("authorization", "Bearer " + token);
        } catch (Exception e) {
            throw new RenException(ErrorCode.WEB_SOCKET_CONNECT_FAILED);
        }

        try (WebSocketClientManager client = new WebSocketClientManager.Builder()
                .uri(targetWsUri)
                .headers(headers)
                .connectTimeout(3, TimeUnit.SECONDS)
                .maxSessionDuration(30, TimeUnit.SECONDS)
                .build()) {
            ServerActionPayloadDTO payload = ServerActionPayloadDTO.build(
                    ServerActionEnum.GET_MCP_SERVERS, Map.of("secret", serverSK));
            client.sendText(objectMapper.writeValueAsString(payload));

            List<String> messages = client.listener(jsonText -> {
                if (StringUtils.isBlank(jsonText)) {
                    return false;
                }
                try {
                    ServerActionResponseDTO response = objectMapper.readValue(
                            jsonText, ServerActionResponseDTO.class);
                    return response.getStatus() != null
                            && response.getStatus().name().equalsIgnoreCase("SUCCESS")
                            && "server".equals(response.getType())
                            && response.getContent() != null
                            && "get_mcp_servers".equals(response.getContent().get("action"));
                } catch (Exception e) {
                    return false;
                }
            });

            for (String jsonText : messages) {
                ServerActionResponseDTO response = objectMapper.readValue(
                        jsonText, ServerActionResponseDTO.class);
                if (response.getContent() != null
                        && "get_mcp_servers".equals(response.getContent().get("action"))) {
                    Object servers = response.getContent().get("servers");
                    Map<String, Object> result = new HashMap<>();
                    result.put("servers", servers instanceof List ? servers : Collections.emptyList());
                    result.put("connected", true);
                    return result;
                }
            }
            throw new RenException(ErrorCode.WEB_SOCKET_CONNECT_FAILED);
        } catch (RenException e) {
            throw e;
        } catch (Exception e) {
            throw new RenException(ErrorCode.WEB_SOCKET_CONNECT_FAILED);
        }
    }
}
