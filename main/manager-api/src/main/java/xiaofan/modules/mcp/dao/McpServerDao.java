package xiaofan.modules.mcp.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import xiaofan.modules.mcp.entity.McpServerEntity;

@Mapper
public interface McpServerDao extends BaseMapper<McpServerEntity> {
}
