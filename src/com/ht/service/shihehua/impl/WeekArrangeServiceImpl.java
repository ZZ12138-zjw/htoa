package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.IWeekArrangeService;
import com.ht.vo.educational.WeekArrangeVo;
import org.springframework.stereotype.Service;

/**
 * Created by 华 on 2019/12/4.
 */
@Service
public class WeekArrangeServiceImpl extends BaseDao implements IWeekArrangeService{


    @Override
    public void addWeekArrange(WeekArrangeVo weekArrangeVo) {
        addObject(weekArrangeVo);
    }
}
