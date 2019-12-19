package com.ht.service.wj.impl;

import com.ht.dao.BaseDao;
import com.ht.service.wj.TestscoreService;
import com.ht.vo.student.TestscoreCheck;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestscoreServiceImpl extends BaseDao implements TestscoreService {
    @Override
    public List selTestscore(int currPage, int pageSize, TestscoreCheck testscoreCheck) {
        String sql = "select sc.*,st.stuName,co.courseName,te.termName,e.empName,ty.typeName from t_studentscore sc left join t_student st on sc.stuid = st.stuId left join course co on co.courseid = sc.courseId left join term te on te.termid = sc.termid left join t_emp e on e.empId = sc.Empid left join t_testtype ty on sc.testType = ty.typeId";
        if (testscoreCheck.getTermid() != null && !"".equals(testscoreCheck.getTermid())){
            sql+=" where sc.termid='"+testscoreCheck.getTermid()+"'";
        }else {
            sql+=" where 1=1";
        }
        if (testscoreCheck.getClassId() != null && !"".equals(testscoreCheck.getClassId())){
            sql+=" and sc.stuid in (select st.stuId from t_student where st.classid='"+testscoreCheck.getClassId()+"')";
        }
        if (testscoreCheck.getTestType() != null && !"".equals(testscoreCheck.getTestType())){
            sql+=" and sc.testType='"+testscoreCheck.getTestType()+"'";
        }
        if (testscoreCheck.getCourseId() != null && !"".equals(testscoreCheck.getCourseId())){
            sql+=" and sc.courseId='"+testscoreCheck.getCourseId()+"'";
        }
        return pageBySQL(sql,currPage,pageSize);
    }

    @Override
    public int selCount() {
        return selTotalRow("select count(*) from t_studentscore");
    }

    @Override
    public List selterm() {
        return listByHql("from TermVo");
    }
}
