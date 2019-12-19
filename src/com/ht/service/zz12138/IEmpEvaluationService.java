package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.EmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EvaluationContentVo;
import com.ht.vo.employee.EmpVo;

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
}
