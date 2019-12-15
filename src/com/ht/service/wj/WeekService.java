package com.ht.service.wj;

import com.ht.vo.employee.WeekCheck;

import java.util.List;

public interface WeekService {
    List selWeek(int currPage, int pageSize, WeekCheck weekCheck);
    int selCount();
}
