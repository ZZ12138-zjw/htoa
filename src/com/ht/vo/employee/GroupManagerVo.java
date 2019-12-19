package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *  t_groupmanager表记录着角色的相关信息，每添加一个角色，这里的记录就会增加一条。
 * Created by shkstart on 2019/12/18
 * @author LaIWeiChun
 */
@Entity
@Table(name = "t_groupmanager")
public class GroupManagerVo {


    @Id
    @GeneratedValue
    //自增id
    private Integer groupId;
    //角色名称
    private String groupName;
    //角色信息
    private String groupinfo;
    //创建者id
    private Integer empId;
    //创建者名称
    private String empName;
    //创建时间
    private String createTime;

    @Override
    public String toString() {
        return "GroupManagerVo{" +
                "groupId=" + groupId +
                ", groupName='" + groupName + '\'' +
                ", groupinfo='" + groupinfo + '\'' +
                ", empId=" + empId +
                ", empName='" + empName + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupinfo() {
        return groupinfo;
    }

    public void setGroupinfo(String groupinfo) {
        this.groupinfo = groupinfo;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
