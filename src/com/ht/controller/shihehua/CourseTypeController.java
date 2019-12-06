package com.ht.controller.shihehua;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
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
    public Map coursetypeList(String page,String limit){
        System.out.println("page:"+page+"          limit:"+limit);

        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",is.selCourseTypeCount());
        JSONArray json = (JSONArray) JSON.toJSON(is.selCourseTypePage(Integer.parseInt(page), Integer.parseInt(limit)));
        map.put("data",json);
        System.out.println("map========"+map.toString()+map==null);
        return map;
    }

    @RequestMapping("/addcurriculum")
    @ResponseBody
    public String addcurriculum(CourseTypeVo courseTypeVo){
        System.out.println("添加");
        is.addCourseType(courseTypeVo);
        return "success";
    }

    @RequestMapping("/tocurriculum_update")
    public String tocurriculum_update(Map map,String courseTypeId){
        System.out.println("进来了修改方法！");
        CourseTypeVo courseTypeVo = is.selCourseType(Integer.parseInt(courseTypeId));
        map.put("courseTypeVo",courseTypeVo);
        return "curriculum_update";
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

    @RequestMapping("/update")
    @ResponseBody
    public String update(CourseTypeVo courseTypeVo){
        is.updateCourseType(courseTypeVo);
        return "success";
    }


}
