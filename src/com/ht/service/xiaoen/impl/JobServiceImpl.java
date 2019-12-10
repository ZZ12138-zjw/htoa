package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IJobService;
import com.ht.vo.employee.JobVo;
import java.util.List;

/**
 * Created by shkstart on 2019/12/10
 * @author LaiWeiChun
 */
public class JobServiceImpl  extends BaseDao implements IJobService {


    @Override
    public List<JobVo> selectAll() {
        return listByHql("from JobVo");
    }

    @Override
    public void delete(JobVo jobVo) {
        delObject(jobVo);

    }

    @Override
    public void update(JobVo jobVo) {
        updObject(jobVo);
    }

    @Override
    public JobVo select(JobVo jobVo) {
        return (JobVo)getObject(JobVo.class,jobVo.getJobid());
    }

    @Override
    public List<JobVo> selectPage(int currPage, int pageSize) {
        return pageByHql("from JobVo ",currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_emp");
    }

    @Override
    public void save(JobVo jobVo) {
        addObject(jobVo);
    }


}
