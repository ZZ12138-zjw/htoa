package com.ht.vo.LogisticsCheck;

import javax.persistence.*;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/8 20:35
 */
@Entity
@Table(name = "repairManage")
public class RepairManageVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer repairID;
    private String repairSort;      //维修类别
    private String repairMan;       //报修人
    private String repairAddress;            //保修部门或班级
    private String startDate;         //开始维修时间（申请维修时间）
    private String endDate;           //结束时间（完成时间）
    private String repairStatus;     //当前状态
    private String repairDept;     //部门或班级
    private String repairName;      //报修名称
    private String repairIndex;     //备注

    @Override
    public String toString() {
        return "RepairManageVo{" +
                "repairID=" + repairID +
                ", repairSort='" + repairSort + '\'' +
                ", repairMan='" + repairMan + '\'' +
                ", repairAddress='" + repairAddress + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", repairStatus='" + repairStatus + '\'' +
                ", repairDept='" + repairDept + '\'' +
                ", repairName='" + repairName + '\'' +
                ", repairIndex='" + repairIndex + '\'' +
                '}';
    }

    public Integer getRepairID() {
        return repairID;
    }

    public void setRepairID(Integer repairID) {
        this.repairID = repairID;
    }

    public String getRepairSort() {
        return repairSort;
    }

    public void setRepairSort(String repairSort) {
        this.repairSort = repairSort;
    }

    public String getRepairMan() {
        return repairMan;
    }

    public void setRepairMan(String repairMan) {
        this.repairMan = repairMan;
    }

    public String getRepairAddress() {
        return repairAddress;
    }

    public void setRepairAddress(String repairAddress) {
        this.repairAddress = repairAddress;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getRepairStatus() {
        return repairStatus;
    }

    public void setRepairStatus(String repairStatus) {
        this.repairStatus = repairStatus;
    }

    public String getRepairDept() {
        return repairDept;
    }

    public void setRepairDept(String repairDept) {
        this.repairDept = repairDept;
    }

    public String getRepairName() {
        return repairName;
    }

    public void setRepairName(String repairName) {
        this.repairName = repairName;
    }

    public String getRepairIndex() {
        return repairIndex;
    }

    public void setRepairIndex(String repairIndex) {
        this.repairIndex = repairIndex;
    }
}
