package com.ht.vo.student;

import javax.persistence.*;
import java.util.Date;
/*
 * @author Cemer
 *
 * */

//学生资料管理
@Entity
@Table(name = "t_student")
public class StudentVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer stuId;//学生服主键Id;
    private String password;//登录密码
    private String stuName;//学生名称
    private String middleschool;//毕业学校
    private String sex;//性别
    private String age;//年龄
    private Date birthday;//出生日期、
    private String phone;//联系电话
    private String addr;//家庭住址
    private Integer classid;//班级外键
    private Integer hourid;//宿舍外键id
    private Date entertime;//入学时间
    private String introduretech;//介绍老师
    private Integer state;//学生状态
    private String nation;//名族
    private String natives;//籍贯
    private Integer residence;//户口性质 1.农业  2.非农
    private String cardid;//身份证号
    private String professional;//就读专业
    private Integer prolevel;//专业类别  1.中技  2.高技  3.3+2
    private Integer studytype;//学习类别
    private String parents;//家长姓名
    private String parentsphone;//家长电话
    private String intrphone;//老师电话
    private String audition;//面试人
    private String auditionoption;//面试人意见
    private Integer isvocational;//是否中专  1.否   2.是
    private String vocationalsch;//中专学校
    private Integer vocationalflag;//中专学籍  1.已退 2.保留
    private Integer enrollno;//省录取号
    private Float qkMoney;//欠款金额
    private Integer score;//录取成绩
    private String dibao;//是否低保
    private String sourceType;//生源类型
    private String guarantee;//担保人
    private String soldier;//是否当兵
    private String registration;//报名号
    private String zhuxiao;//是否住校
    private String remart;//备注
    private String tuixue;//退学
    private String xiuxue;//退学
    private String stuno;//学号
    private String computer;//是否送电脑
    private String collar;//是否领用
    private String grants;//助学金

    @Override
    public String toString() {
        return "StudentVo{" +
                "stuId=" + stuId +
                ", password='" + password + '\'' +
                ", stuName='" + stuName + '\'' +
                ", middleschool='" + middleschool + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", birthday=" + birthday +
                ", phone='" + phone + '\'' +
                ", addr='" + addr + '\'' +
                ", classid=" + classid +
                ", hourid=" + hourid +
                ", entertime=" + entertime +
                ", introduretech='" + introduretech + '\'' +
                ", state=" + state +
                ", nation='" + nation + '\'' +
                ", natives='" + natives + '\'' +
                ", residence=" + residence +
                ", cardid='" + cardid + '\'' +
                ", professional='" + professional + '\'' +
                ", prolevel=" + prolevel +
                ", studytype=" + studytype +
                ", parents='" + parents + '\'' +
                ", parentsphone='" + parentsphone + '\'' +
                ", intrphone='" + intrphone + '\'' +
                ", audition='" + audition + '\'' +
                ", auditionoption='" + auditionoption + '\'' +
                ", isvocational=" + isvocational +
                ", vocationalsch='" + vocationalsch + '\'' +
                ", vocationalflag=" + vocationalflag +
                ", enrollno=" + enrollno +
                ", qkMoney=" + qkMoney +
                ", score=" + score +
                ", dibao='" + dibao + '\'' +
                ", sourceType='" + sourceType + '\'' +
                ", guarantee='" + guarantee + '\'' +
                ", soldier='" + soldier + '\'' +
                ", registration='" + registration + '\'' +
                ", zhuxiao='" + zhuxiao + '\'' +
                ", remart='" + remart + '\'' +
                ", tuixue='" + tuixue + '\'' +
                ", xiuxue='" + xiuxue + '\'' +
                ", stuno='" + stuno + '\'' +
                ", computer='" + computer + '\'' +
                ", collar='" + collar + '\'' +
                ", grants='" + grants + '\'' +
                '}';
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Integer getHourid() {
        return hourid;
    }

    public void setHourid(Integer hourid) {
        this.hourid = hourid;
    }

    public Date getEntertime() {
        return entertime;
    }

    public void setEntertime(Date entertime) {
        this.entertime = entertime;
    }

    public String getIntroduretech() {
        return introduretech;
    }

    public void setIntroduretech(String introduretech) {
        this.introduretech = introduretech;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getNatives() {
        return natives;
    }

    public void setNatives(String natives) {
        this.natives = natives;
    }

    public Integer getResidence() {
        return residence;
    }

    public void setResidence(Integer residence) {
        this.residence = residence;
    }

    public String getCardid() {
        return cardid;
    }

    public void setCardid(String cardid) {
        this.cardid = cardid;
    }

    public String getProfessional() {
        return professional;
    }

    public void setProfessional(String professional) {
        this.professional = professional;
    }

    public Integer getProlevel() {
        return prolevel;
    }

    public void setProlevel(Integer prolevel) {
        this.prolevel = prolevel;
    }

    public Integer getStudytype() {
        return studytype;
    }

    public void setStudytype(Integer studytype) {
        this.studytype = studytype;
    }

    public String getParents() {
        return parents;
    }

    public void setParents(String parents) {
        this.parents = parents;
    }

    public String getParentsphone() {
        return parentsphone;
    }

    public void setParentsphone(String parentsphone) {
        this.parentsphone = parentsphone;
    }

    public String getIntrphone() {
        return intrphone;
    }

    public void setIntrphone(String intrphone) {
        this.intrphone = intrphone;
    }

    public String getAudition() {
        return audition;
    }

    public void setAudition(String audition) {
        this.audition = audition;
    }

    public String getAuditionoption() {
        return auditionoption;
    }

    public void setAuditionoption(String auditionoption) {
        this.auditionoption = auditionoption;
    }

    public Integer getIsvocational() {
        return isvocational;
    }

    public void setIsvocational(Integer isvocational) {
        this.isvocational = isvocational;
    }

    public String getVocationalsch() {
        return vocationalsch;
    }

    public void setVocationalsch(String vocationalsch) {
        this.vocationalsch = vocationalsch;
    }

    public Integer getVocationalflag() {
        return vocationalflag;
    }

    public void setVocationalflag(Integer vocationalflag) {
        this.vocationalflag = vocationalflag;
    }

    public Integer getEnrollno() {
        return enrollno;
    }

    public void setEnrollno(Integer enrollno) {
        this.enrollno = enrollno;
    }

    public Float getQkMoney() {
        return qkMoney;
    }

    public void setQkMoney(Float qkMoney) {
        this.qkMoney = qkMoney;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getDibao() {
        return dibao;
    }

    public void setDibao(String dibao) {
        this.dibao = dibao;
    }

    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }

    public String getSoldier() {
        return soldier;
    }

    public void setSoldier(String soldier) {
        this.soldier = soldier;
    }

    public String getRegistration() {
        return registration;
    }

    public void setRegistration(String registration) {
        this.registration = registration;
    }

    public String getZhuxiao() {
        return zhuxiao;
    }

    public void setZhuxiao(String zhuxiao) {
        this.zhuxiao = zhuxiao;
    }

    public String getRemart() {
        return remart;
    }

    public void setRemart(String remart) {
        this.remart = remart;
    }

    public String getTuixue() {
        return tuixue;
    }

    public void setTuixue(String tuixue) {
        this.tuixue = tuixue;
    }

    public String getXiuxue() {
        return xiuxue;
    }

    public void setXiuxue(String xiuxue) {
        this.xiuxue = xiuxue;
    }

    public String getStuno() {
        return stuno;
    }

    public void setStuno(String stuno) {
        this.stuno = stuno;
    }

    public String getComputer() {
        return computer;
    }

    public void setComputer(String computer) {
        this.computer = computer;
    }

    public String getCollar() {
        return collar;
    }

    public void setCollar(String collar) {
        this.collar = collar;
    }

    public String getGrants() {
        return grants;
    }

    public void setGrants(String grants) {
        this.grants = grants;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getMiddleschool() {
        return middleschool;
    }

    public void setMiddleschool(String middleschool) {
        this.middleschool = middleschool;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
}
