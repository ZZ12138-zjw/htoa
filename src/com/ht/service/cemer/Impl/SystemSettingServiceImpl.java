package com.ht.service.cemer.Impl;

import com.ht.dao.BaseDao;
import com.ht.service.cemer.SystemSettingService;
import com.ht.vo.employee.DeptVo;
import com.ht.vo.student.StudentFallVo;
import com.ht.vo.student.StudentTypeVo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemSettingServiceImpl extends BaseDao implements SystemSettingService {
    @Override
    public List selectJieBieAll() {
        return listByHql("from StudentFallVo");
    }

    @Override
    public List selectJieBieByPage(int page, int limit) {
        return pageByHql("from StudentFallVo",page,limit);
    }

    @Override
    public void addStudentFallVo(StudentFallVo studentFallVo) {
        addObject(studentFallVo);
    }

    @Override
    public StudentFallVo getFallById(int fallid) {
        return (StudentFallVo)getObject(StudentFallVo.class,fallid);
    }

    @Override
    public void deleteJieBie(StudentFallVo studentFallVo) {
        delObject(studentFallVo);
    }

    @Override
    public List selectClaTypeAll() {
        return listByHql("from StudentTypeVo");
    }

    @Override
    public List selectClaTypeByPage(int page, int limit) {
        return pageByHql("from StudentTypeVo",page,limit);
    }

    @Override
    public void addClassTypeVo(StudentTypeVo studentTypeVo) {
        addObject(studentTypeVo);
    }

    @Override
    public StudentTypeVo getclaTypeById(int classType) {
        return (StudentTypeVo)getObject(StudentTypeVo.class,classType);
    }

    @Override
    public void deleteClaType(StudentTypeVo studentTypeVo) {
        delObject(studentTypeVo);
    }

    @Override
    public List selectDeptAll() {
        return listByHql("from DeptVo");
    }

    @Override
    public List selectDeptByPage(int page, int limit) {
        return pageByHql("from DeptVo",page,limit);
    }

    @Override
    public void addDept(DeptVo deptVo) {
        addObject(deptVo);
    }

    @Override
    public DeptVo getDeptById(int depid) {
        return (DeptVo)getObject(DeptVo.class,depid);
    }

    @Override
    public void deleteDept(DeptVo deptVo) {
        delObject(deptVo);
    }

    @Override
    public List selectEmpAll() {
        return listByHql("from EmpVo");
    }
}
