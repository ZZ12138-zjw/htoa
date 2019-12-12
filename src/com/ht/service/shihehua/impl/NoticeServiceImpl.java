package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.INoticeService;
import com.ht.vo.educational.NoticeVo;
import org.springframework.stereotype.Service;

/**
 * Created by 华 on 2019/12/12.
 */
@Service
public class NoticeServiceImpl extends BaseDao implements INoticeService {
    @Override
    public void addNotice(NoticeVo noticeVo) {
        addObject(noticeVo);
    }
}
