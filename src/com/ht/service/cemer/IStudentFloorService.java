package com.ht.service.cemer;

import com.ht.vo.student.StudentFloorVo;

import java.util.List;

/**
 * Created by 华 on 2019/12/10.
 */
public interface IStudentFloorService {

    public void addFloor(StudentFloorVo studentFloorVo);

    public List selFloorList();

    public List selFloorPage(Integer currPage,Integer pageSize);

    public StudentFloorVo selFloor(Integer floorId);

    public int selFloorCount();

    public void delFloor(StudentFloorVo studentFloorVo);

    public void delFloors(String ids);

    public void updFloor(StudentFloorVo studentFloorVo);

}
