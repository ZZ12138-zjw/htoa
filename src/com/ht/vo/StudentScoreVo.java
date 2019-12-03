package com.ht.vo;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/*
 * @author Cemer
 *
 * */
//学生专业课程成绩表
@Entity
@Table(name = "t_studentScore")
public class StudentScoreVo {
    private Integer scoreId;//成绩主键Id;
    private Integer stuid;//学生
    private Integer score;//学生成绩
    private Integer rescore;//补考成绩
    private Integer courseId;//关联课程id
    private Integer testType;//考试类型 1:笔试2:机试 3:模拟面试
    private Integer termid;//关联学期id
    private Date scoreTime;//考试时间
    private Integer Empid;//录入人员 从session中获取值
    private String remark;//备注

    public Integer getScoreId() {
        return scoreId;
    }

    public void setScoreId(Integer scoreId) {
        this.scoreId = scoreId;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getRescore() {
        return rescore;
    }

    public void setRescore(Integer rescore) {
        this.rescore = rescore;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getTestType() {
        return testType;
    }

    public void setTestType(Integer testType) {
        this.testType = testType;
    }

    public Integer getTermid() {
        return termid;
    }

    public void setTermid(Integer termid) {
        this.termid = termid;
    }

    public Date getScoreTime() {
        return scoreTime;
    }

    public void setScoreTime(Date scoreTime) {
        this.scoreTime = scoreTime;
    }

    public Integer getEmpid() {
        return Empid;
    }

    public void setEmpid(Integer empid) {
        Empid = empid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
