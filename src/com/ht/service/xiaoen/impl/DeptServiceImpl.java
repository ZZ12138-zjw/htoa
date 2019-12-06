package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IDeptService;
import com.ht.vo.employee.DeptVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shkstart on 2019/12/4
 * @author LaiWeiChun
 */
@Service
public class DeptServiceImpl  extends BaseDao implements IDeptService {


    @Override
    public List<DeptVo> selectAll() {
        return listByHql("from DeptVo");
    }

    @Override
    public void delete(DeptVo deptVo) {
        delObject(deptVo);
    }


    @Override
    public void update(DeptVo deptVo) {
        updObject(deptVo);
    }

    @Override
    public DeptVo select(Integer deptId) {
        return (DeptVo)getObject(DeptVo.class,deptId);
    }

    @Override
    public List<DeptVo> selectPage(int currPage, int pageSize) {
        return pageByHql("from DeptVo ",currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_dept");
    }

    @Override
    public void save(DeptVo deptVo) {
        addObject(deptVo);
    }

    @Override
    public void delAll(String depIds) {
        executeSQL("delete from t_dept where depid in ("+depIds+")");
    }


}
