package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.IRepairManageService;
import com.ht.vo.LogisticsCheck.RepairManageVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 11:37
 * 维修管理
 */
@Service
public class IRepairManageImpl extends BaseDao implements IRepairManageService {
    @Override
    public List listRepairManage(int currPage, int pageSize) {
        return pageByHql("from RepairManageVo",currPage,pageSize);
    }

    @Override
    public void addRepairMange(RepairManageVo repairManageVo) {
        addObject(repairManageVo);
    }

    @Override
    public int selTotal() {
        return selTotalRow("select count(*) from repairmanage");
    }
}
