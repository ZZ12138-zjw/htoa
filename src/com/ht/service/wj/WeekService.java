package com.ht.service.wj;

import java.util.List;

public interface WeekService {
    List selWeek(int currPage, int pageSize);
    int selCount();
}
