package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created by shkstart on 2019/12/3
 * @author LaiWeiChun
 */
@Entity
@Table(name="t_holiday")
public class HolidayVo {

    @Id
    @GeneratedValue
    private Integer holidayid; //主键，标识列，自动生成
    private Integer empid; //关联Emp主键(请假人)
    private Float holidayDay; //假期天数
    private Date startTime; //开始时间
    private Date endTime; //结束时间
    private String title; //标题
    private Integer status; //状态 1:审批中 2：已完成 3：不批准
    private String remark; //内容

    public Integer getHolidayid() {
        return holidayid;
    }

    public void setHolidayid(Integer holidayid) {
        this.holidayid = holidayid;
    }

    public Integer getEmpid() {
        return empid;
    }

    public void setEmpid(Integer empid) {
        this.empid = empid;
    }

    public Float getHolidayDay() {
        return holidayDay;
    }

    public void setHolidayDay(Float holidayDay) {
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
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "HolidayVo{" +
                "holidayid=" + holidayid +
                ", empid=" + empid +
                ", holidayDay=" + holidayDay +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", title='" + title + '\'' +
                ", status=" + status +
                ", remark='" + remark + '\'' +
                '}';
    }
}
