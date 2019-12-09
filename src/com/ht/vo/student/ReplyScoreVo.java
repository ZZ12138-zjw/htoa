package com.ht.vo.student;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by shkstart on 2019/12/9
 * @author LaiWeiChun
 */
@Entity
@Table(name = "t_replyscore")
public class ReplyScoreVo {

    @Id
    @GeneratedValue
    private Integer projectId;//答辩项目id
    private String proName;//项目名称

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    @Override
    public String toString() {
        return "ReplyScoreVo{" +
                "projectId=" + projectId +
                ", proName='" + proName + '\'' +
                '}';
    }
}
