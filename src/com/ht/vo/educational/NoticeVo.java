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
    private Integer trueConut;//已读人数
    private Integer falseCount;//未读人数

    @Override
    public String toString() {
        return "NoticeVo{" +
                "noticeId=" + noticeId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", noticeType=" + noticeType +
                ", empid=" + empid +
                ", noticeTime='" + noticeTime + '\'' +
                ", trueConut=" + trueConut +
                ", falseCount=" + falseCount +
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

    public Integer getTrueConut() {
        return trueConut;
    }

    public void setTrueConut(Integer trueConut) {
        this.trueConut = trueConut;
    }

    public Integer getFalseCount() {
        return falseCount;
    }

    public void setFalseCount(Integer falseCount) {
        this.falseCount = falseCount;
    }
}
