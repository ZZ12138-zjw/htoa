package com.ht.vo;

import javax.persistence.*;

/**
 * Created by Administrator on 2019/12/3.
 */

@Entity
@Table(name="hotelMange")
public class HotelManageVo {


    /*create table hotelManage(
            id int primary key,			//标识列，开启自增
            sortID int,					//排序编号，自选，越小的数字排越前
            hotelID int, 				//宿舍房号，当有学生入住时填入房号
            hotelFloor varchar(10),		//宿舍楼栋（添加宿舍时根据楼栋管理表可用的楼栋添加）
    bed int,					//床位数
    hotelAddress varchar(20),	//宿舍地址
	)*/

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;             //标识列，开启自增
    private Integer sortID;         //排序编号，数值越小则排序越靠前
    private Integer hotelID;        //宿舍房号，当有学生入住时填入房号
    private String hotelFloor;      //宿舍楼栋（添加宿舍时根据楼栋管理表可用的楼栋添加）
    private Integer bed;            //床位
    private String hotelAddress;    //宿舍地址

    @Override
    public String toString() {
        return "HotelManageVo{" +
                "id=" + id +
                ", sortID=" + sortID +
                ", hotelID=" + hotelID +
                ", hotelFloor='" + hotelFloor + '\'' +
                ", bed=" + bed +
                ", hotelAddress='" + hotelAddress + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSortID() {
        return sortID;
    }

    public void setSortID(Integer sortID) {
        this.sortID = sortID;
    }

    public Integer getHotelID() {
        return hotelID;
    }

    public void setHotelID(Integer hotelID) {
        this.hotelID = hotelID;
    }

    public String getHotelFloor() {
        return hotelFloor;
    }

    public void setHotelFloor(String hotelFloor) {
        this.hotelFloor = hotelFloor;
    }

    public Integer getBed() {
        return bed;
    }

    public void setBed(Integer bed) {
        this.bed = bed;
    }

    public String getHotelAddress() {
        return hotelAddress;
    }

    public void setHotelAddress(String hotelAddress) {
        this.hotelAddress = hotelAddress;
    }
}
