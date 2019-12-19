package com.ht.service.xiaoen;

import com.ht.vo.employee.EmpCkBean;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.ModuleVo;

import java.util.List;

/**
 * Created by shkstart on 2019/12/18
 * @author LaIWeiChun
 */
public interface IModuleService {

    List<ModuleVo> selectAll();

    void delete(ModuleVo moduleVo);

    void update(ModuleVo moduleVo);

    ModuleVo select(ModuleVo moduleVo);

    List<ModuleVo> selectPage(int currPage, int pageSize);

    int selectCount();

    void save(ModuleVo moduleVo);

}
