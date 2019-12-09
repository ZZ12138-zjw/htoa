package com.ht.vo.employee;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
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

    @Id
    @GeneratedValue
    private Integer empId; //员工编号
    private String empName; //员工姓名
    private Integer deptId; //关联部门
    private String sex; //性别
    private Date birthday; //出生日期
    private String cardno; //身份证号码
    private String nation; //籍贯
    private String phone; //手机号码
    private String qqCode; //qq号码
    private String weiXin; //微信号码
    private String email; //邮箱地址
    private String married; //婚姻情况
    private String university;//毕业学校
    private String major; //专业
    private String education; //学历
    private String address; //家庭地址
    private String remark; //说明
    private String bank; //开户银行
    private String accountName; //账号名称
    private String bankNumber;//账号
    private String alipay;//支付宝账号(唯一）
    private Date hireDay;//入职日期
    private Date fireDay; //离职日期
    private String password; //登录密码
    private Integer status; //状态
    private Integer postId; //职务id
    private String postName; //职务名称


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

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQqCode() {
        return qqCode;
    }

    public void setQqCode(String qqCode) {
        this.qqCode = qqCode;
    }

    public String getWeiXin() {
        return weiXin;
    }

    public void setWeiXin(String weiXin) {
        this.weiXin = weiXin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMarried() {
        return married;
    }

    public void setMarried(String married) {
        this.married = married;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getBankNumber() {
        return bankNumber;
    }

    public void setBankNumber(String bankNumber) {
        this.bankNumber = bankNumber;
    }

    public String getAlipay() {
        return alipay;
    }

    public void setAlipay(String alipay) {
        this.alipay = alipay;
    }

    public Date getHireDay() {
        return hireDay;
    }

    public void setHireDay(Date hireDay) {
        this.hireDay = hireDay;
    }

    public Date getFireDay() {
        return fireDay;
    }

    public void setFireDay(Date fireDay) {
        this.fireDay = fireDay;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    @Override
    public String toString() {
        return "EmpVo{" +
                "empId='" + empId + '\'' +
                ", empName='" + empName + '\'' +
                ", deptId=" + deptId +
                ", sex='" + sex + '\'' +
                ", birthday=" + birthday +
                ", cardno='" + cardno + '\'' +
                ", nation='" + nation + '\'' +
                ", phone='" + phone + '\'' +
                ", qqCode='" + qqCode + '\'' +
                ", weiXin='" + weiXin + '\'' +
                ", email='" + email + '\'' +
                ", married='" + married + '\'' +
                ", university='" + university + '\'' +
                ", major='" + major + '\'' +
                ", education='" + education + '\'' +
                ", address='" + address + '\'' +
                ", remark='" + remark + '\'' +
                ", bank='" + bank + '\'' +
                ", accountName='" + accountName + '\'' +
                ", bankNumber='" + bankNumber + '\'' +
                ", alipay='" + alipay + '\'' +
                ", hireDay=" + hireDay +
                ", fireDay=" + fireDay +
                ", password='" + password + '\'' +
                ", status=" + status +
                ", postId=" + postId +
                ", postName='" + postName + '\'' +
                '}';
    }
}
