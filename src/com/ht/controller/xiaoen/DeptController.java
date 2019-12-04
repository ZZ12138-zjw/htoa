package com.ht.controller.xiaoen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by shkstart on 2019/12/4
 * @author LaIWeiChun
 */
@Controller
@RequestMapping("/dept")
public class DeptController{

    @RequestMapping("/dept_list")
    public String deptList(){
        return "dept_list";
    }

    @RequestMapping("/to_dept_add")
    public String toDpetAdd(){
        return "dept_add";
    }





}
