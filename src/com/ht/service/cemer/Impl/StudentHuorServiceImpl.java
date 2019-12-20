package com.ht.service.cemer.Impl;

import com.ht.dao.BaseDao;
import com.ht.service.cemer.IStudentHuorService;
import com.ht.vo.student.StudentHuorVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华 on 2019/12/10.
 */
@Service
public class StudentHuorServiceImpl extends BaseDao implements IStudentHuorService {
    @Override
    public void addHuor(StudentHuorVo studentHuorVo) {
        addObject(studentHuorVo);
    }

    @Override
    public List selHuorList() {
        return listByHql("from t_studentHuor");
    }

    @Override
    public List selHuorPage(Integer currPage, Integer pageSize) {
        return pageBySQL("select h.*,f.floorName from t_studentHuor h left join t_studentFloor f on h.floorId=f.floorId",currPage,pageSize);
    }

    @Override
    public StudentHuorVo selHuor(Integer hourId) {
        return (StudentHuorVo) getObject(StudentHuorVo.class,hourId);
    }

    @Override
    public int selHuorCount() {
        return selTotalRow("select count(*) from t_studentHuor");
    }

    @Override
    public void delHuor(StudentHuorVo studentHuorVo) {
        delObject(studentHuorVo);
    }

    @Override
    public void delHuors(String ids) {
        executeSQL("delete from t_studentHuor where hourId in("+ids+")");
    }

    @Override
    public void updateHuor(StudentHuorVo studentHuorVo) {
        updObject(studentHuorVo);
    }

    @Override
    public int getHuorCount(int huorId) {
        return listByHql("from StudentVo where hourid="+huorId).size();
    }
}
