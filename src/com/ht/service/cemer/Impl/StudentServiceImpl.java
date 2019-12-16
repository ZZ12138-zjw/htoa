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
        return listBySQL("select h.happenid,h.stuid,h.happening,h.optime,e.empName from t_studenthappening h,t_emp e where h.stuid = "+stuId+" and h.empid = e.empId");
    }

    @Override
    public List selectHoliday(int stuId) {
        return listByHql("from holidayStudentVo where StudentId = "+stuId);
    }

    @Override
    public List selectReplyScore(int stuId) {
        return listBySQL("select r.replyId,r.studentId,rs.proName,e.empName,r.score1,r.score2,r.score3,r.score4,r.score5,r.score6,r.score7,r.remark from t_studentReplyScore r,t_replyscore rs,t_emp e where r.projectId = rs.projectId and r.studentId ="+stuId+" and e.empId = r.empId");
    }

    @Override
    public List selectScore(int stuId) {
        return listBySQL("select s.scoreId,s.stuid,s.score,c.courseName,t.typeName,m.termName,s.scoreTime,s.remark from t_studentscore s left join course c on s.courseId=c.courseid left join t_testtype t on s.testType = t.typeId left join term m on s.termid=m.termid where s.stuid ="+stuId);
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

    @Override
    public List selectAllReplyScore() {
        return listByHql("from ReplyScoreVo");
    }

    @Override
    public List selectAllTerm() {
        return listByHql("from TermVo");
    }

    @Override
    public List selectAllTestType() {
        return listByHql("from TestTypeVo");
    }

    @Override
    public List selectAllCourse() {
        return listByHql("from CourseVo");
    }

    @Override
    public List selectAllFall() {
        return listByHql("from StudentFallVo");
    }

    @Override
    public List selectAllClass() {
        return listByHql("from StudentClassVo");
    }

    @Override
    public List selectAllHour() {
        return listByHql("from StudentHuorVo");
    }

    @Override
    public List selectBySearch(int page, int size, StudentSearch studentSearch) {
        String sql = "select s.stuId,s.stuName,s.stuno,s.sex,s.cardid,s.phone,c.className,h.hourName,s.state,s.collar,s.computer,s.grants,s.parents,s.parentsphone,s.qkMoney from t_student s left join t_studentclass c on s.classid = c.classId left join t_studenthuor h on h.hourId= s.hourid";
        if(studentSearch.getStuName()!= null && !"".equals(studentSearch.getStuName())){
            sql+=" where s.stuName like '%"+studentSearch.getStuName()+"%'";
        }else{
            sql+=" where s.stuName like '%'";
        }if(studentSearch.getClassid() != null && !"".equals(studentSearch.getClassid())){
            sql+=" and s.classid="+studentSearch.getClassid()+"";
        }if(studentSearch.getHourid() != null && !"".equals(studentSearch.getHourid())){
            sql+=" and s.hourid="+studentSearch.getHourid();
        }if(studentSearch.getPhone() != null && !"".equals(studentSearch.getPhone())){
            sql+=" and s.phone like '%"+studentSearch.getPhone()+"%'";
        }if(studentSearch.getState() !=null && !"".equals(studentSearch.getState())){
            sql+=" and s.state="+studentSearch.getState();
        }
        return pageBySQL(sql,page,size);
    }

    @Override
    public int selectBySearchCount(StudentSearch studentSearch) {
        String sql = "select s.stuId,s.stuName,s.stuno,s.sex,s.cardid,s.phone,c.className,h.hourName,s.state,s.collar,s.computer,s.grants,s.parents,s.parentsphone,s.qkMoney from t_student s left join t_studentclass c on s.classid = c.classId left join t_studenthuor h on h.hourId= s.hourid";
        if(studentSearch.getStuName() != null && !"".equals(studentSearch.getStuName())){
            sql+=" where s.stuName like '%"+studentSearch.getStuName()+"%'";
        }else{
            sql+=" where s.stuName like '%'";
        }if(studentSearch.getClassid() != null && !"".equals(studentSearch.getClassid())){
            sql+=" and s.classid="+studentSearch.getClassid();
        }if(studentSearch.getHourid() != null && !"".equals(studentSearch.getHourid())){
            sql+=" and s.hourid="+studentSearch.getHourid();
        }if(studentSearch.getPhone() != null && !"".equals(studentSearch.getPhone())){
            sql+=" and s.phone like '%"+studentSearch.getPhone()+"'";
        }if(studentSearch.getState() !=null && !"".equals(studentSearch.getState())){
            sql+=" and s.state="+studentSearch.getState();
        }
        return listBySQL(sql).size();
    }
}
