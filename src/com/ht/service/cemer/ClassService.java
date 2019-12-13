package com.ht.service.cemer;

import com.ht.vo.student.StudentClassVo;

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
    //根据id查询出班级
    StudentClassVo getById(int classId);
    //删除班级
    void delClass(StudentClassVo studentClassVo);
    //删除完班级后，原该班级的学生的班级字段改为0
    void updateStudentClassId(int classid);
    //查询出所有班级类型
    List selectAllTypes();
}
