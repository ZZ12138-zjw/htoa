package com.ht.service.shihehua;

import com.ht.vo.educational.NoticeVo;

import java.util.List;

/**
 * Created by 华 on 2019/12/12.
 */
public interface INoticeService {
    public void addNotice(NoticeVo noticeVo);

    public List<NoticeVo> NoticeIdList(String title);


}
