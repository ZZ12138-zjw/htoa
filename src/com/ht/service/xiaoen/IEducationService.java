package com.ht.service.xiaoen;

import com.ht.vo.employee.EducationVo;
import com.ht.vo.employee.EmpCkBean;
import com.ht.vo.employee.EmpVo;

import java.util.List;

/**
 * Created by shkstart on 2019/12/10
 * @author LaIWeiChun
 */
public interface IEducationService {


    List<EducationVo> selectAll();

    void delete(EducationVo educationVo);

    void update(EducationVo educationVo);

    EducationVo select(EducationVo educationVo);

    List<EducationVo> selectPage(int currPage, int pageSize, EmpCkBean empCk);

    int selectCount();

    void save(EducationVo educationVo);
}
