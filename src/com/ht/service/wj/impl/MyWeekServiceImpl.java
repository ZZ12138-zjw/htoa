package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.MyWeekService;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.WeeklyVo;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MyWeekServiceImpl extends BaseDao implements MyWeekService {

    @Override
    public List selweek(int currPage, int pageSize) {
        return pageBySQL("select * from t_weekly",currPage,pageSize);
    }

    @Override
    public void addDoc(WeeklyVo weeklyVo) {
        addObject(weeklyVo);
    }

    @Override
    public int selCount() {
        return selTotalRow("select count(*) from t_weekly");
    }
}
