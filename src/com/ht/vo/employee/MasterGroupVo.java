package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * t_mastergroup 表记录着员工所拥有的角色，由于一名员工可能有多个角色，所以该表某一名员工的记录可能有多条.
 * Created by shkstart on 2019/12/18
 * @author LaIWeiChun
 */
@Entity
@Table(name = "t_mastergroup")
public class MasterGroupVo {

    @Id
    @GeneratedValue
    private Integer id;
    //员工id
    private Integer empId;
    //员工姓名
    private String empName;
    //角色id
    private Integer groupId;

    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
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

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    @Override
    public String toString() {
        return "MasterGroupVo{" +
                "id=" + id +
                ", empId=" + empId +
                ", empName='" + empName + '\'' +
                ", groupId=" + groupId +
                '}';
    }
}
