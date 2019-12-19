package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IModuleService;
import com.ht.vo.employee.ModuleVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shkstart on 2019/12/18
 * @author LaIWeiChun
 */
@Service
public class ModuleServiceImpl extends BaseDao implements IModuleService {


    @Override
    public List<ModuleVo> selectAll() {
        return listByHql("from ModuleVo");
    }

    @Override
    public void delete(ModuleVo moduleVo) {
        delObject(moduleVo);
    }

    @Override
    public void update(ModuleVo moduleVo) {
        updObject(moduleVo);
    }

    @Override
    public ModuleVo select(ModuleVo moduleVo) {
        return (ModuleVo)getObject(ModuleVo.class,moduleVo.getModuleId());
    }

    @Override
    public List<ModuleVo> selectPage(int currPage, int pageSize) {
        return pageByHql("from ModuleVo",currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_module");
    }

    @Override
    public void save(ModuleVo moduleVo) {
        addObject(moduleVo);
    }
}
