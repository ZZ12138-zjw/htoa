package com.ht.service.xiaoen;

import com.ht.vo.employee.DeptVo;
import com.ht.vo.employee.EmpVo;

import java.util.List;

/**
 * Created by shkstart on 2019/12/5
 * @author LaIWeiChun
 */
public interface IEmpService  {


    List<EmpVo> selectAll();

    void delete(EmpVo empVo);

    void update(EmpVo empVo);

    EmpVo select(EmpVo empVo);

    List<EmpVo> selectPage(int currPage,int pageSize);

    int selectCount();

    void save(EmpVo empVo);


}
