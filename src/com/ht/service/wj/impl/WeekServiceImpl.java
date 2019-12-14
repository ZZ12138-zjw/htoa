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
        String sql = "select w.*,d.depName,e.empName from t_weekly w left join t_emp e on w.empid = e.empId left join t_dept d on e.deptId = d.depid";
        if (weekCheck.getDepName() != null && !"".equals(weekCheck.getDepName())){
            sql+=" where d.depName='"+weekCheck.getDepName()+"'";
        }
        if (weekCheck.getEmpName() != null && !"".equals(weekCheck.getEmpName())){
            sql+=" where e.empName='"+weekCheck.getEmpName()+"'";
        }
        return pageBySQL(sql,currPage,pageSize);
    }

    @Override
    public int selCount() {
        return selTotalRow("select count(*) from t_weekly");
    }
}
