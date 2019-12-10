package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.CheckIndexVo;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 10:12
 * 考核指标
 */
public interface ICheckIndex {
    public List listCheckIndex(int currPage,int pageSize);

    public void addCheckIndex(CheckIndexVo checkIndex);

    public int selAllCheck();

    public CheckIndexVo selCheckIndex(int checkIndexID);

    public void updateCheckIndex(CheckIndexVo vo);

    public void delcheckindex(String iD);
}
