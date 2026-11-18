package xiaofan.modules.knowledge.dao;

import org.apache.ibatis.annotations.Mapper;
import xiaofan.common.dao.BaseDao;
import xiaofan.modules.knowledge.entity.DocumentEntity;

/**
 * 文档 DAO
 */
@Mapper
public interface DocumentDao extends BaseDao<DocumentEntity> {
}
