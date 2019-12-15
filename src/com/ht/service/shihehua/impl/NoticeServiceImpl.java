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
        return pageBySQL("select n.*,e.empName from t_notice n left join t_emp e on n.empid=e.empId where noticeType=1",currPage,pageSize);
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
        executeSQL("delete from t_notice n left jion notice_receipt nr on n.noticeId=nr.noticeId where noticeId="+noticeId);
    }

    @Override
    public void delNotices(String ids) {
        executeSQL("delete from t_notice n left jion notice_receipt nr on n.noticeId=nr.noticeId where noticeId in("+ids+")");
    }
}
