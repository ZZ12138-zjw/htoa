package com.ht.vo;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 员工实体类
 * Created by shkstart on 2019/12/3
 * @author LaiWeiChun
 */
@Entity
@Table(name = "t_emp")
public class EmpVo {

    /**
     *  主键，员工编号输入编号
     */

    private String empId;
    /**
     * 员工姓名
     */
    private String empName;
    /**
     * 关联部门表depid字段
     */
    private Integer deptId;

    /**
     * 性别(男,女)
     */
    private String sex;
    /**
     * 出生日期
     */
    private Date birthday;
    /**
     * 身份证号码(唯一)
     */
    private String cardno;
    /**
     * 籍贯
     */
    private String nation;
    /**
     * 手机号码
     */
    private String phone;
    /**
     * qq号码
     */
    private String qqCode;
    /**
     * 微信号码
     */
    private String weiXin;
    /**
     * 邮箱地址
     */
    private String email;
    /**
     * 婚姻情况(已婚，单身)
     */
    private String married;
    /**
     * 毕业学校
     */
    private String university;
    /**
     * 专业
     */
    private String major;
    /**
     * 学历
     */
    private String education;
    /**
     * 家庭地址
     */
    private String address;
    private String remark;
    private String bank;

}
