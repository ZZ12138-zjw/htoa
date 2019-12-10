package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IEducationService;
import com.ht.vo.employee.EducationVo;
import com.ht.vo.employee.EmpCkBean;

import java.util.List;

/**
 * Created by shkstart on 2019/12/10
 * @author LaiWeiChun
 */
public class EducationServiceImpl extends BaseDao implements IEducationService {


    @Override
    public List<EducationVo> selectAll() {
        return listByHql(" from EducationVo");
    }

    @Override
    public void delete(EducationVo educationVo) {
        delObject(educationVo);
    }

    @Override
    public void update(EducationVo educationVo) {
        updObject(educationVo);
    }

    @Override
    public EducationVo select(EducationVo educationVo) {
        return (EducationVo)getObject(EducationVo.class,educationVo.getCollegeid());
    }

    @Override
    public List<EducationVo> selectPage(int currPage, int pageSize, EmpCkBean empCk) {
        return pageByHql("from EducationVo",currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_education");
    }

    @Override
    public void save(EducationVo educationVo) {
        addObject(educationVo);
    }


}
