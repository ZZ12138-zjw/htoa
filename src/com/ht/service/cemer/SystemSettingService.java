package com.ht.service.cemer;

import com.ht.vo.employee.DeptVo;
import com.ht.vo.student.StudentFallVo;
import com.ht.vo.student.StudentTypeVo;

import java.util.List;

public interface SystemSettingService {
    List selectJieBieAll();
    List selectJieBieByPage(int page,int limit);
    void addStudentFallVo(StudentFallVo studentFallVo);
    StudentFallVo getFallById(int fallid);
    void deleteJieBie(StudentFallVo studentFallVo);

    List selectClaTypeAll();
    List selectClaTypeByPage(int page,int limit);
    void addClassTypeVo(StudentTypeVo studentTypeVo);
    StudentTypeVo getclaTypeById(int classType);
    void deleteClaType(StudentTypeVo studentTypeVo);

    List selectDeptAll();
    List selectDeptByPage(int page,int limit);
    void addDept(DeptVo deptVo);
    DeptVo getDeptById(int depid);
    void deleteDept(DeptVo deptVo);

    List selectEmpAll();
}
