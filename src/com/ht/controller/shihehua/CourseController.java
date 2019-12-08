package com.ht.controller.shihehua;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.shihehua.ICourseService;
import com.ht.service.shihehua.ICourseTypeService;
import com.ht.vo.educational.CourseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 华 on 2019/12/6.
 */
@Controller
@RequestMapping("/course")
public class CourseController {
    @Resource
    ICourseService is;
    @Resource
    ICourseTypeService its;

    /**
     * 去list页面
     * @return
     */
    @RequestMapping("/tocourse_list")
    public String tocourse_llist(){
        return "course_list";
    }

    /**
     * 去添加页面
     * @param map
     * @return
     */
    @RequestMapping("/tocourse_add")
    public String tocourse_add(Map map){
        map.put("courseTypeList",its.selCourseTypeList());
        return "course_add";
    }

    /**
     * 添加
     * @param courseVo
     * @return
     */
    @RequestMapping("/courseadd")
    @ResponseBody
    public String courseadd(CourseVo courseVo){
        is.addCourse(courseVo);
        return "success";
    }

    /**
     * 分页查询
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/courseList")
    @ResponseBody
    public Map courseList(String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",is.selCourseCount());
        map.put("data",is.selCoursePage(Integer.parseInt(page), Integer.parseInt(limit)));
        System.out.println(map.toString());
        return map;
    }

    /**
     * 根据id删除数据
     * @param courseVo
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(CourseVo courseVo){
        is.delCourse(courseVo);
        return "success";
    }

    /**
     * 去修改页面
     * @param map
     * @param courseid
     * @return
     */
    @RequestMapping("/to_courseUpdate")
    public String to_courseUpdate(Map map,String courseid){
        CourseVo courseVo = is.selCourse(Integer.parseInt(courseid));
        map.put("courseVo",courseVo);
        map.put("courseTypeList",its.selCourseTypeList());
        return "course_update";
    }

    /**
     * 修改方法
     * @param courseVo
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(CourseVo courseVo){
        System.out.println(courseVo.toString());
        is.updateCourse(courseVo);
        return "success";
    }

    /**
     * 批量删除
     */
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(String[] courseid){
        String ids = "";
        for (int i=0;i<courseid.length;i++){
            ids+=courseid[i]+",";
        }
        ids = ids.substring(0,ids.length()-1);

        return "success";
    }

}
