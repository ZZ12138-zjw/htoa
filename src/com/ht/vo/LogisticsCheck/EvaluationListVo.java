package com.ht.vo.LogisticsCheck;

import javax.persistence.*;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/19 20:48
 */

@Entity
@Table(name = "evaluationlist")
public class EvaluationListVo {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer ID;
    private Integer empID;
    private String empName;
    private Integer classID;
    private String className;
    private Integer stuId;                  //学生ID
    private Integer evaluationStatus;       //0未读，1已读
    private Integer evaluationContentID;    //考评内容ID

    @Override
    public String toString() {
        return "EvaluationListVo{" +
                "ID=" + ID +
                ", empID=" + empID +
                ", empName='" + empName + '\'' +
                ", classID=" + classID +
                ", className='" + className + '\'' +
                ", stuId=" + stuId +
                ", evaluationStatus=" + evaluationStatus +
                ", evaluationContentID=" + evaluationContentID +
                '}';
    }

    public Integer getEvaluationContentID() {
        return evaluationContentID;
    }

    public void setEvaluationContentID(Integer evaluationContentID) {
        this.evaluationContentID = evaluationContentID;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public Integer getEvaluationStatus() {
        return evaluationStatus;
    }

    public void setEvaluationStatus(Integer evaluationStatus) {
        this.evaluationStatus = evaluationStatus;
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getEmpID() {
        return empID;
    }

    public void setEmpID(Integer empID) {
        this.empID = empID;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public Integer getClassID() {
        return classID;
    }

    public void setClassID(Integer classID) {
        this.classID = classID;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
