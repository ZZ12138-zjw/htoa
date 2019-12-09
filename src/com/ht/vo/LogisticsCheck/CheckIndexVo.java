package com.ht.vo.LogisticsCheck;

import javax.persistence.*;

/**考核指标vo
 * Created by Administrator on 2019/12/3.
 * @author ZhangJiaWei
 */

@Entity
@Table(name="checkIndex")
public class CheckIndexVo {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer ID;             //标识列，自增
    private String checkContent;    //考核内容
    private Integer checkScore;     //考核分数，整数加分，负数则减分
    private String depName;         //部门名称
    private String checkExplain;    //考核说明

    @Override
    public String toString() {
        return "CheckIndexVo{" +
                "ID=" + ID +
                ", checkContent='" + checkContent + '\'' +
                ", checkScore=" + checkScore +
                ", depName='" + depName + '\'' +
                ", checkExplain='" + checkExplain + '\'' +
                '}';
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public String getCheckContent() {
        return checkContent;
    }

    public void setCheckContent(String checkContent) {
        this.checkContent = checkContent;
    }

    public Integer getCheckScore() {
        return checkScore;
    }

    public void setCheckScore(Integer checkScore) {
        this.checkScore = checkScore;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getCheckExplain() {
        return checkExplain;
    }

    public void setCheckExplain(String checkExplain) {
        this.checkExplain = checkExplain;
    }
}
