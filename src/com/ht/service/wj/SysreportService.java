package com.ht.service.wj;

import com.ht.vo.employee.WeekCheck;
import com.ht.vo.student.HourNameSearch;

import java.util.List;

public interface SysreportService {
    List empAssessReport(int currPage, int pageSize,WeekCheck weekCheck);
    int selcount();
    List empAssessXq(int empID);

    List empAttendanceReport(int currPage,int pageSize,WeekCheck weekCheck);
    int selAttcount();

    List dormitoryCount(int currPage, int pageSize, HourNameSearch hourNameSearch);
    int seldormitory();
    List selfloorList();
    List hourNameList(int floorId);

    List EmployeesLeave(int currPage, int pageSize,WeekCheck weekCheck);
    int selempqj();
    List empqingjiaxq(int empid);
}
