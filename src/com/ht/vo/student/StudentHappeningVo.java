package com.ht.vo.student;

import javax.persistence.*;
import java.util.Date;

/*
 * @author Cemer
 *
 * */
//学生情况记录表
@Entity
@Table(name = "t_studentHappening")
public class StudentHappeningVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer happenid;//主键id
    private Integer stuid;//学生id外键
    private String happening;//情况记录
    private Date optime;//记录时间
    private Integer empid;//记录人、session获取id

    public Integer getHappenid() {
        return happenid;
    }

    public void setHappenid(Integer happenid) {
        this.happenid = happenid;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public String getHappening() {
        return happening;
    }

    public void setHappening(String happening) {
        this.happening = happening;
    }

    public Date getOptime() {
        return optime;
    }

    public void setOptime(Date optime) {
        this.optime = optime;
    }

    public Integer getEmpid() {
        return empid;
    }

    public void setEmpid(Integer empid) {
        this.empid = empid;
    }
}
