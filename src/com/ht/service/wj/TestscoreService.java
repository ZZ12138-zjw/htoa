package com.ht.service.wj;

import com.ht.vo.student.TestscoreCheck;

import java.util.List;

public interface TestscoreService {
    List selTestscore(int currPage, int pageSize, TestscoreCheck testscoreCheck);
    int selCount();
    List selterm();
}
