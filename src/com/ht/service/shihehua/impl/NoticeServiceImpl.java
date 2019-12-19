package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.INoticeService;
import com.ht.vo.educational.NoticeVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华 on 2019/12/12.
 */
@Service
public class NoticeServiceImpl extends BaseDao implements INoticeService {
    @Override
    public void addNotice(NoticeVo noticeVo) {
        addObject(noticeVo);
    }

    @Override
    public List NoticeIdList(String title) {
        return listBySQL("select * from t_notice where title='"+title+"'");
    }

    @Override
    public List StudentList() {
        return listByHql("from StudentVo");
    }

    @Override
    public int StudentCount() {
        return selTotalRow("select count(*) from t_student");
    }

    //noticeId,title,noticeType,empid,noticeTime,trueConut,falseCount
    @Override
    public List selEmpNoticePage(Integer currPage, Integer pageSize) {
        return pageBySQL("select n.*,e.empName from t_notice n left join t_emp e on n.empid=e.empId where noticeType in(1,3)",currPage,pageSize);
    }

    @Override
    public List selStudentNoticePage(Integer currPage, Integer pageSize) {
        return pageBySQL("select * from t_notice where noticeType=2",currPage,pageSize);
    }

    @Override
    public NoticeVo selNotice(Integer noticeId) {
        return (NoticeVo) getObject(NoticeVo.class,noticeId);
    }

    @Override
    public int selEmpNoticeCount() {
        return selTotalRow("select count(*) from t_notice where noticeType=1");
    }

    @Override
    public void NoticeUpdate(NoticeVo noticeVo) {
        updObject(noticeVo);
    }

    @Override
    public int selStudentNoticeCount() {
        return selTotalRow("select count(*) from t_notice where noticeType=2");
    }

    @Override
    public void delNotice(Integer noticeId) {
        executeSQL("delete from t_notice where noticeId="+noticeId);
    }

    @Override
    public void delNoticeReceipt(Integer noticeId) {
        executeSQL("delete from notice_receipt where noticeId="+noticeId);
    }

    @Override
    public void delNotices(String ids) {
        executeSQL("delete from t_notice where noticeId in("+ids+")");
    }

    @Override
    public void delNoticeReceipts(String ids) {
        executeSQL("delete from notice_receipt where noticeId in("+ids+")");
    }

    @Override
    public List selNoticeReceiptEmpList(Integer noticeId) {
        return listBySQL("select n.title,e.empName,n.noticeTime,e1.empName js,n.noticeType,r.isRead from t_emp e right join t_notice n on n.empid=e.empId left join notice_receipt r on n.noticeId=r.noticeId left join t_emp e1 on r.receiver = e1.empId where n.noticeType in(1,3) and r.type=1 and n.noticeId="+noticeId);
    }

    @Override
    public List selEmpNoticeList(Integer empId) {
        return listBySQL("select n.noticeId,n.title,n.noticeTime,n.content,r.isRead,e.empId from t_notice n right join notice_receipt r on n.noticeId = r.noticeId left join t_emp e on r.receiver=e.empId where r.type in(1,3) and e.empId="+empId);
    }

    @Override
    public int EmpNoticeFalseCount(Integer noticeId) {
        return selTotalRow("select count(*) from notice_receipt where type=1 and isRead=2 and noticeId="+noticeId+"");
    }

    @Override
    public int EmpNoticeTrueCount(Integer noticeId) {
        return selTotalRow("select count(*) from notice_receipt where type=1 and isRead=1 and noticeId="+noticeId+"");
    }

    @Override
    public void updateEmpNoticeReceiptType(Integer empId,Integer noticeId) {
        executeSQL("update notice_receipt set isRead=1 where type=1 and receiver="+empId+" and noticeId="+noticeId+"");
    }

    @Override
    public void updateEmpNoticeCount(Integer trueCount,Integer falseCount,Integer noticeId) {
        executeSQL("update t_notice set trueConut="+trueCount+",falseCount="+falseCount+" where noticeId="+noticeId+"");
    }
}
