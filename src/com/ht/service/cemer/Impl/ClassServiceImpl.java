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

    @Override
    public List selectByAllFallcount(int fallid) {
        return listBySQL("select c.classId,c.className,c.classNo,c.teacher,c.classTeacher,t.typeName,f.level,c.remark from t_studentclass c,t_studenttype t,t_studentfall f where c.classType = t.classType and f.fallid= c.falled and f.fallid ="+fallid);
    }

    @Override
    public List selectByPageFall(int fallid, int page, int size) {
        return pageBySQL("select c.classId,c.className,c.classNo,c.teacher,c.classTeacher,t.typeName,f.level,c.remark from t_studentclass c,t_studenttype t,t_studentfall f where c.classType = t.classType and f.fallid= c.falled and f.fallid ="+fallid,page,size);
    }
}
