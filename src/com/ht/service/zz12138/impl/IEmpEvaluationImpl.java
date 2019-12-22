package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.IEmpEvaluationService;
import com.ht.vo.LogisticsCheck.AddEmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EvaluationContentVo;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentClassVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 10:50
 * 教师考评
 */
@Service
public class IEmpEvaluationImpl extends BaseDao implements IEmpEvaluationService {

    @Override
    public List listEmpEvaluation(int currPage, int pageSize) {
        return pageByHql("from EmpEvaluationVo",currPage,pageSize);
    }

    @Override
    public void addEmpEvaluation(EmpEvaluationVo empEvaluationVo) {
        addObject(empEvaluationVo);
    }

    @Override
    public int selAllCount() {
        return selTotalRow("select count(*) from empevaluation");
    }

    @Override
    public List selectAllDept() {
        return listBySQL("select * from t_dept");
    }

    @Override
    public List selectAllEmp() {
        return listBySQL("select * from t_emp where postName = '专职班主任' and '专业老师'");
    }

    @Override
    public List selectAllEvaluation() {
        return listByHql("from EvaluationContentVo");
    }

    @Override
    public List selectEvaluationContent(int depID , int evaluationTypeID) {
        return listBySQL("select * from evaluationcontent where depID = "+depID + " and evaluationType = "+evaluationTypeID);
    }

    @Override
    public List selectEmp(int depID) {
        return listBySQL("select * from t_emp where deptId = "+depID+" and postName in ('专业老师','专职班主任')");
    }

    @Override
    public EmpVo selEmp(int empId) {
        return (EmpVo) getObject(EmpVo.class,empId);
    }

    @Override
    public List<Map> selectEvaluationContent(String evaluationContentID) {
        return listBySQL("select * from evaluationcontent where evaluationID in ("+evaluationContentID+")");
    }

    @Override
    public void delEmpEvaluation(int empEvaluationID) {
        executeSQL("delete from empevaluation where empEvaluationID = "+empEvaluationID);
    }

    @Override
    public void allDelEmpEvaluation(String empEvaluationID) {
        executeSQL("delete from empevaluation where empEvaluationID in ("+empEvaluationID+")");
    }

    @Override
    public EmpEvaluationVo selectEmpEvaluation(int empEvaluationID) {
        return (EmpEvaluationVo) getObject(EmpEvaluationVo.class,empEvaluationID);
    }

    @Override
    public void addEvaluationList(int empID, String empName, int classID,String className,int stuId,String evaluationContentID,int evaluationStatus,int empEvaluationID) {
        executeSQL("insert into t_evaluationlist(empID,empName,classId,className,stuId,evaluationStatus,evaluationContentID,empEvaluationID)  values("+empID+",'"+empName+"',"+classID+",'"+className+"','"+stuId+"',"+evaluationStatus+",'"+evaluationContentID+"',"+empEvaluationID+")");
    }

    @Override
    public List selectClass1(String teacherName) {
        return listBySQL("select * from t_studentclass where teacher = '"+teacherName+"'");
    }

    @Override
    public List selectClass2(String classTeacherName) {
        return listBySQL("select * from t_studentclass where classTeacher = '"+classTeacherName+"'");
    }

    @Override
    public StudentClassVo selClass1(int classId) {
        return (StudentClassVo) getObject(StudentClassVo.class,classId);
    }

    @Override
    public StudentClassVo selClass2(int classId) {
        return (StudentClassVo) getObject(StudentClassVo.class,classId);
    }

    @Override
    public List selectStudent(int classId) {
        return listBySQL("select stuId from t_student where classId = "+classId);
    }

    @Override
    public List selectEvaluationList(int stuId) {
        return listBySQL("select * from t_evaluationlist where stuId = "+stuId);
    }

    @Override
    public List selectClass(int classId) {
        return listBySQL("select * from t_studentclass where classId = "+classId);
    }

    @Override
    public List selectEmp(String empName) {
        return listBySQL("select * from t_emp where empName = '"+empName+"'");
    }

    @Override
    public List selectEvaluation(int empID, int evaluationType) {
        return listBySQL("select * from empevaluation where empID = "+empID+" and evaluationType = "+evaluationType);
    }

    @Override
    public List seelctEvaluationStatus(int empID, int stuId) {
        return listBySQL("select * from t_evaluationlist where empID = "+empID+" and stuId = "+stuId);
    }



    @Override
    public void addEvaluationID(int empID) {
//        executeSQL("update t_evaluationlist set evaluationContentID = select empEvaluationID from empevaluation where empID = " + empID);
    }

    @Override
    public List selectEvaluationByEmpID(int empID) {
        return listBySQL("select * from empevaluation where empID = "+empID);
    }

    @Override
    public List selectEmpByEmpName(String empName) {
        return listBySQL("select * from t_emp where empName = '"+empName+"'");
    }

    @Override
    public List selectEvaluationList(int stuID, int empID) {
        return listBySQL("select * from t_evaluationlist where stuId = "+stuID+" and empID = "+empID);
    }

    @Override
    public List selectEvaluation(int empEvaluationID) {
        return listBySQL("select * from empevaluation where empEvaluationID = "+empEvaluationID);
    }

    @Override
    public void addEvaluation(AddEmpEvaluationVo vo) {
        addObject(vo);
    }

    @Override
    public void updateEvaluationStatus(int stuId, int empEvaluationID) {
        executeSQL("update t_evaluationlist set evaluationStatus = 1 where stuId = "+stuId+" and empEvaluationID = "+empEvaluationID);
    }


}
