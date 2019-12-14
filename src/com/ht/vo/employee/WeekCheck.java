package com.ht.vo.employee;

import java.util.Date;

public class WeekCheck {
    private String depName;
    private String empName;

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

    @Override
    public String toString() {
        return "WeekCheck{" +
                "depName='" + depName + '\'' +
                ", empName='" + empName + '\'' +
                '}';
    }
}
