package xiaofan.modules.security.service;

import xiaofan.common.page.TokenDTO;
import xiaofan.common.service.BaseService;
import xiaofan.common.utils.Result;
import xiaofan.modules.security.entity.SysUserTokenEntity;
import xiaofan.modules.sys.dto.PasswordDTO;
import xiaofan.modules.sys.dto.SysUserDTO;

/**
 * 用户Token
 * Copyright (c) 人人开源 All rights reserved.
 * Website: https://www.renren.io
 */
public interface SysUserTokenService extends BaseService<SysUserTokenEntity> {

    /**
     * 生成token
     *
     * @param userId 用户ID
     */
    Result<TokenDTO> createToken(Long userId);

    /**
     * 用旧token换新token，旧token立即失效
     *
     * @param oldToken 旧token字符串
     */
    Result<TokenDTO> refreshToken(String oldToken);

    SysUserDTO getUserByToken(String token);

    /**
     * 退出
     *
     * @param userId 用户ID
     */
    void logout(Long userId);

    /**
     * 修改密码
     *
     * @param userId
     * @param passwordDTO
     */
    void changePassword(Long userId, PasswordDTO passwordDTO);

}