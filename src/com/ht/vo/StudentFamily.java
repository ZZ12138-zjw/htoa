package com.ht.vo;

import javax.persistence.Entity;
import javax.persistence.Table;

/*
 * @author Cemer
 *
 * */
//学生家庭情况表
@Entity
@Table(name = "t_studentFamily")
public class StudentFamily {
    private Integer familyid;//表主键Id
    private Integer stuid;//学生表外键
    private String familyname;//亲属姓名
    private String relation;//与学生关系
    private String familyphone;//亲属电话

    public Integer getFamilyid() {
        return familyid;
    }

    public void setFamilyid(Integer familyid) {
        this.familyid = familyid;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public String getFamilyname() {
        return familyname;
    }

    public void setFamilyname(String familyname) {
        this.familyname = familyname;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getFamilyphone() {
        return familyphone;
    }

    public void setFamilyphone(String familyphone) {
        this.familyphone = familyphone;
    }
}
