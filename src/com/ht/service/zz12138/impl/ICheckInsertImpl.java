package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.ICheckInsert;
import com.ht.vo.LogisticsCheck.CheckIndexVo;
import com.ht.vo.LogisticsCheck.CheckInsertVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/9 19:47
 */

@Service
public class ICheckInsertImpl extends BaseDao implements ICheckInsert {
    @Override
    public List listCheckInsert(int page, int limit) {
        return pageByHql("from CheckInsertVo",page,limit);
    }

    @Override
    public void addCheckInsert(CheckInsertVo vo) {
        addObject(vo);
    }

    @Override
    public int selAllCount() {
        return selTotalRow("select count(*) from checkinsert");
    }

    @Override
    public List selectAll() {
        return listByHql("from CheckIndexVo");
    }

    @Override
    public List selID(int ID) {
        return listBySQL("select checkScore from checkinsert where ID ="+ID);
    }

    @Override
    public List selectCheckScore(String checkContent) {
        return listBySQL("select checkScore from checkindex where checkContent in( '"+checkContent+"')");
    }

    @Override
    public void delCheckInsert(String iD) {
        executeSQL("delete from checkinsert where ID in(" +iD+")");
    }

    @Override
    public CheckInsertVo selInsertByID(int iD) {
        return (CheckInsertVo) getObject(CheckInsertVo.class,iD);
    }

    @Override
    public void editCheckInsert(CheckInsertVo vo) {
        updObject(vo);
    }

    @Override
    public List listByEmpId(int empId) {
        return listBySQL("select * from checkinsert c where  c.empID="+empId);
    }



}
