package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.employee.DeptVo;
import com.ht.vo.employee.EmpVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shkstart on 2019/12/5
 * @author LaiWeiChun
 */
@Service
public class EmpServiceImpl extends BaseDao implements IEmpService {


    @Override
    public List<EmpVo> selectAll() {
        return listByHql("from EmpVo");
    }

    @Override
    public void delete(EmpVo empVo) {
        delObject(empVo);
    }

    @Override
    public void update(EmpVo empVo) {
            updObject(empVo);
    }

    @Override
    public EmpVo select(EmpVo empVo) {
        return (EmpVo)getObject(EmpVo.class,Integer.parseInt(empVo.getEmpId()));
    }

    @Override
    public List<EmpVo> selectPage(int currPage, int pageSize) {
        return pageByHql("from EmpVo",currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_emp");
    }

    @Override
    public void save(EmpVo empVo) {
        addObject(empVo);
    }
}
