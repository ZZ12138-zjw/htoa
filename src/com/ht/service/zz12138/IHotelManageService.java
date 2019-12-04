package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.FloorManageVo;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 11:34
 * 宿舍管理
 */
public interface IHotelManageService {
    public List listHotelManage(int currPage,int pageSize);

    public void addHotelManage(FloorManageVo floorManageVo);
}
