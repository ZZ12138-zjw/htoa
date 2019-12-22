package com.ht.vo.LogisticsCheck;

import com.ht.vo.student.StudentVo;

import javax.persistence.*;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/22 14:47
 */

@Entity
@Table(name = "t_addempevaluation")
public class AddEmpEvaluationVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer ID;
    private Integer stuId;                              //学生ID
    private String stuName;                             //学生姓名
    private String empEvaluationID;                     //考评ID  关联empEvaluation表
    private String evaluationContentID;                 //考评内容ID
    private String evaluationContent;                   //考评内容
    private String evaluationSingleTotalScore;   //考评内容单项满分
    private String evaluationSingleGetScore;     //考评内容单项得分
    private Integer evaluationTotalScore;        //考评内容满分
    private Integer evaluationTotalGetScore;     //考评内容总得分
    private String empName;                             //被考评员工姓名
    private Integer empID;                              //被考评员工ID

    @Override
    public String toString() {
        return "AddEmpEvaluationVo{" +
                "ID=" + ID +
                ", stuId=" + stuId +
                ", stuName='" + stuName + '\'' +
                ", empEvaluationID='" + empEvaluationID + '\'' +
                ", evaluationContentID='" + evaluationContentID + '\'' +
                ", evaluationContent='" + evaluationContent + '\'' +
                ", evaluationSingleTotalScore='" + evaluationSingleTotalScore + '\'' +
                ", evaluationSingleGetScore='" + evaluationSingleGetScore + '\'' +
                ", evaluationTotalScore=" + evaluationTotalScore +
                ", evaluationTotalGetScore=" + evaluationTotalGetScore +
                ", empName='" + empName + '\'' +
                ", empID=" + empID +
                '}';
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getEmpEvaluationID() {
        return empEvaluationID;
    }

    public void setEmpEvaluationID(String empEvaluationID) {
        this.empEvaluationID = empEvaluationID;
    }

    public String getEvaluationContentID() {
        return evaluationContentID;
    }

    public void setEvaluationContentID(String evaluationContentID) {
        this.evaluationContentID = evaluationContentID;
    }

    public String getEvaluationContent() {
        return evaluationContent;
    }

    public void setEvaluationContent(String evaluationContent) {
        this.evaluationContent = evaluationContent;
    }

    public String getEvaluationSingleTotalScore() {
        return evaluationSingleTotalScore;
    }

    public void setEvaluationSingleTotalScore(String evaluationSingleTotalScore) {
        this.evaluationSingleTotalScore = evaluationSingleTotalScore;
    }

    public String getEvaluationSingleGetScore() {
        return evaluationSingleGetScore;
    }

    public void setEvaluationSingleGetScore(String evaluationSingleGetScore) {
        this.evaluationSingleGetScore = evaluationSingleGetScore;
    }

    public Integer getEvaluationTotalScore() {
        return evaluationTotalScore;
    }

    public void setEvaluationTotalScore(Integer evaluationTotalScore) {
        this.evaluationTotalScore = evaluationTotalScore;
    }

    public Integer getEvaluationTotalGetScore() {
        return evaluationTotalGetScore;
    }

    public void setEvaluationTotalGetScore(Integer evaluationTotalGetScore) {
        this.evaluationTotalGetScore = evaluationTotalGetScore;
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
}
