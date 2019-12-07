package com.ht.vo.employee;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by shkstart on 2019/12/7
 * @author LaiWeiChun
 */
public class PostName {


    public static final String xiao_zhang="校长";
    public static final String ZHAO_SHEN="招生老师";
    public static final String MAJOR_TEACHER="专业老师";
    public static final String BAN_ZHU_REN="专职班主任";
    public static final String JIAO_WU_ZHU_REN="教务主任";
    public static final String BOSS="总经理";
    public static final String ACCOUNTING="会计";
    public static final String XUE_GONG_ZHU_REN="学工主任";
    public static final String ZHU_JIAO="助教";
    public static final String TWO_THREE_MAJOR_TEACHER="2+3专业老师";
    public static final String HOU_QIN_ZHU_REN="后勤主任";


    public static List<String> postNames(){
        List<String> list=new ArrayList<>();
        list.add("校长");
        list.add("招生老师");
        list.add("专业老师");
        list.add("专职班主任");
        list.add("教务主任");
        list.add("总经理");
        list.add("会计");
        list.add("学工主任");
        list.add("2+3专业老师");
        list.add("后勤主任");
        return list;
    }


}
