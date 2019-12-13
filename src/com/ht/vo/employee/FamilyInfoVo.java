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
    private Integer empId; //关联Emp表empid字段
    private String contactName; //联系人名称
    private String relationship; //与员工关系
    private String phone; //联系电话
    private String remark; //说明

    public Integer getFamilyid() {
        return familyid;
    }

    public void setFamilyid(Integer familyid) {
        this.familyid = familyid;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
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
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "FamilyInfoVo{" +
                "familyid=" + familyid +
                ", Empid='" + empId + '\'' +
                ", contactName='" + contactName + '\'' +
                ", relationship='" + relationship + '\'' +
                ", Phone='" + phone + '\'' +
                ", Remark='" + remark + '\'' +
                '}';
    }
}
