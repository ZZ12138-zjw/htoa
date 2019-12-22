package com.ht.service.cemer;

import com.ht.vo.student.holidayStudentVo;

import java.util.List;

public interface StudentHolidayService {
    List selectStuHolidayById(int stuId,int page,int limit);
    int holidayCount(int stuId);
    void saveHoliday(holidayStudentVo holidayStudentVo);

    /**
     * 学生id查询任课老师
     * @param stuId
     * @return
     */
    Integer selectEmpByStuId(int stuId);
    Integer selectEmpByStuId2(int stuId);

    /**
     * 单据id查询单据list
     * @param holidayId
     * @return
     */
    List selectStuHolidayByHid(int holidayId);

    /**
     * 单据id查询单据对象
     * @param hid
     * @return
     */
    holidayStudentVo select(Integer hid);

    /**
     * 修改单据
     *
     * @param holidayStudentVo
     */
    void update(holidayStudentVo holidayStudentVo);
}
