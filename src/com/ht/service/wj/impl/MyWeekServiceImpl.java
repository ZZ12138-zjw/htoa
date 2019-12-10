package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.MyWeekService;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.WeeklyVo;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.List;

@Service
public class MyWeekServiceImpl extends BaseDao implements MyWeekService {

    @Override
    public List selweek(String empName, int currPage, int pageSize,HttpSession session) {
        EmpVo empVo = (EmpVo)session.getAttribute("empVo");
        empName = empVo.getEmpName();
        return pageBySQL("from t_weekly where empid =" + empName,currPage,pageSize);
    }

    @Override
    public void addDoc(WeeklyVo weeklyVo) {
        addObject(weeklyVo);
    }

    @Override
    public int selCount(HttpSession session) {
        EmpVo empVo = (EmpVo)session.getAttribute("empVo");
        String empName = empVo.getEmpName();
        return selTotalRow("select count(*) from t_weekly from where empid=" + empName);
    }
}
