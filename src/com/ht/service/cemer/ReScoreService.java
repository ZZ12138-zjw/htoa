package com.ht.service.cemer;

import com.ht.vo.student.ReScoreCheck;

import java.util.List;

public interface ReScoreService {
    List selectAllProject();

    int getByCheckCount(ReScoreCheck scoreCheck);

    List getByCheck(ReScoreCheck reScoreCheck,int page,int limit);
}
