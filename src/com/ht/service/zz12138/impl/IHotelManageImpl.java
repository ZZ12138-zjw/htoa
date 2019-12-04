package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.IHotelManageService;
import com.ht.vo.LogisticsCheck.FloorManageVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 11:35
 * 宿舍管理
 */
@Service
public class IHotelManageImpl extends BaseDao implements IHotelManageService {
    @Override
    public List listHotelManage(int currPage, int pageSize) {
        return pageByHql("from HotelManageVo",currPage,pageSize);
    }

    @Override
    public void addHotelManage(FloorManageVo floorManageVo) {
        addObject(floorManageVo);
    }
}
