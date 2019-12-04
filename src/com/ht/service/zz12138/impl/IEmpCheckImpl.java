package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.IEmpCheck;
import com.ht.vo.LogisticsCheck.EmpCheckVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 10:33
 * 员工考核
 */
@Service
public class IEmpCheckImpl extends BaseDao implements IEmpCheck {
    @Override
    public List listEmpCheck(int currPage,int pageSize) {
        return pageByHql("from EmpCheck",currPage,pageSize);
    }

    @Override
    public void addEmpCheck(EmpCheckVo empCheckVo) {
        addObject(empCheckVo);
    }
}
