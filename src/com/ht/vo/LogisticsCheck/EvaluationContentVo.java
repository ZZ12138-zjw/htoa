package com.ht.vo.LogisticsCheck;

import javax.persistence.*;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/10 21:00
 */

@Entity
@Table(name = "evaluationcontent")
public class EvaluationContentVo {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer evaluationID;
    private String evaluationName;
    private String depName;

    @Override
    public String toString() {
        return "EvaluationContentVo{" +
                "evaluationID=" + evaluationID +
                ", evaluationName='" + evaluationName + '\'' +
                ", depName='" + depName + '\'' +
                '}';
    }

    public Integer getEvaluationID() {
        return evaluationID;
    }

    public void setEvaluationID(Integer evaluationID) {
        this.evaluationID = evaluationID;
    }

    public String getEvaluationName() {
        return evaluationName;
    }

    public void setEvaluationName(String evaluationName) {
        this.evaluationName = evaluationName;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }
}
