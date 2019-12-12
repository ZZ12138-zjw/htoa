package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IFamilyInfoService;
import com.ht.service.zz12138.IFloorManageService;
import com.ht.vo.LogisticsCheck.FloorManageVo;
import com.ht.vo.employee.FamilyInfoVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shkstart on 2019/12/10
 * @author LaiWeiChun
 */
@Service
public class FamilylnfoServiceImpl extends BaseDao implements IFamilyInfoService {


    @Override
    public List<FamilyInfoVo> selectAll(int empId) {
        return listByHql("from FamilyInfoVo f where f.empId="+empId);
    }

    @Override
    public void delete(FamilyInfoVo familyInfoVo) {
        delObject(familyInfoVo);
    }

    @Override
    public void update(FamilyInfoVo familyInfoVo) {
        updObject(familyInfoVo);
    }

    @Override
    public FamilyInfoVo select(FamilyInfoVo familyInfoVo) {
        return (FamilyInfoVo)getObject(FamilyInfoVo.class,familyInfoVo.getFamilyid());
    }

    @Override
    public List<FamilyInfoVo> selectPage(int currPage, int pageSize) {
        return pageByHql("from FamilyInfoVo",currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_familyinfo");
    }

    @Override
    public void save(FamilyInfoVo familyInfoVo) {
        addObject(familyInfoVo);
    }
}
