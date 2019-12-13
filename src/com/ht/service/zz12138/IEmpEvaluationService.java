package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.EmpEvaluationVo;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/4 10:48
 *教师考评
 */
public interface IEmpEvaluationService {
    public List listEmpEvaluation(int currPage,int pageSize);

    public void addEmpEvaluation(EmpEvaluationVo empEvaluationVo);

    public int selAllCount();

    public List selectAllDept();

    public List selectAllEmp();

    public List selectAllEvaluation();
}
