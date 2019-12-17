package com.ht.service.shihehua;

import com.ht.vo.educational.NoticeVo;

import java.util.List;

/**
 * Created by 华 on 2019/12/12.
 */
public interface INoticeService {
    public void addNotice(NoticeVo noticeVo);

    public List NoticeIdList(String title);

    public List StudentList();

    public int StudentCount();

    public List selEmpNoticePage(Integer currPage,Integer pageSize);

    public List selStudentNoticePage(Integer currPage,Integer pageSize);

    public NoticeVo selNotice(Integer noticeId);

    public int selEmpNoticeCount();

    public void NoticeUpdate(NoticeVo noticeVo);

    public int selStudentNoticeCount();

    public void delNotice(Integer noticeId);
    public void delNoticeReceipt(Integer noticeId);

    public void delNotices(String ids);
    public void delNoticeReceipts(String ids);


    public List selNoticeReceiptEmpList(Integer noticeId);

    public List selEmpNoticeList(Integer empId);


    public int EmpNoticeFalseCount(Integer noticeId);

    public int EmpNoticeTrueCount(Integer noticeId);

    public void updateEmpNoticeReceiptType(Integer empId,Integer noticeId);

    public void updateEmpNoticeCount(Integer trueCount,Integer falseCount,Integer noticeId);


}
