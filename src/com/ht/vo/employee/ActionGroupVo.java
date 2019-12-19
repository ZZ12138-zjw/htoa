package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * t_actiongroup表记录着动作所在的组
 *
 * Created by shkstart on 2019/12/18
 * @author LaIWeiChun
 */
@Entity
@Table(name = "t_actiongroup")
public class ActionGroupVo {

    @Id
    @GeneratedValue
    private Integer id;
    //权限id
    private Integer moduleId;
    //角色id
    private Integer groupId;
    private Integer empId;
    private String empName;
    private String createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
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

    @Override
    public String toString() {
        return "ActionGroupVo{" +
                "id=" + id +
                ", moduleId=" + moduleId +
                ", groupId=" + groupId +
                ", empId=" + empId +
                ", empName='" + empName + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}
