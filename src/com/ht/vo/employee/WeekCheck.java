package com.ht.vo.employee;

import java.util.Date;

public class WeekCheck {
    private Integer depid;
    private String empName;
    private String startDay;
    private String endDay;

    public Integer getDepid() {
        return depid;
    }

    public void setDepid(Integer depid) {
        this.depid = depid;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getStartDay() {
        return startDay;
    }

    public void setStartDay(String startDay) {
        this.startDay = startDay;
    }

    public String getEndDay() {
        return endDay;
    }

    public void setEndDay(String endDay) {
        this.endDay = endDay;
    }

    @Override
    public String toString() {
        return "WeekCheck{" +
                "depid=" + depid +
                ", empName='" + empName + '\'' +
                ", startDay='" + startDay + '\'' +
                ", endDay='" + endDay + '\'' +
                '}';
    }
}
