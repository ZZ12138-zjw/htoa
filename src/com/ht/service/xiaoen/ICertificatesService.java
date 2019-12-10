package com.ht.service.xiaoen;

import com.ht.vo.employee.CertificatesVo;
import com.ht.vo.employee.EducationVo;
import com.ht.vo.employee.EmpCkBean;

import java.util.List;

/**
 * Created by shkstart on 2019/12/10
 * @author LaiWeiChun
 */
public interface ICertificatesService {

    List<CertificatesVo> selectAll();

    void delete(CertificatesVo certificatesVo);

    void update(CertificatesVo certificatesVo);

    CertificatesVo select(CertificatesVo certificatesVo);

    List<CertificatesVo> selectPage(int currPage, int pageSize);

    int selectCount();

    void save(CertificatesVo certificatesVo);
}
