package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by shkstart on 2019/12/10
 * @author LaIWeiChun
 */
@Entity
@Table(name = "t_certificate")
public class CertificatesVo {

    @Id
    @GeneratedValue
    private Integer cfId;
    private String cfEmpId;
    private String cfPath;
    private String upDate;
    private String upEmpName;
    private String remarks;

    public Integer getCfId() {
        return cfId;
    }

    public void setCfId(Integer cfId) {
        this.cfId = cfId;
    }

    public String getCfEmpId() {
        return cfEmpId;
    }

    public void setCfEmpId(String cfEmpId) {
        this.cfEmpId = cfEmpId;
    }

    public String getCfPath() {
        return cfPath;
    }

    public void setCfPath(String cfPath) {
        this.cfPath = cfPath;
    }

    public String getUpDate() {
        return upDate;
    }

    public void setUpDate(String upDate) {
        this.upDate = upDate;
    }

    public String getUpEmpName() {
        return upEmpName;
    }

    public void setUpEmpName(String upEmpName) {
        this.upEmpName = upEmpName;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public String toString() {
        return "CertificatesVo{" +
                "cfId=" + cfId +
                ", cfEmpId='" + cfEmpId + '\'' +
                ", cfPath='" + cfPath + '\'' +
                ", upDate='" + upDate + '\'' +
                ", upEmpName='" + upEmpName + '\'' +
                ", remarks='" + remarks + '\'' +
                '}';
    }
}
