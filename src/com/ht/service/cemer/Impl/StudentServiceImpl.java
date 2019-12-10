package com.ht.service.cemer.Impl;


import com.ht.dao.BaseDao;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.*;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl extends BaseDao implements StudentService {
    public StudentServiceImpl() {
    }

    @Override
    public List getStudentInfo() {
        return this.listBySQL("select s.stuId,s.stuName,s.stuno,s.sex,s.cardid,s.phone,c.className,h.hourName,s.state,s.collar,s.computer,s.grants,s.parents,s.parentsphone,s.qkMoney from t_student s left join t_studentclass c on s.classid = c.classId left join t_studenthuor h on h.hourId= s.hourid");
    }

    @Override
    public List pageGetStudentInfo(int currPage, int pageSize) {
        return this.pageBySQL("select s.stuId,s.stuName,s.stuno,s.sex,s.cardid,s.phone,c.className,h.hourName,s.state,s.collar,s.computer,s.grants,s.parents,s.parentsphone,s.qkMoney from t_student s left join t_studentclass c on s.classid = c.classId left join t_studenthuor h on h.hourId= s.hourid", currPage, pageSize);
    }

    @Override
    public List getAllHuor() {
        return this.listByHql("from StudentHuorVo");
    }

    @Override
    public List getAllClass() {
        return this.listByHql("from StudentClassVo");
    }

    @Override
    public void addStuVo(StudentVo var1) {
        this.addObject(var1);
    }

    @Override
    public StudentVo getById(int stuId) {
        return (StudentVo)getObject(StudentVo.class,stuId);
    }

    @Override
    public void updStu(StudentVo studentVo) {
        updObject(studentVo);
    }

    @Override
    public void delStu(StudentVo studentVo) {
        delObject(studentVo);
    }

    @Override
    public List selectStuFamily(int stuId) {
        return listByHql("from StudentFamily where stuid="+stuId);
    }

    @Override
    public List selectStuEdu(int stuId) {
        return listByHql("from StudentEduVo where stuId="+stuId);
    }

    @Override
    public List selectStuHap(int stuId) {
        return listBySQL("select h.stuid,h.happening,h.optime,e.empName from t_studenthappening h,t_emp e where h.stuid = "+stuId+" and h.empid = e.empId");
    }

    @Override
    public List selectHoliday(int stuId) {
        return listByHql("from holidayStudentVo where StudentId = "+stuId);
    }

    @Override
    public List selectReplyScore(int stuId) {
        return listBySQL("select r.studentId,rs.proName,e.empName,r.score1,r.score2,r.score3,r.score4,r.score5,r.score6,r.score7,r.remark from t_studentReplyScore r,t_replyscore rs,t_emp e where r.projectId = rs.projectId and r.studentId ="+stuId+" and e.empId = r.empId");
    }

    @Override
    public List selectScore(int stuId) {
        return listBySQL("select s.stuid,s.score,c.courseName,t.typeName,m.termName,s.scoreTime,s.remark from t_studentscore s,course c,t_testtype t,term m where s.stuid ="+stuId+" and s.testType = t.typeId and m.termid = s.termid");
    }

    @Override
    public void addStuFal(StudentFamily studentFamily) {
        addObject(studentFamily);
    }

    @Override
    public void addStuEdu(StudentEduVo studentEduVo) {
        addObject(studentEduVo);
    }

    @Override
    public void addStuHap(StudentHappeningVo studentHappeningVo) {
        addObject(studentHappeningVo);
    }

    @Override
    public void addStuHoliday(holidayStudentVo holidayStudentVo) {
        addObject(holidayStudentVo);
    }

    @Override
    public void addStuReScore(StudentReplyScoreVo studentReplyScoreVo) {
        addObject(studentReplyScoreVo);
    }

    @Override
    public void addStuScore(StudentScoreVo studentScoreVo) {
        addObject(studentScoreVo);
    }

    @Override
    public List selectAllEmp() {
        return listByHql("from EmpVo");
    }
}
