package com.ht.vo;

import javax.persistence.Entity;
import javax.persistence.Table;

/*
 * @author Cemer
 *
 * */
//班级管理表
@Entity
@Table(name = "")
public class StudentClassVo {
    private int classId;//自增主键
    private int classNo;//班级编号
    private String className;//班级名称
    private int count;//班级人数
    private String teacher;//授课老师关联字段
    private String classTeacher;//班主任老师关联字段
    private int classType;//班级类别，关联班级类别表
    private String remark;//备注
    private int falled;//关联班级类别

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public int getClassNo() {
        return classNo;
    }

    public void setClassNo(int classNo) {
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

    public int getClassType() {
        return classType;
    }

    public void setClassType(int classType) {
        this.classType = classType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getFalled() {
        return falled;
    }

    public void setFalled(int falled) {
        this.falled = falled;
    }
}
