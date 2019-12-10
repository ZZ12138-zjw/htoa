package com.ht.service.wj;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MyWeekService {
    List selweek(String empName, int currPage, int pageSize, HttpSession session);
}
