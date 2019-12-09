package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.ICourseService;
import com.ht.vo.educational.CourseVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华 on 2019/12/4.
 */
@Service
public class CourseServiceImpl extends BaseDao implements ICourseService{
    @Override
    public List selCourseList() {
        return listByHql("from CourseVo");
    }

    @Override
    public void addCourse(CourseVo courseVo) {
        addObject(courseVo);
    }

    @Override
    public List selCoursePage(Integer currPage, Integer pageSize) {
        return pageBySQL("select cs.*,ct.courseTypeName from course cs left join coursetype ct on cs.courseTypeId=ct.courseTypeId",currPage,pageSize);
    }

    @Override
    public CourseVo selCourse(Integer courseid) {
        return (CourseVo) getObject(CourseVo.class,courseid);
    }

    @Override
    public int selCourseCount() {
        return selTotalRow("select count(*) from course");
    }

    @Override
    public void updateCourse(CourseVo courseVo) {
        updObject(courseVo);
    }

    @Override
    public void delCourse(CourseVo courseVo) {
        delObject(courseVo);
    }

    @Override
    public void delCourses(String ids) {
        executeSQL("delete from course where courseid in ("+ids+")");
    }

}
