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

    public List selectCheckScore(int checkContentID);

    public void delCheckInsert(String iD);

    public CheckInsertVo selInsertByID(int iD);

    public void editCheckInsert(CheckInsertVo vo);

    //查询出所有部门
    public List selectAllDep();

    //查询出所有员工
    public List selectAllEmp();

    //查询出某某部门下所有员工
    public List selectAllEmp(int deptid);

    public List selectAllCheckIndex();

    public List selectAllCheckInsert(int checkInsertID);

    public CheckInsertVo selectCheckInsert(int checkInsertID);
}