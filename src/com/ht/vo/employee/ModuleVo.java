package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 系统权限管理
 *      记录着系统中所有的动作，
 * Created by shkstart on 2019/12/18
 * @author LaiWeiChun
 */
@Entity
@Table(name = "t_module")
public class ModuleVo {

    @Id
    @GeneratedValue
    private Integer  moduleId;//主键，标识列，自动生成
    private String moduleName; //权限名称
    private Integer root;//根节点
    private String controller;//访问控制器

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public Integer getRoot() {
        return root;
    }

    public void setRoot(Integer root) {
        this.root = root;
    }

    public String getController() {
        return controller;
    }

    public void setController(String controller) {
        this.controller = controller;
    }

    @Override
    public String toString() {
        return "ModuleVo{" +
                "moduleId=" + moduleId +
                ", moduleName='" + moduleName + '\'' +
                ", root=" + root +
                ", controller='" + controller + '\'' +
                '}';
    }
}
