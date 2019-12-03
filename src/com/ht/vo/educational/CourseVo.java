package com.ht.vo.educational;

import javax.persistence.*;

/**
 * Created by 华 on 2019/12/3.
 * @author  ShiHeHua
 */
@Entity
@Table(name = "course")
public class CourseVo {
    /**
     * 课程表
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer courseid; //主键，标识列，自动生成
    public String courseName; //课程名称
    public String isobligatory; //是否必修
    public Integer courseTypeId; //课程类别id外键
    public String remark; //说明

    @Override
    public String toString() {
        return "Course{" +
                "courseid=" + courseid +
                ", courseName='" + courseName + '\'' +
                ", isobligatory='" + isobligatory + '\'' +
                ", courseTypeId=" + courseTypeId +
                ", remark='" + remark + '\'' +
                '}';
    }

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getIsobligatory() {
        return isobligatory;
    }

    public void setIsobligatory(String isobligatory) {
        this.isobligatory = isobligatory;
    }

    public Integer getCourseTypeId() {
        return courseTypeId;
    }

    public void setCourseTypeId(Integer courseTypeId) {
        this.courseTypeId = courseTypeId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
