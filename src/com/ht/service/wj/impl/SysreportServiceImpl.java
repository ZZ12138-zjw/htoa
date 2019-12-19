package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.SysreportService;
import com.ht.vo.employee.WeekCheck;
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
        return pageBySQL("select fo.floorName,ho.hourName,ho.addr,count(s.hourid)stucount,ho.numberBeds from t_studentHuor ho left join t_studentFloor fo on ho.floorId = fo.floorId \n" +
                "left join t_student s on s.hourid = ho.hourId group by ho.hourName",currPage,pageSize);
    }

    @Override
    public int seldormitory() {
        return selTotalRow("select count(*) from t_studentHuor");
    }

    @Override
    public List EmployeesLeave(int currPage, int pageSize,WeekCheck weekCheck) {
        String sql = "select hy.empid,e.empName,count(*)qjcs,sum(hy.holidayDay)tshu from t_holiday hy left join t_emp e on hy.empid = e.empId group by e.empName";
        if (weekCheck.getEmpName() != null && !"".equals(weekCheck.getEmpName())){
            sql="select hy.empid,e.empName,count(*)qjcs,sum(hy.holidayDay)tshu from t_holiday hy left join t_emp e on hy.empid = e.empId where e.empName='"+weekCheck.getEmpName()+"'group by e.empName";
        }
        return pageBySQL(sql,currPage,pageSize);
    }

    @Override
    public int selempqj() {
        return selTotalRow("select count(*) from (select hy.empid,e.empName,count(*)qjcs,sum(hy.holidayDay)tshu from t_holiday hy left join t_emp e on hy.empid = e.empId group by e.empName)count");
    }

    @Override
    public List empqingjiaxq(int empid) {
        return listBySQL("select e.empName,hy.holidayDay,hy.startTime,hy.endTime,hy.title,hy.remark,hy.status from t_holiday hy left join t_emp e on hy.empid = e.empId where hy.empid=" + empid);
    }
}
