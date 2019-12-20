package com.ht.service.cemer.Impl;

import com.ht.dao.BaseDao;
import com.ht.service.cemer.StudentHolidayService;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.holidayStudentVo;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public List selectEmpByStuId(int stuId) {
        return listBySQL("select empid from t_emp where empName =(select teacher from t_studentclass where classId  = (select classId from t_student where stuId="+stuId+"))");
    }

    @Override
    public List selectEmpByStuId2(int stuId) {
        return listBySQL("select empid from t_emp where empName =(select classTeacher from t_studentclass where classId=(select classId from t_student where stuId="+stuId+"))");
    }
}
