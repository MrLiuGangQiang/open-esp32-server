package xiaofan.modules.correctword.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import xiaofan.common.dao.BaseDao;
import xiaofan.modules.correctword.entity.CorrectWordItemEntity;

@Mapper
public interface CorrectWordItemDao extends BaseDao<CorrectWordItemEntity> {

    int batchInsert(@Param("list") List<CorrectWordItemEntity> items);
}
