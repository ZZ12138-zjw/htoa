package com.ht.vo.student;

import java.util.Date;

public class ScoreCheck {
    private int classid;//班级
    private int courseId;//课程
    private int testType;//考试类型
    private int termid;//学期号
    private int empid;//录入人员
    private Date scoreTime;//考试时间

    @Override
    public String toString() {
        return "ScoreCheck{" +
                "classid=" + classid +
                ", courseId=" + courseId +
                ", testType=" + testType +
                ", termid=" + termid +
                ", Empid=" + empid +
                ", scoreTime=" + scoreTime +
                '}';
    }

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getTestType() {
        return testType;
    }

    public void setTestType(int testType) {
        this.testType = testType;
    }

    public int getTermid() {
        return termid;
    }

    public void setTermid(int termid) {
        this.termid = termid;
    }

    public Date getScoreTime() {
        return scoreTime;
    }

    public void setScoreTime(Date scoreTime) {
        this.scoreTime = scoreTime;
    }
}
