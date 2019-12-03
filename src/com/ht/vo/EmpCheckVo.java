package com.ht.vo;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2019/12/3.
 */
@Entity
@Table(name="empCheck")
public class EmpCheckVo {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer ID;             //标识列
    private String checkIndex;      //考核内容，与考核指标表考核内容一样
    private String empName;         //被考核员工姓名
    private Integer checkScore;     //考核分数，正数加分负数减分
    private Date checkDate;         //考核日期
    private String inputEmp;        //录入人员（权限不足时不展示录入按钮）

    @Override
    public String toString() {
        return "EmpCheckVo{" +
                "ID=" + ID +
                ", checkIndex='" + checkIndex + '\'' +
                ", empName='" + empName + '\'' +
                ", checkScore=" + checkScore +
                ", checkDate=" + checkDate +
                ", inputEmp='" + inputEmp + '\'' +
                ", checkExplain='" + checkExplain + '\'' +
                '}';
    }

    private String checkExplain;    //考核说明（可以理解为备注）

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getCheckIndex() {
        return checkIndex;
    }

    public void setCheckIndex(String checkIndex) {
        this.checkIndex = checkIndex;
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

    public Date getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(Date checkDate) {
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
}
