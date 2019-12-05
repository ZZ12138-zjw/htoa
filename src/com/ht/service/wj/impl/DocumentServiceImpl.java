package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.DocumentService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DocumentServiceImpl extends BaseDao implements DocumentService {
    @Override
    public List selDocument() {
        return listByHql("from dataDocVo");
    }
}
