package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.ICourseService;
import com.ht.vo.educational.CourseVo;
import org.springframework.stereotype.Service;

/**
 * Created by 华 on 2019/12/4.
 */
@Service
public class CourseServiceImpl extends BaseDao implements ICourseService{
    @Override
    public void addCourse(CourseVo courseVo) {
        addObject(courseVo);
    }
}
