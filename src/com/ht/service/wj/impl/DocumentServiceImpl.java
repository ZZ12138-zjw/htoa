package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.DocumentService;
import com.ht.vo.upload.dataDocVo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DocumentServiceImpl extends BaseDao implements DocumentService {
    @Override
    public List selDocument(int currPage, int pageSize) {
        return pageBySQL("select d.*,e.empName from datadoc d left join t_emp e on d.empId = e.empId",currPage,pageSize);
    }

    @Override
    public int selCount() {
        return selTotalRow("select count(*) from datadoc");
    }

    @Override
    public void addDoc(dataDocVo docVo) {
        addObject(docVo);
    }

    @Override
    public void delDoc(dataDocVo docVo) {
        delObject(docVo);
    }

    @Override
    public void deletes(String id) {
        executeSQL("delete from datadoc where docId in("+id+")");
    }
}
