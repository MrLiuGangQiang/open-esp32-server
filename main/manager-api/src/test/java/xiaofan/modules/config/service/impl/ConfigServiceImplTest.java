package xiaofan.modules.config.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertInstanceOf;
import static org.junit.jupiter.api.Assertions.assertNotSame;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.mockito.ArgumentMatchers.anyMap;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import xiaofan.common.redis.RedisKeys;
import xiaofan.common.redis.RedisUtils;
import xiaofan.modules.agent.dao.AgentVoicePrintDao;
import xiaofan.modules.agent.service.AgentContextProviderService;
import xiaofan.modules.agent.service.AgentMcpAccessPointService;
import xiaofan.modules.agent.service.AgentPluginMappingService;
import xiaofan.modules.agent.service.AgentService;
import xiaofan.modules.agent.service.AgentTemplateService;
import xiaofan.modules.correctword.service.CorrectWordFileService;
import xiaofan.modules.device.service.DeviceService;
import xiaofan.modules.model.service.ModelConfigService;
import xiaofan.modules.mcp.service.McpServerService;
import xiaofan.modules.sys.dto.SysParamsDTO;
import xiaofan.modules.sys.service.SysParamsService;
import xiaofan.modules.timbre.service.TimbreService;
import xiaofan.modules.voiceclone.service.VoiceCloneService;

class ConfigServiceImplTest {

    @Test
    void cachedServerConfigIsCheckedAsAStringKeyedMapWithoutChangingNestedValues() {
        RedisUtils redisUtils = mock(RedisUtils.class);
        Map<String, Object> nested = new HashMap<>();
        nested.put("enabled", true);
        Map<String, Object> cached = new HashMap<>();
        cached.put("features", nested);
        when(redisUtils.get(RedisKeys.getServerConfigKey())).thenReturn(cached);

        ConfigServiceImpl service = newService(mock(SysParamsService.class), redisUtils);

        Map<String, Object> result = service.getConfig(true);

        assertNotSame(cached, result);
        assertSame(nested, result.get("features"));
        assertEquals(true, ((Map<?, ?>) result.get("features")).get("enabled"));
    }

    @Test
    void nestedSystemParametersStillShareAndPopulateTheSameConfigBranch() {
        SysParamsService sysParamsService = mock(SysParamsService.class);
        SysParamsDTO enabled = parameter("server.features.enabled", "true", "boolean");
        SysParamsDTO labels = parameter("server.features.labels", "first;second", "array");
        when(sysParamsService.list(anyMap())).thenReturn(List.of(enabled, labels));
        ConfigServiceImpl service = newService(sysParamsService, mock(RedisUtils.class));
        Map<String, Object> config = new HashMap<>();

        Object returned = ReflectionTestUtils.invokeMethod(service, "buildConfig", config);

        assertSame(config, returned);
        Map<?, ?> server = assertInstanceOf(Map.class, config.get("server"));
        Map<?, ?> features = assertInstanceOf(Map.class, server.get("features"));
        assertEquals(true, features.get("enabled"));
        assertEquals(List.of("first", "second"), features.get("labels"));
    }

    @Test
    void blankAssistantNameFallsBackToXiaofanBrand() {
        ConfigServiceImpl service = newService(mock(SysParamsService.class), mock(RedisUtils.class));
        Map<String, Object> result = new HashMap<>();

        ReflectionTestUtils.invokeMethod(service, "buildModuleConfig",
                null, "\u4f60\u597d\uff0c{{assistant_name}}", null, null, null, null, null,
                null, null, null, null, null, null, null, null, null, null, null, null,
                result, true);

        assertEquals("\u4f60\u597d\uff0c\u5c0f\u51e1", result.get("prompt"));
    }

    private static SysParamsDTO parameter(String code, String value, String type) {
        SysParamsDTO parameter = new SysParamsDTO();
        parameter.setParamCode(code);
        parameter.setParamValue(value);
        parameter.setValueType(type);
        return parameter;
    }

    private static ConfigServiceImpl newService(SysParamsService sysParamsService, RedisUtils redisUtils) {
        return new ConfigServiceImpl(
                sysParamsService,
                mock(DeviceService.class),
                mock(ModelConfigService.class),
                mock(AgentService.class),
                mock(AgentTemplateService.class),
                redisUtils,
                mock(TimbreService.class),
                mock(AgentPluginMappingService.class),
                mock(AgentMcpAccessPointService.class),
                mock(AgentContextProviderService.class),
                mock(VoiceCloneService.class),
                mock(AgentVoicePrintDao.class),
                mock(CorrectWordFileService.class),
                mock(McpServerService.class));
    }
}
