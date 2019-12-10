package com.ht.vo.educational;

import javax.persistence.*;

/**
 * Created by 华 on 2019/12/3.
 *
 */
@Entity
@Table(name="t_trial")
public class TrialVo {
    /**
     * 试讲与培训计划表
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer trialid; //主键，标识列，自动生成
    public String date; //日期
    public String time; //时间(星期一---星期日)
    public Integer courseid; //关联课程/章节id
    public String type; //授课类型(试讲/培训)
    public Integer empid; //员工id关联员工表(授课老师)
    public String remark; //备注(针对课程重要内容)

    @Override
    public String toString() {
        return "Trial{" +
                "trialid=" + trialid +
                ", date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", Courseid=" + courseid +
                ", type=" + type +
                ", empid=" + empid +
                ", remark='" + remark + '\'' +
                '}';
    }

    public Integer getTrialid() {
        return trialid;
    }

    public void setTrialid(Integer trialid) {
        this.trialid = trialid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getCourseid() {
        return courseid;
    }

    public void setCourseid(Integer courseid) {
        this.courseid = courseid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getEmpid() {
        return empid;
    }

    public void setEmpid(Integer empid) {
        this.empid = empid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
