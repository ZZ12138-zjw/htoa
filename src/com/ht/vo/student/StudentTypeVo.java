package com.ht.vo.student;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by shkstart on 2019/12/8
 * @author LaIWeiChun
 */

@Entity
@Table(name="t_studenttype")
public class StudentTypeVo {

    @Id
    @GeneratedValue
    private int classType;
    private String typeName;

    public int getClassType() {
        return classType;
    }

    public void setClassType(int classType) {
        this.classType = classType;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "StudentTypeVo{" +
                "classType=" + classType +
                ", typeName='" + typeName + '\'' +
                '}';
    }


}
