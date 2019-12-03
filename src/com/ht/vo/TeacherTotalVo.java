package com.ht.vo;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/*
 * @author Cemer
 *
 * */
//考评总表
@Entity
@Table(name = "t_teacherTotal")
public class TeacherTotalVo {
    private Integer TeachertotalId;//主键标识列id
    private Integer classTeacher;//班主任或老师员工表主键
    private Integer classid;//关联班级表主键
    private Integer studentId;//关联学生id
    private Date Optime;//考评时间
    private String sugges;//问题与建议
    private Integer evaluationType;//1:授课老师2:班主任、

    public Integer getTeachertotalId() {
        return TeachertotalId;
    }

    public void setTeachertotalId(Integer teachertotalId) {
        TeachertotalId = teachertotalId;
    }

    public Integer getClassTeacher() {
        return classTeacher;
    }

    public void setClassTeacher(Integer classTeacher) {
        this.classTeacher = classTeacher;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Date getOptime() {
        return Optime;
    }

    public void setOptime(Date optime) {
        Optime = optime;
    }

    public String getSugges() {
        return sugges;
    }

    public void setSugges(String sugges) {
        this.sugges = sugges;
    }

    public Integer getEvaluationType() {
        return evaluationType;
    }

    public void setEvaluationType(Integer evaluationType) {
        this.evaluationType = evaluationType;
    }
}
