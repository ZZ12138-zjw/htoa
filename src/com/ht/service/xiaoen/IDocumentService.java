package com.ht.service.xiaoen;

import com.ht.vo.employee.DocumentVo;
import com.ht.vo.employee.FamilyInfoVo;

import java.util.List;

/**
 * Created by shkstart on 2019/12/11
 * @author LaiWeiChun
 */
public interface IDocumentService {

    List<DocumentVo> selectAll(int empId);

    void delete(DocumentVo documentVo);

    void update(DocumentVo documentVo);

    DocumentVo select(DocumentVo documentVo);

    List<DocumentVo> selectPage(int currPage, int pageSize);

    int selectCount();

    void save(DocumentVo documentVo);


}
