package com.ht.service.cemer;

import com.ht.vo.student.holidayStudentVo;

import java.util.List;

public interface StudentHolidayService {
    List selectStuHolidayById(int stuId,int page,int limit);
    int holidayCount(int stuId);
    void saveHoliday(holidayStudentVo holidayStudentVo);
    List selectEmpByStuId(int stuId);
    List selectEmpByStuId2(int stuId);
}
