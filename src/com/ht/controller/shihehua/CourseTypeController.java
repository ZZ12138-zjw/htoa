package com.ht.controller.shihehua;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ht.service.shihehua.ICourseTypeService;
import com.ht.vo.educational.CourseTypeVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return "curriculum_list";
    }

    @RequestMapping("/tocurriculum_add")
    public String tocurriculum_add(){
        return "curriculum_add";
    }

    @RequestMapping("/coursetypeList")
    @ResponseBody
    public Map coursetypeList(String page,  String limit){
        List<CourseTypeVo> list = is.selCourseTypeList();
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",is.selCourseTypeCount());
        JSONObject json = (JSONObject) JSON.toJSON(is.selCourseTypePage(Integer.parseInt(page), Integer.parseInt(limit)));
        map.put("data",json);
        System.out.println(map.toString());
        return map;
    }

    @RequestMapping("/addcurriculum")
    public String addcurriculum(CourseTypeVo courseTypeVo){
        is.addCourseType(courseTypeVo);
        return "success";
    }


    @RequestMapping("/delete")
    @ResponseBody
    public String delete(CourseTypeVo courseTypeVo){
        is.delCourseType(courseTypeVo);
        return "success";
    }
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(String[] courseTypeid){
        System.out.println("--"+courseTypeid);
        return "success";
    }


}
