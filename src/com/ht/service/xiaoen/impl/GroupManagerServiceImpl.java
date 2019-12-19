package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IGroupManagerService;
import com.ht.vo.employee.GroupManagerVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shkstart on 2019/12/18
 * @author LaIWeiChun
 */
@Service
public class GroupManagerServiceImpl extends BaseDao implements IGroupManagerService {


    @Override
    public List<GroupManagerVo> selectAll() {
        return listByHql("from GroupManagerVo");
    }

    @Override
    public void delete(GroupManagerVo groupManagerVo) {
        delObject(groupManagerVo);
    }

    @Override
    public void update(GroupManagerVo groupManagerVo) {
        updObject(groupManagerVo);
    }

    @Override
    public GroupManagerVo select(GroupManagerVo groupManagerVo) {
        return (GroupManagerVo)getObject(GroupManagerVo.class,groupManagerVo.getGroupId());
    }

    @Override
    public List<GroupManagerVo> selectPage(int currPage, int pageSize) {
        return pageByHql("from GroupManagerVo",currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_groupmanager");
    }

    @Override
    public void save(GroupManagerVo groupManagerVo) {
        addObject(groupManagerVo);
    }
}
