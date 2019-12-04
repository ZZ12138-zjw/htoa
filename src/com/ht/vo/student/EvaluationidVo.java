package com.ht.vo.student;

import javax.persistence.*;

/*
 * @author Cemer
 *
 * */
//员工考评标准表
@Entity
@Table(name = "t_evaluationid")
public class EvaluationidVo {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer evaluationid;//主键自增id
    private Integer evaluationName;//考评名称
    private Integer score;//考核分值
    private Integer evaluationType;//1任课老师.2班主任
    private String remark;//备注

    public Integer getEvaluationid() {
        return evaluationid;
    }

    public void setEvaluationid(Integer evaluationid) {
        this.evaluationid = evaluationid;
    }

    public Integer getEvaluationName() {
        return evaluationName;
    }

    public void setEvaluationName(Integer evaluationName) {
        this.evaluationName = evaluationName;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getEvaluationType() {
        return evaluationType;
    }

    public void setEvaluationType(Integer evaluationType) {
        this.evaluationType = evaluationType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
