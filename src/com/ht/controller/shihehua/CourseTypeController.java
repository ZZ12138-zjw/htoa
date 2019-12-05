package com.ht.controller.shihehua;

import com.ht.service.shihehua.ICourseTypeService;
import com.ht.vo.educational.CourseTypeVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 华 on 2019/12/4.
 */
@Controller
@RequestMapping("/coursetype")
public class CourseTypeController {
    @Resource
    ICourseTypeService is;

    @RequestMapping("/tocurriculum_list")
    public String tocurriculum_list(){
        List<CourseTypeVo> list = is.selCourseType();
        for (CourseTypeVo ct:list){
            System.out.println(ct.toString());
        }

        return "curriculum_list";
    }
    @RequestMapping("/tocurriculum_add")
    public String tocurriculum_add(){
        return "curriculum_add";
    }

    @RequestMapping("/addcurriculum")
    public String addcurriculum(CourseTypeVo courseTypeVo){
        is.addCourseType(courseTypeVo);
        return "success";
    }

}
