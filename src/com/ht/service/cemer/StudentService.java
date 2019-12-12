//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.ht.service.cemer;

import com.ht.vo.student.*;

import java.util.List;

public interface StudentService {
    List getStudentInfo();

    List pageGetStudentInfo(int currPage, int pageSize);

    List getAllHuor();

    List getAllClass();

    void addStuVo(StudentVo var1);

    StudentVo getById(int stuId);

    void updStu(StudentVo studentVo);

    void delStu(StudentVo studentVo);

    List selectStuFamily(int stuId);

    List selectStuEdu(int stuId);

    List selectStuHap(int stuId);

    List selectHoliday(int stuId);

    List selectReplyScore(int stuId);

    List selectScore(int stuId);

    void addStuFal(StudentFamily studentFamily);

    void addStuEdu(StudentEduVo studentEduVo);

    void addStuHap(StudentHappeningVo studentHappeningVo);

    void addStuHoliday(holidayStudentVo holidayStudentVo);

    void addStuReScore(StudentReplyScoreVo studentReplyScoreVo);

    void addStuScore(StudentScoreVo studentScoreVo);

    List selectAllEmp();

    List selectAllReplyScore();

    List selectAllTerm();

    List selectAllTestType();

    List selectAllCourse();

    List selectAllFall();

    List selectAllClass();

    List selectAllHour();

    List selectBySearch(int page,int size,StudentSearch studentSearch);

    int selectBySearchCount(StudentSearch studentSearch);
}
