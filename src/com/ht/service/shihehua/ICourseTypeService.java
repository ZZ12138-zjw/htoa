package com.ht.service.shihehua;

import com.ht.vo.educational.CourseTypeVo;

import java.util.List;

/**
 * Created by 华 on 2019/12/4.
 */
public interface ICourseTypeService {

    public void addCourseType(CourseTypeVo courseTypeVo);

    public List selCourseTypeList();

    public List selCourseTypePage(Integer currPage,Integer pageSize);

    public CourseTypeVo selCourseType(Integer courseTypeId);

    public int selCourseTypeCount();

    public void delCourseType(CourseTypeVo courseTypeVo);

    public void updateCourseType(CourseTypeVo courseTypeVo);

}
