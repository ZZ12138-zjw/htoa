package com.ht.service.cemer.Impl;

import com.ht.dao.BaseDao;
import com.ht.service.cemer.StudentHolidayService;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.holidayStudentVo;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentHolidayServiceImpl extends BaseDao implements StudentHolidayService {
    @Override
    public List selectStuHolidayById(int stuId,int page,int limit) {
        return pageByHql("from holidayStudentVo where StudentId="+stuId,page,limit);
    }

    @Override
    public int holidayCount(int stuId) {
        return listByHql("from holidayStudentVo where StudentId="+stuId).size();
    }

    @Override
    public void saveHoliday(holidayStudentVo holidayStudentVo) {
            addObject(holidayStudentVo);
    }

    @Override
    public Integer selectEmpByStuId(int stuId) {
        Map map =(Map)listBySQL("select empid from t_emp where empName =(select teacher from t_studentclass where classId  = (select classId from t_student where stuId=" + stuId + "))").get(0);
        return (Integer)map.get("empid");

    }

    @Override
    public Integer selectEmpByStuId2(int stuId) {
        Map map =(HashMap)listBySQL("select empid from t_emp where empName =(select classTeacher from t_studentclass where classId=(select classId from t_student where stuId=" + stuId + "))").get(0);
        return (Integer)map.get("empid");

    }

    @Override
    public List selectStuHolidayByHid(int holidayId) {
        return listBySQL("select h.*,s.stuName from t_student s left join holidaystudent  h on s.stuId=h.studentId where h.holidayId="+holidayId);
    }

    @Override
    public holidayStudentVo select(Integer hid) {
        return (holidayStudentVo)getObject(holidayStudentVo.class,hid);
    }

    @Override
    public void update(holidayStudentVo holidayStudentVo) {
        updObject(holidayStudentVo);
    }


}
