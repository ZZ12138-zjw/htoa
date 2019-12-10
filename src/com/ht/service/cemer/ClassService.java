package com.ht.service.cemer;

import java.util.List;

public interface ClassService {
    //所有班级信息
    List selectAll();
    //分页查询数据
    List selectByPage(int page,int size);
}
