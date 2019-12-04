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
    private Integer ID;         //标识列
    private String empSort;     //员工类型
    private String inClassEmp;  //任课老师
    private String inClassName; //班级

    @Override
    public String toString() {
        return "EmpEvaluationVo{" +
                "ID=" + ID +
                ", empSort='" + empSort + '\'' +
                ", inClassEmp='" + inClassEmp + '\'' +
                ", inClassName='" + inClassName + '\'' +
                '}';
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getEmpSort() {
        return empSort;
    }

    public void setEmpSort(String empSort) {
        this.empSort = empSort;
    }

    public String getInClassEmp() {
        return inClassEmp;
    }

    public void setInClassEmp(String inClassEmp) {
        this.inClassEmp = inClassEmp;
    }

    public String getInClassName() {
        return inClassName;
    }

    public void setInClassName(String inClassName) {
        this.inClassName = inClassName;
    }
}
