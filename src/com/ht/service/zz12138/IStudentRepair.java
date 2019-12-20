package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.StudentRepairApplyVo;
import com.ht.vo.student.StudentClassVo;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/19 10:39
 */
public interface IStudentRepair {
    public void addStudentRepair(StudentRepairApplyVo vo);

    public StudentClassVo selectStudentClass(int stuClassID);

    public List selectStudengRepair(int studentID);

    public int selectCount();

    public StudentRepairApplyVo studentRepair(int repairID);

    public void delStudentRepair(int repairID);
}
