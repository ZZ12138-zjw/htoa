package com.ht.service.xiaoen;

import com.ht.vo.employee.EmpCkBean;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.JobVo;

import java.util.List;

/**
 * Created by shkstart on 2019/12/10
 * @author LaIWeiChun
 */
public interface IJobService {

    List<JobVo> selectAll(int empId);

    void delete(JobVo jobVo);

    void update(JobVo jobVo);

    JobVo select(JobVo jobVo);

    List<JobVo> selectPage(int currPage, int pageSize);

    int selectCount();

    void save(JobVo jobVo);


}
