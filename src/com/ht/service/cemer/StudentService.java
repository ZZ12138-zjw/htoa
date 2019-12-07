//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.ht.service.cemer;

import com.ht.vo.student.StudentVo;
import java.util.List;

public interface StudentService {
    List getStudentInfo();

    List pageGetStudentInfo(int currPage, int pageSize);

    List getAllHuor();

    List getAllClass();

    void addStuVo(StudentVo var1);

    StudentVo getById(int stuId);

    void updStu(StudentVo studentVo);
}
