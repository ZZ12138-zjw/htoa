package com.ht.vo.educational;

import javax.persistence.*;

/**
 * Created by 华 on 2019/12/4.
 * @author  ShiHeHua
 */
@Entity
@Table(name = "major")
public class MajorVo {
    /**
     * 专业表
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer majorid; //主键，标识列，自动生成
    public String majorName; //专业名称
    public Integer deptid; //系id
    public String remark; //说明

    @Override
    public String toString() {
        return "MajorVo{" +
                "majorid='" + majorid + '\'' +
                ", majorName='" + majorName + '\'' +
                ", deptid='" + deptid + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public Integer getMajorid() {
        return majorid;
    }

    public void setMajorid(Integer majorid) {
        this.majorid = majorid;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
