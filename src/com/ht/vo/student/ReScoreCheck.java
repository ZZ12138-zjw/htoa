package com.ht.vo.student;

public class ReScoreCheck {
    private Integer projectId;//答辩项目名称
    private Integer classid;//班级名称
    private Integer empId;//评分老师

    @Override
    public String toString() {
        return "ReScoreCheck{" +
                "projectId=" + projectId +
                ", classid=" + classid +
                ", empId=" + empId +
                '}';
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }
}
