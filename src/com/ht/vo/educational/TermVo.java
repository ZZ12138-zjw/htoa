package com.ht.vo.educational;

import javax.persistence.*;

/**
 * Created by 华 on 2019/12/4.
 * @author ShiHeHua
 */
@Entity
@Table(name = "term")
public class TermVo {
    /**
     * 学期表
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer termid;//主键，标识列，自动生成
    public String termName;//学期名称
    public String remark;//说明

    @Override
    public String toString() {
        return "TermVo{" +
                "termid=" + termid +
                ", termName='" + termName + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public Integer getTermid() {
        return termid;
    }

    public void setTermid(Integer termid) {
        this.termid = termid;
    }

    public String getTermName() {
        return termName;
    }

    public void setTermName(String termName) {
        this.termName = termName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
