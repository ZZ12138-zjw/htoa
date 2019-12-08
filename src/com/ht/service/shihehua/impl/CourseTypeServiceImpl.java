package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.ICourseTypeService;
import com.ht.vo.educational.CourseTypeVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华 on 2019/12/4.
 */
@Service
public class CourseTypeServiceImpl extends BaseDao implements ICourseTypeService{
    @Override
    public void addCourseType(CourseTypeVo courseTypeVo) {
        addObject(courseTypeVo);
    }

    @Override
    public List selCourseTypeList() {
        return listByHql("from CourseTypeVo");
    }

    @Override
    public List selCourseTypePage(Integer currPage, Integer pageSize) {
        return pageByHql("from CourseTypeVo",currPage,pageSize);
    }

    @Override
    public CourseTypeVo selCourseType(Integer courseTypeId) {
        return (CourseTypeVo) getObject(CourseTypeVo.class,courseTypeId);
    }

    @Override
    public int selCourseTypeCount() {
        return selTotalRow("select count(*) from coursetype");
    }

    @Override
    public void delCourseType(CourseTypeVo courseTypeVo) {
        delObject(courseTypeVo);
    }

    @Override
    public void delCourseTypes(String ids) {
        executeSQL("delete from coursetype where courseTypeId in ("+ids+") ");
    }

    @Override
    public void updateCourseType(CourseTypeVo courseTypeVo) {
        updObject(courseTypeVo);
    }
}
