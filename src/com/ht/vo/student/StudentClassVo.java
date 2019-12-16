package com.ht.vo.student;

import javax.persistence.*;

/*
 * @author Cemer
 *
 * */
//班级管理表
@Entity
@Table(name = "t_studentClass")
public class StudentClassVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer classId;//自增主键
    private Integer classNo;//班级编号
    private String className;//班级名称
    private int count;//班级人数
    private String teacher;//授课老师关联字段
    private String classTeacher;//班主任老师关联字段
    private Integer classType;//班级类别，关联班级类别表
    private String remark;//备注
    private Integer falled;//关联班级类别

    @Override
    public String toString() {
        return "StudentClassVo{" +
                "classId=" + classId +
                ", classNo=" + classNo +
                ", className='" + className + '\'' +
                ", count=" + count +
                ", teacher='" + teacher + '\'' +
                ", classTeacher='" + classTeacher + '\'' +
                ", classType=" + classType +
                ", remark='" + remark + '\'' +
                ", falled=" + falled +
                '}';
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getClassNo() {
        return classNo;
    }

    public void setClassNo(Integer classNo) {
        this.classNo = classNo;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getClassTeacher() {
        return classTeacher;
    }

    public void setClassTeacher(String classTeacher) {
        this.classTeacher = classTeacher;
    }

    public Integer getClassType() {
        return classType;
    }

    public void setClassType(Integer classType) {
        this.classType = classType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getFalled() {
        return falled;
    }

    public void setFalled(Integer falled) {
        this.falled = falled;
    }
}
