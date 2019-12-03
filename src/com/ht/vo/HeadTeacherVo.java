package com.ht.vo;

import javax.persistence.Entity;
import javax.persistence.Table;

/*
 * @author Cemer
 *
 * */
@Entity
@Table(name = "")
public class HeadTeacherVo {
    private Integer headTeacherid;//主键自增标识列
    private Integer evaluationid;//考评类别id关联考评类
    private String testScore;//考评分
    private Integer totalld;//关联班考评表id
}
