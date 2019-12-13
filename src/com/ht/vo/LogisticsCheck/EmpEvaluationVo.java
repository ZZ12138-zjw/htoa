package com.ht.vo.LogisticsCheck;

import javax.persistence.*;

//此vo为教师考评vo

/**
 * Created by @ZhangJiaWen on 2019/12/3.
 */
@Entity
@Table(name = "empEvaluation")
public class EmpEvaluationVo {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer empEvaluationID;        //标识列
    private String depName;                 //部门名称
    private String empName;                 //员工名称
    private Integer empID;                  //员工ID
    private Integer depID;                  //部门ID
    private Integer evaluationContentID;    //考评ID
    private String evaluationContent;       //考评内容
    private Integer evaluationScore;        //考评分数
    private String startDate;               //开始日期
    private String endDate;                 //结束日期
    private Integer evaluationStatus;        //考评状态 0未开始，1考评中，2考评完成

    @Override
    public String toString() {
        return "EmpEvaluationVo{" +
                "empEvaluationID=" + empEvaluationID +
                ", depName='" + depName + '\'' +
                ", empName='" + empName + '\'' +
                ", empID=" + empID +
                ", depID=" + depID +
                ", evaluationContentID=" + evaluationContentID +
                ", evaluationContent='" + evaluationContent + '\'' +
                ", evaluationScore=" + evaluationScore +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", evaluationStatus=" + evaluationStatus +
                '}';
    }

    public Integer getEvaluationStatus() {
        return evaluationStatus;
    }

    public void setEvaluationStatus(Integer evaluationStatus) {
        this.evaluationStatus = evaluationStatus;
    }

    public Integer getEmpEvaluationID() {
        return empEvaluationID;
    }

    public void setEmpEvaluationID(Integer empEvaluationID) {
        this.empEvaluationID = empEvaluationID;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public Integer getEmpID() {
        return empID;
    }

    public void setEmpID(Integer empID) {
        this.empID = empID;
    }

    public Integer getDepID() {
        return depID;
    }

    public void setDepID(Integer depID) {
        this.depID = depID;
    }

    public Integer getEvaluationContentID() {
        return evaluationContentID;
    }

    public void setEvaluationContentID(Integer evaluationContentID) {
        this.evaluationContentID = evaluationContentID;
    }

    public String getEvaluationContent() {
        return evaluationContent;
    }

    public void setEvaluationContent(String evaluationContent) {
        this.evaluationContent = evaluationContent;
    }

    public Integer getEvaluationScore() {
        return evaluationScore;
    }

    public void setEvaluationScore(Integer evaluationScore) {
        this.evaluationScore = evaluationScore;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
