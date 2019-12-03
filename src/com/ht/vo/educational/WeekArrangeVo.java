package com.ht.vo.educational;

import javax.persistence.*;

/**
 * Created by 华 on 2019/12/3.
 * @author  ShiHeHua
 */
@Entity
@Table(name = "weekarrange")
public class WeekArrangeVo {
    /**
     * 值班管理表
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer weekArrangeid; //主键，标识列，自动生成
    public String weekArrangeName; //排班名称
    public String ranges; //值班要求
    public String week; //一个星期中的那一天
    public String empId; //关联Emp主键
    public Integer orderId; //排序
    public Integer duty; //总值班 1：是 2：否
    public String startTime; //开始时间
    public String endTime; //结束时间
    public String remark; //说明

    @Override
    public String toString() {
        return "WeekArrangeVo{" +
                "weekArrangeid=" + weekArrangeid +
                ", weekArrangeName='" + weekArrangeName + '\'' +
                ", ranges='" + ranges + '\'' +
                ", week='" + week + '\'' +
                ", empId='" + empId + '\'' +
                ", orderId=" + orderId +
                ", duty=" + duty +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public Integer getWeekArrangeid() {
        return weekArrangeid;
    }

    public void setWeekArrangeid(Integer weekArrangeid) {
        this.weekArrangeid = weekArrangeid;
    }

    public String getWeekArrangeName() {
        return weekArrangeName;
    }

    public void setWeekArrangeName(String weekArrangeName) {
        this.weekArrangeName = weekArrangeName;
    }

    public String getRanges() {
        return ranges;
    }

    public void setRanges(String ranges) {
        this.ranges = ranges;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public String getEmpId() {
        return empId;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getDuty() {
        return duty;
    }

    public void setDuty(Integer duty) {
        this.duty = duty;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
