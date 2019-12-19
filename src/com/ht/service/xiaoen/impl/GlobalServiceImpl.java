package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IGlobalService;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentVo;
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

    @Override
    public StudentVo stuLogin(String phone, String password) {
        List<StudentVo> list = listByHql("from StudentVo s where s.phone='" + phone + "' and s.password='" + password + "'");
        for (StudentVo s:list){
            return s;
        }
        return null;
    }
}
