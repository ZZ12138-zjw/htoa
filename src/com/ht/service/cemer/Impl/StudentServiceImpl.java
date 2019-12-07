package com.ht.service.cemer.Impl;


import com.ht.dao.BaseDao;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.StudentVo;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl extends BaseDao implements StudentService {
    public StudentServiceImpl() {
    }

    @Override
    public List getStudentInfo() {
        return this.listBySQL("select s.stuId,s.stuName,s.stuno,s.sex,s.cardid,s.phone,c.className,h.hourName,s.state,s.collar,s.computer,s.grants,s.parents,s.parentsphone,s.qkMoney from t_student s left join t_studentclass c on s.classid = c.classId left join t_studenthuor h on h.hourId= s.hourid");
    }

    @Override
    public List pageGetStudentInfo(int currPage, int pageSize) {
        return this.pageBySQL("select s.stuId,s.stuName,s.stuno,s.sex,s.cardid,s.phone,c.className,h.hourName,s.state,s.collar,s.computer,s.grants,s.parents,s.parentsphone,s.qkMoney from t_student s left join t_studentclass c on s.classid = c.classId left join t_studenthuor h on h.hourId= s.hourid", currPage, pageSize);
    }

    @Override
    public List getAllHuor() {
        return this.listByHql("from StudentHuorVo");
    }

    @Override
    public List getAllClass() {
        return this.listByHql("from StudentClassVo");
    }

    @Override
    public void addStuVo(StudentVo var1) {
        this.addObject(var1);
    }

    @Override
    public StudentVo getById(int stuId) {
        return (StudentVo)getObject(StudentVo.class,stuId);
    }

    @Override
    public void updStu(StudentVo studentVo) {
        updObject(studentVo);
    }
}
