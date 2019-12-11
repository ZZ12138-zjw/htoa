package com.ht.controller.cemer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 华 on 2019/12/10.
 */
@Controller
@RequestMapping("/huor")
public class StudentHuorController {

    @RequestMapping("/to_huor_list")
    public String to_huor_list(){
        return "huor_list";
    }

}
