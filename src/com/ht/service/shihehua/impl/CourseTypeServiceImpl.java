package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.ICourseTypeService;
import com.ht.vo.educational.CourseTypeVo;
import org.springframework.stereotype.Service;

/**
 * Created by 华 on 2019/12/4.
 */
@Service
public class CourseTypeServiceImpl extends BaseDao implements ICourseTypeService{
    @Override
    public void addCourseType(CourseTypeVo courseTypeVo) {
        addObject(courseTypeVo);
    }
}
