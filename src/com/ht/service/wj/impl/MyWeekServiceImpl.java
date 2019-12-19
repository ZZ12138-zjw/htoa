package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.MyWeekService;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.WeekCheck;
import com.ht.vo.employee.WeeklyVo;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service
public class MyWeekServiceImpl extends BaseDao implements MyWeekService {

    @Override
    public List selweek(int currPage, int pageSize, Integer empid, HttpSession session, WeekCheck weekCheck) {
        EmpVo empVo = (EmpVo)session.getAttribute("empVo");
        empid = empVo.getEmpId();
        String sql = "select w.*,e.empName from t_weekly w left join t_emp e on w.empid = e.empId where w.empid=" + empid;
        if(weekCheck.getStartDay() != null && !"".equals(weekCheck.getStartDay()) && weekCheck.getEndDay() != null && !"".equals(weekCheck.getEndDay())){
            sql+=" and w.workday between '"+weekCheck.getStartDay()+"' and '"+weekCheck.getEndDay()+"'";
        }
        return pageBySQL(sql,currPage,pageSize);
    }

    @Override
    public void addweek(WeeklyVo weeklyVo) {
        addObject(weeklyVo);
    }

    @Override
    public int selCount(HttpSession session,Integer empid) {
        EmpVo empVo = (EmpVo)session.getAttribute("empVo");
        empid = empVo.getEmpId();
        return selTotalRow("select count(*) from t_weekly where empid=" + empid);
    }

    @Override
    public void delete(WeeklyVo weeklyVo) {
        delObject(weeklyVo);
    }

    @Override
    public void update(WeeklyVo weeklyVo) {
        updObject(weeklyVo);
    }

    @Override
    public WeeklyVo selbyid(WeeklyVo weeklyVo) {
        return (WeeklyVo) getObject(weeklyVo.getClass(),weeklyVo.getWorklogid());
    }

    @Override
    public void deletes(String id) {
        executeSQL("delete from t_weekly where worklogid in("+id+")");
    }

    @Override
    public List mlist(int worklogid) {
        return listBySQL("select w.*,e.empName,d.depName from t_weekly w left join t_emp e on w.empid = e.empId left join t_dept d on e.deptId = d.depid where w.worklogid=" + worklogid);
    }
}
