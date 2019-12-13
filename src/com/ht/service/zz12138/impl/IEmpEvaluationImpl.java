package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.IEmpEvaluationService;
import com.ht.vo.LogisticsCheck.EmpEvaluationVo;
import org.springframework.stereotype.Service;

import java.util.List;

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
        return listBySQL("select * from t_emp");
    }

    @Override
    public List selectAllEvaluation() {
        return listByHql("from EvaluationContentVo");
    }


}
