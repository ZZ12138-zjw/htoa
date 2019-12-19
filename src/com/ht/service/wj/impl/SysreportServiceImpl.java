package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.SysreportService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysreportServiceImpl extends BaseDao implements SysreportService {

    @Override
    public List empAssessReport(int currPage, int pageSize) {
        return pageBySQL("select e.empID,e.empName,d.depName,e.sex,e.phone,sum(ch.checkScore) as ascore from t_emp e left join checkinsert ch on e.empId = ch.empID  left join t_dept d on e.deptId = d.depid group by e.empName",currPage,pageSize);
    }

    @Override
    public int selcount() {
        return selTotalRow("select count(*) from t_emp");
    }

    @Override
    public List empAssessXq(int empID) {
        return listBySQL("\n" +
                "select checkContent,empName,checkScore,checkDate,imageName,inputEmp,checkExplain from checkinsert where empID=" + empID);
    }

    @Override
    public List empAttendanceReport(int currPage, int pageSize) {
        return pageBySQL("select * from t_attendance",currPage,pageSize);
    }

    @Override
    public int selAttcount() {
        return selTotalRow("select count(*) from t_attendance");
    }

    @Override
    public List dormitoryCount(int currPage, int pageSize) {
        return pageBySQL("select from rr",currPage,pageSize);
    }

    @Override
    public int seldormitory() {
        return 0;
    }
}
