package com.ht.service.shihehua;

import com.ht.vo.educational.CourseVo;

import java.util.List;

/**
 * Created by 华 on 2019/12/4.
 */
public interface ICourseService {

    public List selCourse();

    public void addCourse(CourseVo courseVo);

    public List selCoursePage(Integer currPage,Integer pageSize);

    public CourseVo selCourse(Integer courseid);

    public int selCourseCount();

    public void updateCourse(CourseVo courseVo);

    public void delCourse(CourseVo courseVo);
}
