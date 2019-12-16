package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 周报管理
 *      工作日志功能主要是记录所有员工每天的工作情况
 * Created by shkstart on 2019/12/3
 * @author LaiWeiChun
 */
@Entity
@Table(name="t_weekly")
public class WeeklyVo{

    @Id
    @GeneratedValue
    private Integer worklogid; //主键，标识列，自动生成
    private int empid; //关联Emp表empid字段
    private Date workday; //填写日期
    private String weekCur; //本周情况描述
    private String studentQuestion; //问题学生情况反馈
    private String idea; //意见建议
    private String weekNext; //下周工作计划


    public Integer getWorklogid() {
        return worklogid;
    }

    public void setWorklogid(Integer worklogid) {
        this.worklogid = worklogid;
    }

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public Date getWorkday() {
        return workday;
    }

    public void setWorkday(Date workday) {
        this.workday = workday;
    }

    public String getWeekCur() {
        return weekCur;
    }

    public void setWeekCur(String weekCur) {
        this.weekCur = weekCur;
    }

    public String getStudentQuestion() {
        return studentQuestion;
    }

    public void setStudentQuestion(String studentQuestion) {
        this.studentQuestion = studentQuestion;
    }

    public String getIdea() {
        return idea;
    }

    public void setIdea(String idea) {
        this.idea = idea;
    }

    public String getWeekNext() {
        return weekNext;
    }

    public void setWeekNext(String weekNext) {
        this.weekNext = weekNext;
    }

    @Override
    public String toString() {
        return "WeeklyVo{" +
                "worklogid=" + worklogid +
                ", empid='" + empid + '\'' +
                ", workday=" + workday +
                ", weekCur='" + weekCur + '\'' +
                ", studentQuestion='" + studentQuestion + '\'' +
                ", idea='" + idea + '\'' +
                ", weekNext='" + weekNext + '\'' +
                '}';
    }
}
