package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.FloorManageVo;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 11:12
 * 楼栋管理
 */
public interface IFloorManageService {
    public List listFloorManage(int currPage,int pageSize);

    public void addFloorManage(FloorManageVo floorManageVo);
}
