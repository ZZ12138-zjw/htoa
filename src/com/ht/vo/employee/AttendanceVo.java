package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 考勤表(就是未打卡)
 * Created by shkstart on 2019/12/3
 * @author LaiWeiChun
 */
@Entity
@Table(name = "t_attendance")
public class AttendanceVo {

    @Id
    @GeneratedValue
    private Integer attId;  //编号
    private String empName;  //员工姓名
    private Date notTime;  //未打卡时间
    private String explanation;  //原因说明
    private String auditor;  //审核人
    private Date auditorTime;  //审核时间
    private String auditorEx;  //审核说明
    private Integer status; //状态 1:审批中 2：已完成 3：不批准

    public Integer getAttId() {
        return attId;
    }

    public void setAttId(Integer attId) {
        this.attId = attId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public Date getNotTime() {
        return notTime;
    }

    public void setNotTime(Date notTime) {
        this.notTime = notTime;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public String getAuditor() {
        return auditor;
    }

    public void setAuditor(String auditor) {
        this.auditor = auditor;
    }

    public Date getAuditorTime() {
        return auditorTime;
    }

    public void setAuditorTime(Date auditorTime) {
        this.auditorTime = auditorTime;
    }

    public String getAuditorEx() {
        return auditorEx;
    }

    public void setAuditorEx(String auditorEx) {
        this.auditorEx = auditorEx;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "AttendanceVo{" +
                "attId=" + attId +
                ", empName='" + empName + '\'' +
                ", notTime=" + notTime +
                ", explanation='" + explanation + '\'' +
                ", auditor='" + auditor + '\'' +
                ", auditorTime=" + auditorTime +
                ", auditorEx='" + auditorEx + '\'' +
                ", status=" + status +
                '}';
    }
}
