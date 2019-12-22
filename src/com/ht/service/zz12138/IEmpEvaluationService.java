package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.AddEmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EvaluationContentVo;
import com.ht.vo.LogisticsCheck.EvaluationListVo;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentClassVo;

import java.util.List;
import java.util.Map;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 10:48
 *教师考评
 */
public interface IEmpEvaluationService {
    public List listEmpEvaluation(int currPage,int pageSize);

    public void addEmpEvaluation(EmpEvaluationVo empEvaluationVo);

    public int selAllCount();

    //查询出所有部门
    public List selectAllDept();

    //查询出所有员工
    public List selectAllEmp();

    public List selectAllEvaluation();

    //查询出某一部门下的所有考评内容
    public List selectEvaluationContent(int depID,int evaluationTypeID);

    //查询出某一部门下postname为专业老师和专职班主任的员工
    public List selectEmp(int depID);

    //查询某个员工的信息
    public EmpVo selEmp(int empId);

    //查询考评内容
    public List<Map> selectEvaluationContent(String evaluationContentID);

    //根据教师考评ID来删除
    public void delEmpEvaluation(int empEvaluationID);

    //批量删除
    public void allDelEmpEvaluation(String empEvaluationID);

    //根据ID查询教师考评
    public EmpEvaluationVo selectEmpEvaluation(int empEvaluationID);

    //将员工ID   员工姓名  班级ID存入考评列表表
    public void addEvaluationList(int empID,String empName,int classID,String className,int stuId,String evaluationContentID,int evaluationStatus,int empEvaluationID);

    //根据授课老师姓名查询出班级ID
    public List selectClass1(String teacherName);

    //根据专职班主任姓名查询出班级ID
    public List selectClass2(String classTeacherName);

    public StudentClassVo selClass1(int classId);

    public StudentClassVo selClass2(int classId);

    //根据班级ID查询出所有学生
    public List selectStudent(int classId);

    //根据学生ID查询evaluationlist
    public List selectEvaluationList(int stuId);

    //根据班级ID查询班级详细信息
    public List selectClass(int classId);

    //根据老师姓名查询老师ID
    public List selectEmp(String empName);

    //根据教师ID与教师类型查询教师考评
    public List selectEvaluation(int empID,int evaluationType);

    //根据员工ID与学生ID查询evaluationlist evaluationStatus
    public List seelctEvaluationStatus(int empID,int stuId);

    //将考评内容ID存入empevaluationlist中
    public void addEvaluationID(int empID);

    //根据员工ID查询考评内容
    public List selectEvaluationByEmpID(int empID);

    //根据员工姓名
    public List selectEmpByEmpName(String empName);

    //根据学生ID与教师ID查询evaluationList
    public List selectEvaluationList(int stuID,int empID);

    //根据考评ID查询考评内容
    public List selectEvaluation(int empEvaluationID);

    //从学生端添加教师考评
    public void addEvaluation(AddEmpEvaluationVo vo);

    //更新学生考评状态为1
    public void updateEvaluationStatus(int stuId,int empEvaluationID);
}
