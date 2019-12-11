package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IDocumentService;
import com.ht.vo.employee.DocumentVo;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * Created by shkstart on 2019/12/11
 * @author LaiWeiChun
 */
@Service("documentEmpService")
public class DocumentServiceImpl extends BaseDao implements IDocumentService {


    @Override
    public List<DocumentVo> selectAll(int empId) {
        return listBySQL("select d.*,e.empName from t_document d left join t_emp  e on d.empid=e.empId where d.empid="+empId);
    }

    @Override
    public void delete(DocumentVo documentVo) {
        delObject(documentVo);
    }

    @Override
    public void update(DocumentVo documentVo) {
        updObject(documentVo);
    }

    @Override
    public DocumentVo select(DocumentVo documentVo) {
        return (DocumentVo)getObject(DocumentVo.class,documentVo.getDocId());
    }

    @Override
    public List<DocumentVo> selectPage(int currPage, int pageSize) {
        return pageByHql("from DocumentVo ",currPage,pageSize);

    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_document");
    }

    @Override
    public void save(DocumentVo documentVo) {
        addObject(documentVo);
    }
}
