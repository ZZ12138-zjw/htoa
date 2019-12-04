package com.ht.vo.student;

import javax.persistence.*;

/*
 * @author Cemer
 *
 * */
//学生项目答辩成绩表
@Entity
@Table(name = "t_studentReplyScore")
public class StudentReplyScoreVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer replyId;//成绩主键Id
    private Integer studentId;//学生表外键
    private Integer projectId;//关联答辩项目
    private Integer empId;//打分老师管理员工表外键
    private float score1;//功能完善 50
    private float score2;//技术难度10
    private float score3;//界面完美10
    private float score4;//回答问题
    private float score5;//演示方法10
    private float score6;//语言表达10
    private float score7;//总分100
    private String remark;//备注

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public float getScore1() {
        return score1;
    }

    public void setScore1(float score1) {
        this.score1 = score1;
    }

    public float getScore2() {
        return score2;
    }

    public void setScore2(float score2) {
        this.score2 = score2;
    }

    public float getScore3() {
        return score3;
    }

    public void setScore3(float score3) {
        this.score3 = score3;
    }

    public float getScore4() {
        return score4;
    }

    public void setScore4(float score4) {
        this.score4 = score4;
    }

    public float getScore5() {
        return score5;
    }

    public void setScore5(float score5) {
        this.score5 = score5;
    }

    public float getScore6() {
        return score6;
    }

    public void setScore6(float score6) {
        this.score6 = score6;
    }

    public float getScore7() {
        return score7;
    }

    public void setScore7(float score7) {
        this.score7 = score7;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
