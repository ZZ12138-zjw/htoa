package com.ht.vo.LogisticsCheck;

import javax.persistence.*;

/**楼栋管理vo
 * Created by ZhangJiaWen on 2019/12/3.
 */

/*楼栋管理表，新增楼栋时只需要添加楼栋名称即可
        create table floorManage(
        id int primary key,			//标识列，开启自增
        floorName varchar(20),		//楼栋名称
        )*/

@Entity
@Table(name="floorManage")
public class FloorManageVo {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer ID;         //标识列，开启自增
    private String floorName;   //楼栋名称

    @Override
    public String toString() {
        return "FloorManageVo{" +
                "ID=" + ID +
                ", floorName='" + floorName + '\'' +
                '}';
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getFloorName() {
        return floorName;
    }

    public void setFloorName(String floorName) {
        this.floorName = floorName;
    }
}
