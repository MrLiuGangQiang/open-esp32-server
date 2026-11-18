package xiaofan.modules.mcp.service.impl;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import xiaofan.modules.mcp.dao.AgentMcpServerDao;
import xiaofan.modules.mcp.dao.McpDeviceAccountDao;
import xiaofan.modules.mcp.dao.McpServerDao;
import xiaofan.modules.mcp.dto.DeviceMcpAccountSaveDTO.DeviceAccountItem;
import xiaofan.modules.mcp.entity.McpDeviceAccountEntity;
import xiaofan.modules.mcp.entity.McpServerEntity;
import xiaofan.modules.llm.service.LLMService;
import xiaofan.modules.sys.service.SysParamsService;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class McpServerServiceImplTest {
    @Test
    void saveDeviceAccountsKeepsExistingPasswordWhenFormLeavesItBlank() {
        McpServerDao mcpServerDao = mock(McpServerDao.class);
        McpDeviceAccountDao accountDao = mock(McpDeviceAccountDao.class);
        SysParamsService paramsService = mock(SysParamsService.class);
        McpServerServiceImpl service = new McpServerServiceImpl(
                mcpServerDao, mock(AgentMcpServerDao.class), accountDao, paramsService, mock(LLMService.class));

        when(mcpServerDao.selectById("server-1")).thenReturn(new McpServerEntity());
        McpDeviceAccountEntity existing = new McpDeviceAccountEntity();
        existing.setMacAddress("AA:BB:CC:DD:EE:FF");
        existing.setServerId("server-1");
        existing.setUsername("old-user");
        existing.setPasswordCipher("existing-cipher");
        existing.setEnabled(1);
        when(accountDao.selectList(any())).thenReturn(List.of(existing));

        DeviceAccountItem item = new DeviceAccountItem();
        item.setServerId("server-1");
        item.setUsername("device-user");
        item.setPassword("");
        item.setEnabled(1);
        service.saveDeviceAccounts("AA:BB:CC:DD:EE:FF", List.of(item), 7L);

        ArgumentCaptor<McpDeviceAccountEntity> captor =
                ArgumentCaptor.forClass(McpDeviceAccountEntity.class);
        verify(accountDao, times(1)).insert(captor.capture());
        McpDeviceAccountEntity saved = captor.getValue();
        assertEquals("AA:BB:CC:DD:EE:FF", saved.getMacAddress());
        assertEquals("server-1", saved.getServerId());
        assertEquals("device-user", saved.getUsername());
        assertEquals("existing-cipher", saved.getPasswordCipher());
        assertEquals(7L, saved.getCreator());
    }
}
