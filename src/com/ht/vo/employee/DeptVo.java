package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by shkstart on 2019/12/4
 * @author LaiWeiChun
 */
@Entity
@Table(name = "t_dept")
public class DeptVo {

    @Id
    @GeneratedValue
    private Integer depid; //主键，标识列，自动生成
    private String depName; //部门名称
    private String parentId; //父部门名称
    private String chairman; //部门负责人
    private String remark; //备注



    public Integer getDepid() {
        return depid;
    }

    public void setDepid(Integer depid) {
        this.depid = depid;
    }
    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getChairman() {
        return chairman;
    }

    public void setChairman(String chairman) {
        this.chairman = chairman;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "DeptVo{" +
                "depid=" + depid +
                ", depName='" + depName + '\'' +
                ", parentId='" + parentId + '\'' +
                ", chairman='" + chairman + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
