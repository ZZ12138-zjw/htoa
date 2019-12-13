package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.INoticeReceiptService;
import com.ht.vo.educational.Notice_ReceiptVo;
import org.springframework.stereotype.Service;

/**
 * Created by 华 on 2019/12/12.
 */
@Service
public class NoticeReceiptServiceImpl extends BaseDao implements INoticeReceiptService {
    @Override
    public void addNoticeReceipt(Notice_ReceiptVo notice_receiptVo) {
        addObject(notice_receiptVo);
    }
}
