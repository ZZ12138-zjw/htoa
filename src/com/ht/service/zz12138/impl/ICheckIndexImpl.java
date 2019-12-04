package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.ICheckIndex;
import com.ht.vo.LogisticsCheck.CheckIndexVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 10:13
 * 考核指标
 */
@Service
public class ICheckIndexImpl extends BaseDao implements ICheckIndex {
    @Override
    public List listCheckIndex(int currPage,int pageSize) {
        return pageByHql("from CheckIndexVo",currPage,pageSize);
    }

    @Override
    public void addCheckIndex(CheckIndexVo checkIndex) {
        addObject(checkIndex);
    }

}
