package com.ht.vo.employee;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by shkstart on 2019/12/9
 * @author LaiWeiChun
 */
public class DeptType {

    public static List<String> DeptTypeVal(){
        List list=new ArrayList();
        list.add("人事部");
        list.add("财务部");
        list.add("后勤部");
        list.add("行政部");
        list.add("业务部");
        list.add("销售部");
        return  list;
    }


}
