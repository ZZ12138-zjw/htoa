package com.ht.service.wj;

import com.ht.vo.upload.dataDocVo;

import java.util.List;

public interface DocumentService {
    List selDocument(int currPage,int pageSize);
    int selCount();
    void addDoc(dataDocVo docVo);
    void delDoc(dataDocVo docVo);
    void deletes(String id);
}
