package com.ht.service.zz12138;

import com.ht.vo.LogisticsCheck.EvaluationContentVo;

import java.util.List;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/10 21:18
 */
public interface IEvaluationService {

    public List listEvaluationContent(int page,int limit);

    public void addEvaluationContent(EvaluationContentVo vo);

    public void delEvaluationContent(String evaluationID);

    public void updateEvaluationContent(EvaluationContentVo vo);

    public int selAllCount();

    public List selDepName();

    public EvaluationContentVo listByID(int ID);

    public List selAll();
}
