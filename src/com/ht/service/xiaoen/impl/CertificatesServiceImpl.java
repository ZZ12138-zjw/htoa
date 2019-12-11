package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.ICourseService;
import com.ht.service.xiaoen.ICertificatesService;
import com.ht.vo.employee.CertificatesVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shkstart on 2019/12/10
 * @author LaiWeiChun
 */
@Service
public class CertificatesServiceImpl extends BaseDao implements ICertificatesService {


    @Override
    public List<CertificatesVo> selectAll() {
        return listByHql("from CertificatesVo");
    }

    @Override
    public void delete(CertificatesVo certificatesVo) {
        delObject(certificatesVo);
    }

    @Override
    public void update(CertificatesVo certificatesVo) {
        updObject(certificatesVo);
    }

    @Override
    public CertificatesVo select(CertificatesVo certificatesVo) {
        return (CertificatesVo)getObject(CertificatesVo.class,certificatesVo.getCfId());
    }

    @Override
    public List<CertificatesVo> selectPage(int currPage, int pageSize) {
        return pageByHql("from CertificatesVo",currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from  t_certificate");
    }

    @Override
    public void save(CertificatesVo certificatesVo) {
        addObject(certificatesVo);
    }
}
