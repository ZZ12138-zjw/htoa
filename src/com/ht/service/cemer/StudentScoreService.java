package com.ht.service.cemer;

import com.ht.vo.educational.CourseVo;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentClassVo;
import com.ht.vo.student.StudentScoreVo;
import com.ht.vo.student.TestTypeVo;

import java.util.List;

public interface StudentScoreService {
    List stuByClassId(int classid);
    StudentClassVo getById(int classid);
    EmpVo empById(int empId);
    CourseVo courseById(int courseId);
    TestTypeVo typeById(int typeId);
    void addScore(StudentScoreVo studentScoreVo);

}
