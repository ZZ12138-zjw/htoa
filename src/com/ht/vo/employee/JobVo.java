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
@Table(name = "t_job")
public class JobVo {

    @Id
    @GeneratedValue
    private Integer jobid; //主键，标识列，自动生成
    private Integer empid; //关联Emp表empid字段
    private String companyName; //公司名称
    private String degree; //岗位
    private Date startDate; //入职时间
    private Date endDate; //离职时间
    private String reason; //离职原因
    private String remark; //说明

    public Integer getJobid() {
        return jobid;
    }

    public void setJobid(Integer jobid) {
        this.jobid = jobid;
    }

    public Integer getEmpid() {
        return empid;
    }

    public void setEmpid(Integer empid) {
        this.empid = empid;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "JobVo{" +
                "Jobid=" + jobid +
                ", empid='" + empid + '\'' +
                ", companyName='" + companyName + '\'' +
                ", degree='" + degree + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", reason='" + reason + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
