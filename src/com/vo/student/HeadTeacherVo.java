package com.vo.student;

import javax.persistence.*;

/*
 * @author Cemer
 *
 * */
@Entity
@Table(name = "t_headTeacher")
public class HeadTeacherVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer headTeacherid;//主键自增标识列
    private Integer evaluationid;//考评类别id关联考评类
    private String testScore;//考评分
    private Integer totalld;//关联班考评表id
}
