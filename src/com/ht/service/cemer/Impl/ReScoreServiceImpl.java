package com.ht.service.cemer.Impl;

import com.ht.dao.BaseDao;
import com.ht.service.cemer.ReScoreService;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.ReScoreCheck;
import com.ht.vo.student.ReplyScoreVo;
import com.ht.vo.student.StudentClassVo;
import com.ht.vo.student.StudentReplyScoreVo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReScoreServiceImpl extends BaseDao implements ReScoreService {


    @Override
    public List selectAllProject() {
        return listByHql("from ReplyScoreVo");
    }

    @Override
    public int getByCheckCount(ReScoreCheck scoreCheck) {
        String sql = "select rs.replyId,s.stuName,s.classid,p.proName,rs.score1,rs.score2,rs.score3,rs.score4,rs.score5,rs.score6,rs.score7,rs.remark from t_studentreplyscore rs left join t_student s on rs.studentId = s.stuId left join t_replyscore p on p.projectId = rs.projectId left join t_emp e on rs.empId = e.empId";
        if(scoreCheck.getProjectId() != null && !"".equals(scoreCheck.getProjectId())){
            sql+=" where rs.projectId="+scoreCheck.getProjectId();
        }else{
            sql+=" where 1=1";
        }
        if(scoreCheck.getEmpId() != null && !"".equals(scoreCheck.getEmpId())){
            sql+=" and rs.empId="+scoreCheck.getEmpId();
        }
        if(scoreCheck.getClassid() != null && !"".equals(scoreCheck.getClassid())){
            sql+=" and rs.studentId in (select stuId from t_student where classid="+scoreCheck.getClassid()+")";
        }
        return listBySQL(sql).size();
    }

    @Override
    public List getByCheck(ReScoreCheck reScoreCheck,int page,int limit) {
        String sql = "select rs.replyId,s.stuName,s.classid,p.proName,rs.score1,rs.score2,rs.score3,rs.score4,rs.score5,rs.score6,rs.score7,rs.remark from t_studentreplyscore rs left join t_student s on rs.studentId = s.stuId left join t_replyscore p on p.projectId = rs.projectId left join t_emp e on rs.empId = e.empId";
        if(reScoreCheck.getProjectId() != null && !"".equals(reScoreCheck.getProjectId())){
            sql+=" where rs.projectId="+reScoreCheck.getProjectId();
        }else{
            sql+=" where 1=1";
        }
        if(reScoreCheck.getEmpId() != null && !"".equals(reScoreCheck.getEmpId())){
            sql+=" and rs.empId="+reScoreCheck.getEmpId();
        }
        if(reScoreCheck.getClassid() != null && !"".equals(reScoreCheck.getClassid())){
            sql+=" and rs.studentId in (select stuId from t_student where classid="+reScoreCheck.getClassid()+")";
        }
        return pageBySQL(sql,page,limit);
    }

    @Override
    public List getStudentByClassid(int classid) {
        return listBySQL("select stuId,stuName from t_student where classid="+classid);
    }

    @Override
    public StudentClassVo getById(int classid) {
        return (StudentClassVo)getObject(StudentClassVo.class,classid);
    }

    @Override
    public ReplyScoreVo getProById(int projectId) {
        return (ReplyScoreVo)getObject(ReplyScoreVo.class,projectId);
    }

    @Override
    public EmpVo getEById(int empid) {
        return (EmpVo)getObject(EmpVo.class,empid);
    }

    @Override
    public void addStuRescore(StudentReplyScoreVo studentReplyScoreVo) {
        addObject(studentReplyScoreVo);
    }
}
