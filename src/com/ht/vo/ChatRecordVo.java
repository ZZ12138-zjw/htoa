package com.ht.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 谈心记录
 *      谈心记录，记录任何老师每个月跟学生谈心的情况。
 * Created by shkstart on 2019/12/3
 * @author LaiWeiChun
 */
@Entity
@Table(name = "t_chatRecord")
public class ChatRecordVo {

    @Id
    @GeneratedValue
    private Integer chatid; //谈心主键id
    private Integer sayface; //学生表外键
    private Integer teacher; //员工表外键
    private String addr; //地址
    private String sayscon; //谈心内容
    private Date chatDate;  //时间


    public Date getChatDate() {
        return chatDate;
    }
    public void setChatDate(Date chatDate) {
        this.chatDate = chatDate;
    }

    public Integer getChatid() {
        return chatid;
    }

    public void setChatid(Integer chatid) {
        this.chatid = chatid;
    }

    public Integer getSayface() {
        return sayface;
    }

    public void setSayface(Integer sayface) {
        this.sayface = sayface;
    }

    public Integer getTeacher() {
        return teacher;
    }

    public void setTeacher(Integer teacher) {
        this.teacher = teacher;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getSayscon() {
        return sayscon;
    }

    public void setSayscon(String sayscon) {
        this.sayscon = sayscon;
    }

    @Override
    public String toString() {
        return "ChatRecordVo{" +
                "chatid=" + chatid +
                ", sayface=" + sayface +
                ", teacher=" + teacher +
                ", addr='" + addr + '\'' +
                ", sayscon='" + sayscon + '\'' +
                ", chatDate=" + chatDate +
                '}';
    }
}
