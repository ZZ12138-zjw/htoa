package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IGlobalService;
import com.ht.vo.employee.EmpVo;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.util.List;

/**
 * Created by shkstart on 2019/12/9
 * @author LaiWeiChun
 */
@Service
public class GlobalServiceImpl extends BaseDao implements IGlobalService {


    @Override
    public EmpVo login(String phone, String password) {
       List<EmpVo> list= listByHql("from EmpVo  e where e.phone='"+phone+"'  and e.password='"+password+"'");
       for(EmpVo empVo:list){
           return empVo;
       }
       return null;
    }

    @Override
    public void changPassword(EmpVo empVo) {

    }
}
