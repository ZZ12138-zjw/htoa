package com.ht.vo.student;

import javax.persistence.*;

/*
 * @author Cemer
 *
 * */
//楼栋管理表
@Entity
@Table(name="t_studentFloor")
public class StudentFloorVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer floorId;//楼栋主键id
    private String floorName;//楼栋名称


    public Integer getFloorId() {
        return floorId;
    }

    public void setFloorId(Integer floorId) {
        this.floorId = floorId;
    }

    public String getFloorName() {
        return floorName;
    }

    public void setFloorName(String floorName) {
        this.floorName = floorName;
    }
}