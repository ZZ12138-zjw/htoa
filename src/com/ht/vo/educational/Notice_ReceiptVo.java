package com.ht.vo.educational;

import javax.persistence.*;

/**
 * Created by 华 on 2019/12/11.
 */
@Entity
@Table(name = "notice_receipt")
public class Notice_ReceiptVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer receiverId;  //主键，标识列，自动生成
    private Integer noticeId;  //关联管理通知公告
    private Integer receiver;  //接收人
    private Integer isRead;  //是否已读,1:已读,2:未读
    private Integer type;//师生类型 1：员工，2：学生

    @Override
    public String toString() {
        return "Notice_ReceiptVo{" +
                "receiverId=" + receiverId +
                ", noticeId=" + noticeId +
                ", receiver=" + receiver +
                ", isRead=" + isRead +
                ", type=" + type +
                '}';
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public Integer getReceiver() {
        return receiver;
    }

    public void setReceiver(Integer receiver) {
        this.receiver = receiver;
    }

    public Integer getIsRead() {
        return isRead;
    }

    public void setIsRead(Integer isRead) {
        this.isRead = isRead;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
