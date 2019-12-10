package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by shkstart on 2019/12/3
 * @author LaiWeiChun
 */
@Entity
@Table(name = "t_familyInfo")
public class FamilyInfoVo {

    @Id
    @GeneratedValue
    private Integer familyid; //主键，标识列，自动生成
    private String Empid; //关联Emp表empid字段
    private String contactName; //联系人名称
    private String relationship; //与员工关系
    private String Phone; //联系电话
    private String remark; //说明

    public Integer getFamilyid() {
        return familyid;
    }

    public void setFamilyid(Integer familyid) {
        this.familyid = familyid;
    }

    public String getEmpid() {
        return Empid;
    }

    public void setEmpid(String empid) {
        Empid = empid;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        remark = remark;
    }

    @Override
    public String toString() {
        return "FamilyInfoVo{" +
                "familyid=" + familyid +
                ", Empid='" + Empid + '\'' +
                ", contactName='" + contactName + '\'' +
                ", relationship='" + relationship + '\'' +
                ", Phone='" + Phone + '\'' +
                ", Remark='" + remark + '\'' +
                '}';
    }
}
