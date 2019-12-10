package com.ht.service.wj;

import com.ht.vo.employee.WeeklyVo;
import com.ht.vo.upload.dataDocVo;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MyWeekService {
    List selweek(int currPage,int pageSize);
    void addDoc(WeeklyVo weeklyVo);
    int selCount();
}
