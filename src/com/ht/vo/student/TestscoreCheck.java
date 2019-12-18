package com.ht.vo.student;

public class TestscoreCheck {
    private Integer  termid;
    private Integer classId;
    private Integer testType;
    private Integer courseId;

    public Integer getTermid() {
        return termid;
    }

    public void setTermid(Integer termid) {
        this.termid = termid;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getTestType() {
        return testType;
    }

    public void setTestType(Integer testType) {
        this.testType = testType;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    @Override
    public String toString() {
        return "TestscoreCheck{" +
                "termid=" + termid +
                ", classId=" + classId +
                ", testType=" + testType +
                ", courseId=" + courseId +
                '}';
    }
}
