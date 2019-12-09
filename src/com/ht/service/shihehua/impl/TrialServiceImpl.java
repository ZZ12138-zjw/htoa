package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.ITrialService;
import com.ht.vo.educational.TrialVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华 on 2019/12/4.
 */
@Service
public class TrialServiceImpl extends BaseDao implements ITrialService{

    @Override
    public void addTrial(TrialVo trialVo) {
        addObject(trialVo);
    }

    @Override
    public List selTrialList() {
        return listByHql("from TrialVo");
    }

    @Override
    public List selTrialListPage(Integer currpage, Integer pageSize) {
        return pageBySQL("select t.*,c.courseName,e.empName from course c right join t_trial t on c.courseid = t.Courseid left join t_emp e on t.empid=e.empId",currpage,pageSize);
    }

    @Override
    public TrialVo selTrial(Integer trialid) {
        return (TrialVo) getObject(TrialVo.class,trialid);
    }

    @Override
    public int selTrialCount() {
        return selTotalRow("select count(*) from t_trial");
    }

    @Override
    public void delTrial(TrialVo trialVo) {
        delObject(trialVo);
    }

    @Override
    public void delTrials(String ids) {
        executeSQL("delete from t_trial where trialid in("+ids+")");
    }

    @Override
    public void updateTrials(TrialVo trialVo) {
        updObject(trialVo);
    }
}
