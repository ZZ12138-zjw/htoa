package com.ht.service.cemer;

import java.util.List;

public interface ClassService {
    //所有班级信息
    List selectAll();
    //分页查询数据
    List selectByPage(int page,int size);
    //根据届别查询出符合班级
    List selectByAllFallcount(int fallid);
    //
    List selectByPageFall(int fallid,int page,int size);
}
