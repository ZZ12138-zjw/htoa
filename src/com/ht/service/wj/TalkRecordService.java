package com.ht.service.wj;

import com.ht.vo.employee.ChatRecordVo;

import java.util.List;

public interface TalkRecordService {
    List talkList(int currPage, int pageSize);
    int selCount();
    void addTalk(ChatRecordVo chatRecordVo);
    void delete(ChatRecordVo chatRecordVo);
    void deletes(String id);
}
