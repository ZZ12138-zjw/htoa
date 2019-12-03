package com.ht.vo;

import javax.persistence.*;

/**
 * Created by 华 on 2019/12/3.
 * @author  ShiHeHua
 */
@Entity
@Table(name = "coursetype")
public class CourseTypeVo {
    /**
     * 课程类别表
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer courseTypeId; //主键，标识列，自动生成
    public String courseTypeName; //类别名称(公共课，专业课)
    public String remark; //说明

    @Override
    public String toString() {
        return "CourseType{" +
                "courseTypeId=" + courseTypeId +
                ", courseTypeName='" + courseTypeName + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public Integer getCourseTypeId() {
        return courseTypeId;
    }

    public void setCourseTypeId(Integer courseTypeId) {
        this.courseTypeId = courseTypeId;
    }

    public String getCourseTypeName() {
        return courseTypeName;
    }

    public void setCourseTypeName(String courseTypeName) {
        this.courseTypeName = courseTypeName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
