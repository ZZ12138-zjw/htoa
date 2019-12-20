package com.ht.service.wj;

import com.ht.vo.employee.WeekCheck;

import java.util.List;

public interface SysreportService {
    List empAssessReport(int currPage, int pageSize);
    int selcount();
    List empAssessXq(int empID);

    List empAttendanceReport(int currPage,int pageSize);
    int selAttcount();

    List dormitoryCount(int currPage,int pageSize);
    int seldormitory();

    List EmployeesLeave(int currPage, int pageSize,WeekCheck weekCheck);
    int selempqj();
    List empqingjiaxq(int empid);
}
