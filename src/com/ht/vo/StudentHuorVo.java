package com.ht.vo;

import javax.persistence.Entity;
import javax.persistence.Table;

/*
 * @author Cemer
 *
 * */
//宿舍资料
@Entity
@Table(name = "t_studentHuor")
public class StudentHuorVo {
    private Integer hourId;//宿舍主键id;
    private String hourName;//宿舍房号名称
    private String addr;//宿舍地址
    private Integer count;//宿舍人数
    private Integer floorId;//楼栋id外键
    private Integer numberBeds;//床位数
    private Integer hourIddsc;//序号

    public Integer getHourId() {
        return hourId;
    }

    public void setHourId(Integer hourId) {
        this.hourId = hourId;
    }

    public String getHourName() {
        return hourName;
    }

    public void setHourName(String hourName) {
        this.hourName = hourName;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getFloorId() {
        return floorId;
    }

    public void setFloorId(Integer floorId) {
        this.floorId = floorId;
    }

    public Integer getNumberBeds() {
        return numberBeds;
    }

    public void setNumberBeds(Integer numberBeds) {
        this.numberBeds = numberBeds;
    }

    public Integer getHourIddsc() {
        return hourIddsc;
    }

    public void setHourIddsc(Integer hourIddsc) {
        this.hourIddsc = hourIddsc;
    }
}
