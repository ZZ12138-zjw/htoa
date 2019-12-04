package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.EmpCheckVo;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 10:20
 * 员工考核
 */
public interface IEmpCheck {
    public List listEmpCheck(int currPage,int pageSize);

    public void addEmpCheck(EmpCheckVo empCheckVo);
}
