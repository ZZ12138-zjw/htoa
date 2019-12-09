package com.ht.service.xiaoen;

import com.ht.vo.employee.EmpVo;
import org.springframework.stereotype.Service;

/**
 * Created by shkstart on 2019/12/9
 * @author LaIWeiChun
 */
public interface IGlobalService {

    /**
     * 登录
     * @param phone
     *          用手机号码做为登录名
     * @param password
     *          密码
     * @return
     */
    EmpVo login(String phone,String password);


    /**
     * 修改密码
     * @param empVo
     */
    void  changPassword(EmpVo empVo);



}
