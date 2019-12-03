package com.ht.vo;


import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/*
 * @author Cemer
 *
 * */
//学生教育经历表
@Entity
@Table(name = "")
public class StudentEduVo {
    private Integer Eduid;//经历主键id
    private Integer stuId;//学生表外键
    private String school;//就读学校
    private Date begindate;//开始时间
    private Date enddate;//结束时间

    public Integer getEduid() {
        return Eduid;
    }

    public void setEduid(Integer eduid) {
        Eduid = eduid;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public Date getBegindate() {
        return begindate;
    }

    public void setBegindate(Date begindate) {
        this.begindate = begindate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }
}
