package com.ht.controller.shihehua;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 华 on 2019/12/4.
 */
@Controller
@RequestMapping("/coursetype")
public class CourseTypeController {
    @RequestMapping("/tocurriculum_list")
    public String tocurriculum_list(){
        return "curriculum_list";
    }
    @RequestMapping("/tocurriculum_add")
    public String tocurriculum_add(){
        return "curriculum_add";
    }

}
