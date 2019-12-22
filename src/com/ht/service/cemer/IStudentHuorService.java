package com.ht.service.cemer;

import com.ht.vo.student.StudentHuorVo;

import java.util.List;

/**
 * Created by 华 on 2019/12/10.
 */
public interface IStudentHuorService {

    public void addHuor(StudentHuorVo studentHuorVo);

    public List selHuorList();

    public List selHuorPage(Integer currPage,Integer pageSize);

    public StudentHuorVo selHuor(Integer hourId);

    public int selHuorCount();

    public void delHuor(StudentHuorVo studentHuorVo);

    public void delHuors(String ids);

    public void updateHuor(StudentHuorVo studentHuorVo);

    int getHuorCount(int huorId);

    public int selHourStudentCount(Integer hourId);

    public List selHourStudent(Integer hourId);

}
