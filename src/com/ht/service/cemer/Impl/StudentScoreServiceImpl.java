package com.ht.service.cemer.Impl;

import com.ht.dao.BaseDao;
import com.ht.service.cemer.StudentScoreService;
import com.ht.vo.educational.CourseVo;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentClassVo;
import com.ht.vo.student.StudentScoreVo;
import com.ht.vo.student.TestTypeVo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentScoreServiceImpl extends BaseDao implements StudentScoreService {


    @Override
    public List stuByClassId(int classid) {
        return listBySQL("select stuId,stuName from t_student where classid="+classid);
    }

    @Override
    public StudentClassVo getById(int classid) {
        return (StudentClassVo)getObject(StudentClassVo.class,classid);
    }

    @Override
    public EmpVo empById(int empId) {
        return (EmpVo)getObject(EmpVo.class,empId);
    }

    @Override
    public CourseVo courseById(int courseId) {
        return (CourseVo)getObject(CourseVo.class,courseId);
    }

    @Override
    public TestTypeVo typeById(int typeId) {
        return (TestTypeVo)getObject(TestTypeVo.class,typeId);
    }

    @Override
    public void addScore(StudentScoreVo studentScoreVo) {
        addObject(studentScoreVo);
    }
}
