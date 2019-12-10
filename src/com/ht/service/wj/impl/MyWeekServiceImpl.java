package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.MyWeekService;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MyWeekServiceImpl extends BaseDao implements MyWeekService {
    @Override
    public List selweek(String empName,int currPage, int pageSize,HttpSession session) {
        empName  = String.valueOf(session.getAttribute("username"));
        return pageBySQL("select * from t_weekly where empid=" + empName,currPage,pageSize);
    }
}
