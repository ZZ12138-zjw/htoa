package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.WeekService;
import com.ht.vo.employee.WeekCheck;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WeekServiceImpl extends BaseDao implements WeekService {
    @Override
    public List selWeek(int currPage, int pageSize, WeekCheck weekCheck) {
        System.out.println("开始时间" + weekCheck.getStartDay());
        System.out.println("结束时间" + weekCheck.getEndDay());
        String sql = "select w.*,e.empName from t_weekly w left join t_emp e on w.empid = e.empId ";
        if (weekCheck.getDepid() != null && !"".equals(weekCheck.getDepid())){
            sql+=" where w.empid in(select e.empId from t_emp where e.deptId ='"+weekCheck.getDepid()+"')";
        }else {
            sql+=" where 1=1";
        }
        if (weekCheck.getEmpName() != null && !"".equals(weekCheck.getEmpName())){
            sql+=" and e.empName='"+weekCheck.getEmpName()+"'";
        }
        if(weekCheck.getStartDay() != null && !"".equals(weekCheck.getStartDay()) && weekCheck.getEndDay() != null && !"".equals(weekCheck.getEndDay())){
            sql+=" and w.workday between '"+weekCheck.getStartDay()+"' and '"+weekCheck.getEndDay()+"'";
        }
        return pageBySQL(sql,currPage,pageSize);
    }

    @Override
    public int selCount() {
        return selTotalRow("select count(*) from t_weekly");
    }
}
