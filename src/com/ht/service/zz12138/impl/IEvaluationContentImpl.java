package com.ht.service.zz12138.impl;

import com.ht.dao.BaseDao;
import com.ht.service.zz12138.IEvaluationService;
import com.ht.vo.LogisticsCheck.EvaluationContentVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/10 21:19
 */
@Service
public class IEvaluationContentImpl extends BaseDao implements IEvaluationService {
    @Override
    public List listEvaluationContent(int page,int limit) {
        return pageByHql("from EvaluationContentVo",page,limit);
    }

    @Override
    public void addEvaluationContent(EvaluationContentVo vo) {
        addObject(vo);
    }

    @Override
    public void delEvaluationContent(String evaluationID) {
        executeSQL("delete from evaluationcontent where evaluationid in ("+evaluationID+")");
    }

    @Override
    public void updateEvaluationContent(EvaluationContentVo vo) {
        updObject(vo);
    }

    @Override
    public int selAllCount() {
        return selTotalRow("select count(*) from evaluationcontent");
    }

    @Override
    public List selDepName() {
        return listBySQL("select depName from t_dept");
    }

    @Override
    public EvaluationContentVo listByID(int ID) {
        return (EvaluationContentVo) getObject(EvaluationContentVo.class,ID);
    }

    @Override
    public List selAll() {
        return listBySQL("select DISTINCT depname from evaluationcontent");
    }
}
