package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.RepairManageVo;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 11:37
 * 维修管理
 */
public interface IRepairManageService {
    public List listRepairManage(int currPage,int pageSize);

    public void addRepairMange(RepairManageVo repairManageVo);
}