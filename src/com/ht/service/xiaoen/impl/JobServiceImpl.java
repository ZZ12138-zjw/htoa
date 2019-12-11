package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IJobService;
import com.ht.vo.employee.JobVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shkstart on 2019/12/10
 * @author LaiWeiChun
 */
@Service
public class JobServiceImpl  extends BaseDao implements IJobService {


    @Override
    public List<JobVo> selectAll(int empId) {
        return listByHql("from JobVo j where j.empid="+empId);
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
        return selTotalRow("select count(*) from t_job");
    }

    @Override
    public void save(JobVo jobVo) {
        addObject(jobVo);
    }


}
