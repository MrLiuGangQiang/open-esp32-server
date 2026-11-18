package xiaofan.modules.agent.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import xiaofan.common.service.impl.BaseServiceImpl;
import xiaofan.modules.agent.dao.AgentContextProviderDao;
import xiaofan.modules.agent.entity.AgentContextProviderEntity;
import xiaofan.modules.agent.service.AgentContextProviderService;

@Service
public class AgentContextProviderServiceImpl extends BaseServiceImpl<AgentContextProviderDao, AgentContextProviderEntity> implements AgentContextProviderService {

    @Override
    public AgentContextProviderEntity getByAgentId(String agentId) {
        return baseDao.selectList(new QueryWrapper<AgentContextProviderEntity>().eq("agent_id", agentId)).stream().findFirst().orElse(null);
    }

    @Override
    public void saveOrUpdateByAgentId(AgentContextProviderEntity entity) {
        AgentContextProviderEntity exist = getByAgentId(entity.getAgentId());
        if (exist != null) {
            entity.setId(exist.getId());
            updateById(entity);
        } else {
            insert(entity);
        }
    }

    @Override
    public void deleteByAgentId(String agentId) {
        baseDao.delete(new QueryWrapper<AgentContextProviderEntity>().eq("agent_id", agentId));
    }
}
