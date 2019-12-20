package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.TalkRecordService;
import com.ht.vo.employee.ChatRecordVo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TalkRecordServiceImpl extends BaseDao implements TalkRecordService {
    @Override
    public List talkList(int currPage, int pageSize) {
        return pageBySQL("select c.*,s.stuName,e.empName from t_chatrecord c left join t_student s on c.sayface = s.stuId left join t_emp e on c.teacher = e.empId",currPage,pageSize) ;
    }

    @Override
    public int selCount() {
        return selTotalRow("select count(*) from t_chatRecord");
    }

    @Override
    public void addTalk(ChatRecordVo chatRecordVo) {
        addObject(chatRecordVo);
    }

    @Override
    public void delete(ChatRecordVo chatRecordVo) {
        delObject(chatRecordVo);
    }

    @Override
    public void deletes(String id) {
        executeSQL("delete from t_chatRecord where chatid in("+id+")");
    }

    @Override
    public List stulist(int classId) {
        return listBySQL("select stuName,stuId from t_student where classid=" + classId);
    }
}
