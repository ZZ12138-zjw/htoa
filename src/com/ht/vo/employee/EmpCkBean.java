package com.ht.vo.employee;

/**
 * Created by shkstart on 2019/12/6
 * @author LaiWeiChun
 */
public class EmpCkBean {

    /**
     * 部门名称
     */
    private String depName;
    /**
     * 员工姓名
     */
    private String empName;
    /**
     * 手机号码
     */
    private String phone;
    /**
     * 员工状态
     */
    private String status;
    /**
     * 员工职务
     */
    private String postName;


    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    @Override
    public String toString() {
        return "EmpCkBean{" +
                "depName='" + depName + '\'' +
                ", empName='" + empName + '\'' +
                ", phone='" + phone + '\'' +
                ", status='" + status + '\'' +
                ", postName='" + postName + '\'' +
                '}';
    }
}
