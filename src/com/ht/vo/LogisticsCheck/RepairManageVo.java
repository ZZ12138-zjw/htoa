package com.ht.vo.LogisticsCheck;

import javax.persistence.*;
import java.util.Date;

/**维修管理vo
 * Created by @ZhangJiaWen on 2019/12/3.
 */
@Entity
@Table(name = "repairManage")
public class RepairManageVo {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer ID;             //标识列
    private String repairSort;      //维修类别
    private String repairMan;       //报修人
    private String repairAddress;            //保修部门或班级
    private Date startDate;         //开始维修时间（申请维修时间）
    private Date endDate;           //结束时间（完成时间）
    private String repairStatus;     //当前状态

    @Override
    public String toString() {
        return "RepairManageVo{" +
                "ID=" + ID +
                ", repairSort='" + repairSort + '\'' +
                ", repairMan='" + repairMan + '\'' +
                ", repairAddress='" + repairAddress + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", repairStatus='" + repairStatus + '\'' +
                '}';
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getRepairStatus() {
        return repairStatus;
    }

    public void setRepairStatus(String repairStatus) {
        this.repairStatus = repairStatus;
    }
}
