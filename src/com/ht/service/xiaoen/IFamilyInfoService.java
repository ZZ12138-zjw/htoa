package com.ht.service.xiaoen;

import com.ht.vo.employee.EmpCkBean;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.FamilyInfoVo;

import java.util.List;

/**
 * Created by shkstart on 2019/12/10
 * @author LaiWeiChun
 */
public interface IFamilyInfoService {

    List<FamilyInfoVo> selectAll(int empId);

    void delete(FamilyInfoVo familyInfoVo);

    void update(FamilyInfoVo familyInfoVo);

    FamilyInfoVo select(FamilyInfoVo familyInfoVo);

    List<FamilyInfoVo> selectPage(int currPage, int pageSize);

    int selectCount();

    void save(FamilyInfoVo familyInfoVo);

}
