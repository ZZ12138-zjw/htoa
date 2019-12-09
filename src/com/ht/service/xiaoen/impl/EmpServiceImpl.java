package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.employee.DeptVo;
import com.ht.vo.employee.EmpCkBean;
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
        return (EmpVo)getObject(EmpVo.class,empVo.getEmpId());
    }

    @Override
    public List<EmpVo> selectPage(int currPage, int pageSize, EmpCkBean empCk) {
        String sql="select e.*,d.depName from t_emp e left join t_dept d on e.deptid=d.depid";
        if (empCk.getDepName()!=null && !"".equals(empCk.getDepName())){
            sql+=" where d.depName='"+empCk.getDepName()+"'";
        }else {
            sql+=" where 1=1";
        }
        if (empCk.getEmpName()!=null && !"".equals(empCk.getEmpName())){
            sql+=" and e.empName='"+empCk.getEmpName()+"'";
        }
        if (empCk.getPhone()!=null && !"".equals(empCk.getPhone())){
            sql+=" and e.phone='"+empCk.getPhone()+"'";
        }
        if (empCk.getStatus()!=null && !"".equals(empCk.getStatus())){
            sql+=" and e.status="+empCk.getStatus();
        }
        if (empCk.getPostName()!=null && !"".equals(empCk.getPostName())){
            sql+=" and e.postName='"+empCk.getPostName()+"'";
        }
        return pageBySQL(sql,currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_emp");
    }

    @Override
    public void save(EmpVo empVo) {
        addObject(empVo);
    }

    @Override
    public void udtStatus(int empId,int status) {
        executeSQL("update t_emp set status='"+status+"' where empid="+empId);
    }

    @Override
    public void resetPwd(int empId) {
        executeSQL("update t_emp set password='"+123456+"' where empid="+empId);
    }



}
