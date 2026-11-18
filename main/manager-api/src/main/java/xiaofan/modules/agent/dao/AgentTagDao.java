package xiaofan.modules.agent.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xiaofan.common.dao.BaseDao;
import xiaofan.modules.agent.entity.AgentTagEntity;

import java.util.List;

@Mapper
public interface AgentTagDao extends BaseDao<AgentTagEntity> {

    List<AgentTagEntity> selectByAgentId(@Param("agentId") String agentId);

    List<AgentTagEntity> selectByAgentIds(@Param("agentIds") List<String> agentIds);

    List<AgentTagEntity> selectAll();

    List<String> selectAgentIdsByTagName(@Param("tagName") String tagName);

    List<AgentTagEntity> selectByTagNames(@Param("tagNames") List<String> tagNames);

    int batchInsert(@Param("list") List<AgentTagEntity> tagList);
}
