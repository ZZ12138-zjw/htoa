package com.ht.vo;

import javax.persistence.*;
import java.util.Date;

/**
 * 学生请假申请表
 */
@Entity
@Table(name = "holidayStudent")
public class holidayStudentVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int holidayId;     //主键
    private int StudentId;      //学生表主键
    private int holidayDay;     //假期天数
    private Date startTime;     //开始时间
    private Date endTime;       //结束时间
    private String Title;       //标题
    private String Remark;      //内容
    private String Status;      //审批状态

    public int getHolidayId() {
        return holidayId;
    }

    public void setHolidayId(int holidayId) {
        this.holidayId = holidayId;
    }

    public int getStudentId() {
        return StudentId;
    }

    public void setStudentId(int studentId) {
        StudentId = studentId;
    }

    public int getHolidayDay() {
        return holidayDay;
    }

    public void setHolidayDay(int holidayDay) {
        this.holidayDay = holidayDay;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getRemark() {
        return Remark;
    }

    public void setRemark(String remark) {
        Remark = remark;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }
}
