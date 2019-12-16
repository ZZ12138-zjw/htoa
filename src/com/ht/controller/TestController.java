package com.ht.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by shkstart on 2019/12/3
 * @author LaIWeiChun
 */
@Controller
public class TestController {

    @RequestMapping("/test")
    public String test(){
        System.out.println("我进来了");
        return "index";
    }

    @RequestMapping("/to_welcome")
    public String to_welcome(){
        return "welcome2";
    }

    @RequestMapping("/to_top")
    public String toTop(){
        return "top";
    }

    @RequestMapping("/to_student_index")
    public String to_student_index(){
        return  "student_jsp/student_index";
    }

    @RequestMapping("/to_student_login")
    public String to_student_login(){
        return "student_jsp/student_login";
    }






}
