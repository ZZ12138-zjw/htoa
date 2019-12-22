package com.ht.service.cemer;

import com.ht.vo.educational.TermVo;
import com.ht.vo.employee.DeptVo;
import com.ht.vo.student.ReplyScoreVo;
import com.ht.vo.student.StudentFallVo;
import com.ht.vo.student.StudentTypeVo;
import com.ht.vo.student.TestTypeVo;

import java.util.List;

public interface SystemSettingService {
    List selectJieBieAll();
    List selectJieBieByPage(int page,int limit);
    void addStudentFallVo(StudentFallVo studentFallVo);
    StudentFallVo getFallById(int fallid);
    void deleteJieBie(StudentFallVo studentFallVo);

    List selectClaTypeAll();
    List selectClaTypeByPage(int page,int limit);
    void addClassTypeVo(StudentTypeVo studentTypeVo);
    StudentTypeVo getclaTypeById(int classType);
    void deleteClaType(StudentTypeVo studentTypeVo);

    List selectDeptAll();
    List selectDeptByPage(int page,int limit);
    void addDept(DeptVo deptVo);
    DeptVo getDeptById(int depid);
    void deleteDept(DeptVo deptVo);

    List selectEmpAll();

    List selectTermAll();
    List selectTermByPage(int page,int limit);
    void addTerm(TermVo termVo);
    TermVo getTermById(int termid);
    void delTerm(TermVo termVo);

    List selectReplyScoreAll();
    List selectReplyScoreByPage(int page,int limit);
    void addReplyScore(ReplyScoreVo replyScoreVo);
    ReplyScoreVo getReplyScoerById(int projectId);
    void delReplyScore(ReplyScoreVo replyScoreVo);

    List selectTestType();
    List selectTestTypePage(int page,int limit);
    void addTestType(TestTypeVo testTypeVo);
    TestTypeVo getTestTypeById(int typeId);
    void delTestType(TestTypeVo testTypeVo);
}
