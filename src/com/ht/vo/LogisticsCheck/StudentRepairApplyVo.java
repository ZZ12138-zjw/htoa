package com.ht.vo.LogisticsCheck;

import javax.persistence.*;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/19 10:18
 */
@Entity
@Table(name="t_studentRepairApply")
public class StudentRepairApplyVo {

    /*repairStudentID:${sessionScope.stuVo.stuId},
    repairStudent
    repairSort:$('#repairSort').val(),
    repairAddress:$('#repairAddress').val(),
    repairDept:$('#depName').val(),
    repairName:$('#repairName').val(),
    repairStatus:'待维修'*/

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer repairID;               //主键标识列
    private Integer studentID;              //学生ID
    private String studentName;             //学生姓名
    private String className;               //班级名称
    private Integer classID;                //班级ID
    private String repairSort;              //维修类别
    private String repairAddress;           //维修地址
    private String repairName;              //维修名称
    private String repairExplain;           //维修备注
    private String repairStatus;            //维修状态
    private String startDate;               //开始日期
    private String endDate;                 //结束日期

    @Override
    public String toString() {
        return "StudentRepairApplyVo{" +
                "repairID=" + repairID +
                ", studentID=" + studentID +
                ", studentName='" + studentName + '\'' +
                ", className='" + className + '\'' +
                ", classID=" + classID +
                ", repairSort='" + repairSort + '\'' +
                ", repairAddress='" + repairAddress + '\'' +
                ", repairName='" + repairName + '\'' +
                ", repairExplain='" + repairExplain + '\'' +
                ", repairStatus='" + repairStatus + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                '}';
    }

    public Integer getRepairID() {
        return repairID;
    }

    public void setRepairID(Integer repairID) {
        this.repairID = repairID;
    }

    public Integer getStudentID() {
        return studentID;
    }

    public void setStudentID(Integer studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Integer getClassID() {
        return classID;
    }

    public void setClassID(Integer classID) {
        this.classID = classID;
    }

    public String getRepairSort() {
        return repairSort;
    }

    public void setRepairSort(String repairSort) {
        this.repairSort = repairSort;
    }

    public String getRepairAddress() {
        return repairAddress;
    }

    public void setRepairAddress(String repairAddress) {
        this.repairAddress = repairAddress;
    }

    public String getRepairName() {
        return repairName;
    }

    public void setRepairName(String repairName) {
        this.repairName = repairName;
    }

    public String getRepairExplain() {
        return repairExplain;
    }

    public void setRepairExplain(String repairExplain) {
        this.repairExplain = repairExplain;
    }

    public String getRepairStatus() {
        return repairStatus;
    }

    public void setRepairStatus(String repairStatus) {
        this.repairStatus = repairStatus;
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
