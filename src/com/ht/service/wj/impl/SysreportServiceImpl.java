package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.SysreportService;
import com.ht.vo.employee.WeekCheck;
import com.ht.vo.student.HourNameSearch;
import com.ht.vo.student.StuqjSearch;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysreportServiceImpl extends BaseDao implements SysreportService {

    @Override
    public List empAssessReport(int currPage, int pageSize,WeekCheck weekCheck) {
        String sql = "select e.empID,e.empName,d.depName,d.depid,e.sex,e.phone,sum(ch.checkScore) as ascore from t_emp e left join checkinsert ch on e.empId = ch.empID  left join t_dept d on e.deptId = d.depid group by e.empName";
        if(weekCheck.getEmpName() != null && !"".equals(weekCheck.getEmpName())){
            sql+=" having e.empName='"+weekCheck.getEmpName()+"'";
        }else {
            sql+=" having 1=1";
        }
        if (weekCheck.getDepid() != null && !"".equals(weekCheck.getDepid())){
            sql+=" and d.depid ='"+weekCheck.getDepid()+"'";
        }
        return pageBySQL(sql,currPage,pageSize);
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
    public List empAttendanceReport(int currPage, int pageSize,WeekCheck weekCheck) {
        String sql="select * from t_attendance";
        if (weekCheck.getEmpName() != null && !"".equals(weekCheck.getEmpName())){
            sql+=" where empName='"+weekCheck.getEmpName()+"'";
        }
        return pageBySQL(sql,currPage,pageSize);
    }

    @Override
    public int selAttcount() {
        return selTotalRow("select count(*) from t_attendance");
    }

    @Override
    public List dormitoryCount(int currPage, int pageSize, HourNameSearch hourNameSearch) {
        String sql = "select fo.floorName,ho.hourName,ho.addr,count(s.stuName)stucount,ho.numberBeds,(ho.numberBeds-count(s.stuName))kws from t_studenthuor ho left join t_studentfloor fo on ho.floorId = fo.floorId \n" +
                "left join t_student s on s.hourid = ho.hourId group by ho.hourName";
        if (hourNameSearch.getHourName() != null && !"".equals(hourNameSearch.getHourName())){
            sql+=" having ho.hourName='"+hourNameSearch.getHourName()+"'";
        }
        return pageBySQL(sql,currPage,pageSize);
    }

    @Override
    public int seldormitory() {
        return selTotalRow("select count(*) from t_studentHuor");
    }

    @Override
    public List selfloorList() {
        return listByHql("from StudentFloorVo");
    }

    @Override
    public List hourNameList(int floorId) {
        return listBySQL("select hourName,hourId from t_studenthuor where floorId=" + floorId);
    }

    @Override
    public List EmployeesLeave(int currPage, int pageSize,WeekCheck weekCheck) {
        String sql = "select hy.empid,e.empName,count(*)qjcs,sum(hy.holidayDay)tshu from t_holiday hy left join t_emp e on hy.empid = e.empId group by e.empName";
        if (weekCheck.getEmpName() != null && !"".equals(weekCheck.getEmpName())){
            sql+=" having e.empName='"+weekCheck.getEmpName()+"'";
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

    @Override
    public List StuloyeesLeave(int currPage, int pageSize, StuqjSearch stuqjSearch) {
        String sql = "select hs.studentId,s.stuName,count(*)qjcs from holidaystudent hs left join t_student s on hs.studentId = s.stuId group by s.stuName";
        if (stuqjSearch.getStuName() != null && !"".equals(stuqjSearch.getStuName())){
            sql+=" having stuName='"+stuqjSearch.getStuName()+"'";
        }
        return pageBySQL(sql,currPage,pageSize);
    }

    @Override
    public int selstuqj() {
        return selTotalRow("select count(*) from (select hs.studentId,s.stuName,count(*)qjcs from holidaystudent hs left join t_student s on hs.studentId = s.stuId group by s.stuName)count");
    }

    @Override
    public List stuqingjiaxq(int studentId) {
        return listBySQL("select s.stuName,hs.holidayDay,hs.startTime,hs.endTime,hs.title,hs.remark,hs.status from holidaystudent hs left join t_student s on hs.studentId = s.stuId where hs.studentId=" + studentId);
    }
}
