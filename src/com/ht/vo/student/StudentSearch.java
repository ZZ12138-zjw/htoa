package com.ht.vo.student;

public class StudentSearch {
    private String stuName;
    private String phone;
    private Integer classid;
    private Integer hourid;
    private Integer state;

    @Override
    public String toString() {
        return "StudentSearch{" +
                "stuName='" + stuName + '\'' +
                ", stuPhone='" + phone + '\'' +
                ", classid=" + classid +
                ", hourid=" + hourid +
                ", state=" + state +
                '}';
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Integer getHourid() {
        return hourid;
    }

    public void setHourid(Integer hourid) {
        this.hourid = hourid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
