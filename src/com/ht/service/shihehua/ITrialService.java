package com.ht.service.shihehua;

import com.ht.vo.educational.TrialVo;

import java.util.List;

/**
 * Created by 华 on 2019/12/4.
 */
public interface ITrialService {

    public void addTrial(TrialVo trialVo);

    public List selTrialList();

    public List selTrialListPage(Integer currpage,Integer pageSize);

    public TrialVo selTrial(Integer trialid);

    public int selTrialCount();

    public void delTrial(TrialVo trialVo);

    public void delTrials(String ids);

    public void updateTrials(TrialVo trialVo);

}
