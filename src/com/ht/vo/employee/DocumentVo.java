package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by shkstart on 2019/12/11
 * @author LaiWeiChun
 */
@Entity
@Table(name = "t_document")
public class DocumentVo {

    @Id
    @GeneratedValue
    private Integer docId; //主键
    private String docName; //证件名称
    private Integer empId; //员工id
    private String docPath; //图片路径
    private String upDate; //上传时间
    private String upEmp; //上传人
    private String remark; //说明

    public Integer getDocId() {
        return docId;
    }

    public void setDocId(Integer docId) {
        this.docId = docId;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getDocPath() {
        return docPath;
    }

    public void setDocPath(String docPath) {
        this.docPath = docPath;
    }

    public String getUpDate() {
        return upDate;
    }

    public void setUpDate(String upDate) {
        this.upDate = upDate;
    }

    public String getUpEmp() {
        return upEmp;
    }

    public void setUpEmp(String upEmp) {
        this.upEmp = upEmp;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "DocumentVo{" +
                "docId=" + docId +
                ", docName='" + docName + '\'' +
                ", empId=" + empId +
                ", docPath='" + docPath + '\'' +
                ", upDate='" + upDate + '\'' +
                ", upEmp='" + upEmp + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
