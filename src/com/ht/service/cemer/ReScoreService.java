package com.ht.service.cemer;

import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.ReScoreCheck;
import com.ht.vo.student.ReplyScoreVo;
import com.ht.vo.student.StudentClassVo;
import com.ht.vo.student.StudentReplyScoreVo;

import java.util.List;

public interface ReScoreService {
    List selectAllProject();

    int getByCheckCount(ReScoreCheck scoreCheck);

    List getByCheck(ReScoreCheck reScoreCheck,int page,int limit);

    List getStudentByClassid(int classid);

    StudentClassVo getById(int classid);

    ReplyScoreVo getProById(int projectId);

    EmpVo getEById(int empid);

    void addStuRescore(StudentReplyScoreVo studentReplyScoreVo);
}
