package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.WeekService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WeekServiceImpl extends BaseDao implements WeekService {
    @Override
    public List selWeek(int currPage, int pageSize) {
        return pageByHql("from WeeklyVo",currPage,pageSize);
    }

    @Override
    public int selCount() {
        return selTotalRow("select count(*) from t_weekly");
    }

}
