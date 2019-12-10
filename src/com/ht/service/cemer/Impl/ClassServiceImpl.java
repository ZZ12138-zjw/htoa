package com.ht.service.cemer.Impl;

import com.ht.dao.BaseDao;
import com.ht.service.cemer.ClassService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl extends BaseDao implements ClassService{
    @Override
    public List selectAll() {
        return listBySQL("select c.classId,c.className,c.classNo,c.teacher,c.classTeacher,t.typeName,f.level,c.remark from t_studentclass c left join t_studenttype t on c.classType = t.classType left join t_studentfall f on f.fallid = c.falled");
    }

    @Override
    public List selectByPage(int page, int size) {
        return pageBySQL("select c.classId,c.className,c.classNo,c.teacher,c.classTeacher,t.typeName,f.level,c.remark from t_studentclass c left join t_studenttype t on c.classType = t.classType left join t_studentfall f on f.fallid = c.falled",page,size);
    }
}
