package com.ht.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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


}
