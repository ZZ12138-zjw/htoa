package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.CheckIndexVo;
import com.ht.vo.LogisticsCheck.CheckInsertVo;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/9 19:47
 */
public interface ICheckInsert {
    public List listCheckInsert(int page, int limit);

    public void addCheckInsert(CheckInsertVo vo);

    public int selAllCount();

    public List selectAll();

    public List selID(int ID);

    public List selectCheckScore(String checkContent);

    public void delCheckInsert(String iD);

    public CheckInsertVo selInsertByID(int iD);

    public void editCheckInsert(CheckInsertVo vo);

    List listByEmpId(int empId);
}
