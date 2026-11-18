package xiaofan.modules.sys.dao;

import org.apache.ibatis.annotations.Mapper;

import xiaofan.common.dao.BaseDao;
import xiaofan.modules.sys.entity.SysUserEntity;

/**
 * 系统用户
 */
@Mapper
public interface SysUserDao extends BaseDao<SysUserEntity> {

}