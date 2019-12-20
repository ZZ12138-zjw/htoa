package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.IStudentRepair;
import com.ht.vo.LogisticsCheck.StudentRepairApplyVo;
import com.ht.vo.student.StudentClassVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/19 10:40
 */
@Service
public class IStudentRepairImpl extends BaseDao implements IStudentRepair {
    @Override
    public void addStudentRepair(StudentRepairApplyVo vo) {
        addObject(vo);
    }

    @Override
    public StudentClassVo selectStudentClass(int stuClassID) {
        return (StudentClassVo) getObject(StudentClassVo.class,stuClassID);
    }

    @Override
    public List selectStudengRepair(int studentID) {
        return listBySQL("select * from t_studentrepairapply where studentID = "+studentID);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_studentrepairapply");
    }

    @Override
    public StudentRepairApplyVo studentRepair(int repairID) {
        return (StudentRepairApplyVo)getObject(StudentRepairApplyVo.class,repairID);
    }

    @Override
    public void delStudentRepair(int repairID) {
        executeSQL("delete from t_studentrepairapply where repairID = "+repairID);
    }
}
