package xiaofan.modules.security.service.impl;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import xiaofan.modules.security.dao.SysUserTokenDao;
import xiaofan.modules.security.entity.SysUserTokenEntity;
import xiaofan.modules.security.service.ShiroService;
import xiaofan.modules.sys.dao.SysUserDao;
import xiaofan.modules.sys.entity.SysUserEntity;

@AllArgsConstructor
@Service
public class ShiroServiceImpl implements ShiroService {
    private final SysUserDao sysUserDao;
    private final SysUserTokenDao sysUserTokenDao;

    @Override
    public SysUserTokenEntity getByToken(String token) {
        return sysUserTokenDao.getByToken(token);
    }

    @Override
    public SysUserEntity getUser(Long userId) {
        return sysUserDao.selectById(userId);
    }
}