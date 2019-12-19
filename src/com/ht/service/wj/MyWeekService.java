package com.ht.service.wj;

import com.ht.vo.employee.WeekCheck;
import com.ht.vo.employee.WeeklyVo;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MyWeekService {
    List selweek(int currPage, int pageSize, Integer empid, HttpSession session, WeekCheck weekCheck);
    void addweek(WeeklyVo weeklyVo);
    int selCount(HttpSession session, Integer empid);
    void delete(WeeklyVo weeklyVo);
    void update(WeeklyVo weeklyVo);
    WeeklyVo selbyid(WeeklyVo weeklyVo);
    void deletes(String id);
    List mlist(int worklogid);
}
