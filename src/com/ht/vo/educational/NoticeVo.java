package com.ht.vo.educational;

import javax.persistence.*;

/**
 * Created by 华 on 2019/12/11.
 */
@Entity
@Table(name = "t_notice")
public class NoticeVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer noticeId; //主键，标识列，自动生成
    private String title; //标题
    private String content; //通知内容
    private Integer noticeType; //类型;3:所有人，1员工,2学生
    private Integer empid; //发布人
    private String noticeTime; //发布时间
    private String classIds;//班级id列表，逗号分隔
    private String empIds;//部门id列表，逗号分隔

    @Override
    public String toString() {
        return "NoticeVo{" +
                "noticeId=" + noticeId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", noticeType=" + noticeType +
                ", empid=" + empid +
                ", noticeTime='" + noticeTime + '\'' +
                ", classIds='" + classIds + '\'' +
                ", empIds='" + empIds + '\'' +
                '}';
    }

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getNoticeType() {
        return noticeType;
    }

    public void setNoticeType(Integer noticeType) {
        this.noticeType = noticeType;
    }

    public Integer getEmpid() {
        return empid;
    }

    public void setEmpid(Integer empid) {
        this.empid = empid;
    }

    public String getNoticeTime() {
        return noticeTime;
    }

    public void setNoticeTime(String noticeTime) {
        this.noticeTime = noticeTime;
    }

    public String getClassIds() {
        return classIds;
    }

    public void setClassIds(String classIds) {
        this.classIds = classIds;
    }

    public String getEmpIds() {
        return empIds;
    }

    public void setEmpIds(String empIds) {
        this.empIds = empIds;
    }
}
