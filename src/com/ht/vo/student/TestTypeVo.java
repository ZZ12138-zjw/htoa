package com.ht.vo.student;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by shkstart on 2019/12/9
 * @author LaWeiChun
 */

@Entity
@Table(name = "t_testtype")
public class TestTypeVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int typeId;//类型编号
    private String typeName;//类型名称

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }


    @Override
    public String toString() {
        return "TestTypeVo{" +
                "typeId=" + typeId +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
