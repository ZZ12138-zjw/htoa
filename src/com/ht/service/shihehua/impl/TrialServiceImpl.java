package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.ITrialService;
import com.ht.vo.educational.TrialVo;
import org.springframework.stereotype.Service;

/**
 * Created by 华 on 2019/12/4.
 */
@Service
public class TrialServiceImpl extends BaseDao implements ITrialService{

    @Override
    public void addTrial(TrialVo trialVo) {
        addObject(trialVo);
    }
}
