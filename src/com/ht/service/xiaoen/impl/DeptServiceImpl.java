package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IDeptService;
import com.ht.vo.employee.DeptVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by shkstart on 2019/12/4
 * @author LaiWeiChun
 */
@Service
public class DeptServiceImpl   extends BaseDao implements IDeptService {


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
        return pageBySQL("select d.depid,d.depName,d.parentId,e.empName,d.remark from t_dept d left join t_emp e on d.chairman=e.empId",currPage,pageSize);
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

    @Override
    public String selectChairman(Integer deptId) {
        String chairman="";
        List<DeptVo> list = listByHql("from DeptVo d where d.depid='" + deptId + "'");
        for (DeptVo deptVo:list){
            chairman=deptVo.getChairman();
        }
        return chairman;
    }

    @Override
    public String selectChairmanName(Integer deptId) {
       List list=listBySQL("select e.empName from t_dept d left join t_emp e on d.chairman=e.empId where depid="+deptId);
       Map map=(Map)list.get(0);
       return (String) map.get("empName");
    }



}
