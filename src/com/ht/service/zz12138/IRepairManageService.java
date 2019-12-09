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

    public int selTotal();

    public void delRepairManage(int repairID);

    public RepairManageVo listRepair(int repaieID);

    public List<RepairManageVo> allList();

    public void alldelete(String repairID);

    public void editrepairmanage(RepairManageVo vo);
}
