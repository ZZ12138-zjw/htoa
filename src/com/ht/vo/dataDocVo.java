package com.ht.vo;

import javax.persistence.*;
import java.util.Date;

/**
 * 资料文档
 * @author WuJun
 */
@Entity
@Table(name = "dataDoc")
public class dataDocVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int docId;      //主键
    private String dataName;        //资料名称
    private String url;     //资料地址
    private Date optime;        //上传时间
    private String remark;      //备注
    private int empId;      //上传人员


    public int getDocId() {
        return docId;
    }

    public void setDocId(int docId) {
        this.docId = docId;
    }

    public String getDataName() {
        return dataName;
    }

    public void setDataName(String dataName) {
        this.dataName = dataName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getOptime() {
        return optime;
    }

    public void setOptime(Date optime) {
        this.optime = optime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }
}
