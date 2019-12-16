package com.ht.vo.LogisticsCheck;

import javax.persistence.*;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/15 11:14
 */
@Entity
@Table(name = "checkinsert")
public class CheckInsertVo {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer ID;                 //标识列
    private String checkContent;        //考核内容，与考核指标表考核内容一样
    private String empName;             //被考核员工姓名
    private Integer checkScore;         //考核分数，正数加分负数减分
    private String checkDate;           //考核日期
    private String inputEmp;            //录入人员（权限不足时不展示录入按钮）
    private String checkExplain;        //录入备注
    private Integer empID;              //员工ID
    private Integer depID;               //部门ID
    private String depName;             //部门名称
    private String imageName;           //图片名称
    private Integer inputID;            //录入人员ID
    private Integer checkContentID;            //考核内容ID关联考核指标ID

    @Override
    public String toString() {
        return "CheckInsertVo{" +
                "ID=" + ID +
                ", checkContent='" + checkContent + '\'' +
                ", empName='" + empName + '\'' +
                ", checkScore=" + checkScore +
                ", checkDate='" + checkDate + '\'' +
                ", inputEmp='" + inputEmp + '\'' +
                ", checkExplain='" + checkExplain + '\'' +
                ", empID=" + empID +
                ", depID=" + depID +
                ", depName='" + depName + '\'' +
                ", imageName='" + imageName + '\'' +
                ", inputID=" + inputID +
                ", checkContentID=" + checkContentID +
                '}';
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getCheckContent() {
        return checkContent;
    }

    public void setCheckContent(String checkContent) {
        this.checkContent = checkContent;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public Integer getCheckScore() {
        return checkScore;
    }

    public void setCheckScore(Integer checkScore) {
        this.checkScore = checkScore;
    }

    public String getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(String checkDate) {
        this.checkDate = checkDate;
    }

    public String getInputEmp() {
        return inputEmp;
    }

    public void setInputEmp(String inputEmp) {
        this.inputEmp = inputEmp;
    }

    public String getCheckExplain() {
        return checkExplain;
    }

    public void setCheckExplain(String checkExplain) {
        this.checkExplain = checkExplain;
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

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public Integer getInputID() {
        return inputID;
    }

    public void setInputID(Integer inputID) {
        this.inputID = inputID;
    }

    public Integer getCheckContentID() {
        return checkContentID;
    }

    public void setCheckContentID(Integer checkContentID) {
        this.checkContentID = checkContentID;
    }
}
