package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.IEmpEvaluationService;
import com.ht.vo.LogisticsCheck.EmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EvaluationContentVo;
import com.ht.vo.employee.EmpVo;
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


}
