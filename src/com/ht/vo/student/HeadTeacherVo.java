package com.ht.vo.student;

import javax.persistence.*;

/*
 * @author Cemer
 *
 * */
//考评类别表
@Entity
@Table(name = "t_headTeacher")
public class HeadTeacherVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer headTeacherid;//主键自增标识列
    private Integer evaluationid;//考评类别id关联考评类
    private String testScore;//考评分
    private Integer totalld;//关联班考评表id

    public Integer getHeadTeacherid() {
        return headTeacherid;
    }

    public void setHeadTeacherid(Integer headTeacherid) {
        this.headTeacherid = headTeacherid;
    }

    public Integer getEvaluationid() {
        return evaluationid;
    }

    public void setEvaluationid(Integer evaluationid) {
        this.evaluationid = evaluationid;
    }

    public String getTestScore() {
        return testScore;
    }

    public void setTestScore(String testScore) {
        this.testScore = testScore;
    }

    public Integer getTotalld() {
        return totalld;
    }

    public void setTotalld(Integer totalld) {
        this.totalld = totalld;
    }
}
