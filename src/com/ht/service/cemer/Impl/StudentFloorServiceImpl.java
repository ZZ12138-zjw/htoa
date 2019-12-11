package com.ht.service.cemer.Impl;

import com.ht.dao.BaseDao;
import com.ht.service.cemer.IStudentFloorService;
import com.ht.vo.student.StudentFloorVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华 on 2019/12/10.
 */
@Service
public class StudentFloorServiceImpl extends BaseDao implements IStudentFloorService{


    @Override
    public void addFloor(StudentFloorVo studentFloorVo) {
        addObject(studentFloorVo);
    }

    @Override
    public List selFloorList() {
        return listByHql("from StudentFloorVo");
    }

    @Override
    public List selFloorPage(Integer currPage, Integer pageSize) {
        return pageByHql("from StudentFloorVo",currPage,pageSize);
    }

    @Override
    public StudentFloorVo selFloor(Integer floorId) {
        return (StudentFloorVo) getObject(StudentFloorVo.class,floorId);
    }

    @Override
    public int selFloorCount() {
        return selTotalRow("select count(*) from t_studentFloor");
    }

    @Override
    public void delFloor(StudentFloorVo studentFloorVo) {
        delObject(studentFloorVo);
    }

    @Override
    public void delFloors(String ids) {
        executeSQL("delete from t_studentFloor where floorId in("+ids+")");
    }

    @Override
    public void updFloor(StudentFloorVo studentFloorVo) {
        updObject(studentFloorVo);
    }
}
