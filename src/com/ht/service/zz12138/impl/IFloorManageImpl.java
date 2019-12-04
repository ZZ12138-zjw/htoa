package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.IFloorManageService;
import com.ht.vo.LogisticsCheck.FloorManageVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 11:33
 * 楼栋管理
 */
@Service
public class IFloorManageImpl extends BaseDao implements IFloorManageService {
    @Override
    public List listFloorManage(int currPage, int pageSize) {
        return pageByHql("from FloorManageVo",currPage,pageSize);
    }

    @Override
    public void addFloorManage(FloorManageVo floorManageVo) {
        addObject(floorManageVo);
    }
}
