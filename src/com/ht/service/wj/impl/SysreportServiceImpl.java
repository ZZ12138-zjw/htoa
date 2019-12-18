package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.SysreportService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysreportServiceImpl extends BaseDao implements SysreportService {
    @Override
    public List empAssess() {
        return listBySQL("select ch.empID,ch.empName,ch.depName,e.sex,e.phone,sum(ch.checkScore) from checkinsert ch left join t_emp e on ch.empID = e.empId");
    }
}
