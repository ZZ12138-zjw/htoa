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
    private Integer dId; //主键
    private String dName; //证件名称
    private Integer empId; //员工id
    private String dPath; //图片路径
    private String uDate; //上传时间
    private String upName; //上传人
    private String remark;  //说明

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getdPath() {
        return dPath;
    }

    public void setdPath(String dPath) {
        this.dPath = dPath;
    }

    public String getuDate() {
        return uDate;
    }

    public void setuDate(String uDate) {
        this.uDate = uDate;
    }

    public String getUpName() {
        return upName;
    }

    public void setUpName(String upName) {
        this.upName = upName;
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
                "dId=" + dId +
                ", dName='" + dName + '\'' +
                ", empId=" + empId +
                ", dPath='" + dPath + '\'' +
                ", uDate='" + uDate + '\'' +
                ", upName='" + upName + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
