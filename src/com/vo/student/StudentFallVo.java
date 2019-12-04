package com.vo.student;

import javax.persistence.*;

/*
 * @author Cemer
 *
 * */
//届别表
@Entity
@Table(name = "t_studentFall")
public class StudentFallVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer fallid;//自增主键标识列
    private String level;//届别名称
    private String remark;//备注

    public Integer getFallid() {
        return fallid;
    }

    public void setFallid(Integer fallid) {
        this.fallid = fallid;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
