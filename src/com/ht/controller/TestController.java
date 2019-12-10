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
    public String test(HttpServletRequest request, HttpSession session){
        System.out.println("我进来了");
        String username = request.getParameter("username");
        session.setAttribute("username",username);
        return "index";
    }

    @RequestMapping("/to_welcome")
    public String to_welcome(){
        return "welcome";
    }

    @RequestMapping("/to_top")
    public String toTop(){
        return "top";
    }




}
