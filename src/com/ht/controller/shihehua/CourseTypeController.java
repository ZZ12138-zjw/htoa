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

    /**
     * 去list页面
     * @return
     */
    @RequestMapping("/tocurriculum_list")
    public String tocurriculum_list(){
        return "curriculum_list";
    }

    /**
     * 去添加页面
     * @return
     */
    @RequestMapping("/tocurriculum_add")
    public String tocurriculum_add(){
        return "curriculum_add";
    }

    /**
     * 从数据库查询数据传到list页面展示
     * @param page
     * @param limit
     * @return
     */
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

    /**
     * 添加数据到数据库
     * @param courseTypeVo
     * @return
     */
    @RequestMapping("/addcurriculum")
    @ResponseBody
    public String addcurriculum(CourseTypeVo courseTypeVo){
        System.out.println("添加");
        is.addCourseType(courseTypeVo);
        return "success";
    }

    /**
     * 去修改页面
     * @param map
     * @param courseTypeId
     * @return
     */
    @RequestMapping("/tocurriculum_update")
    public String tocurriculum_update(Map map,String courseTypeId){
        System.out.println("进来了修改方法！");
        CourseTypeVo courseTypeVo = is.selCourseType(Integer.parseInt(courseTypeId));
        map.put("courseTypeVo",courseTypeVo);
        return "curriculum_update";
    }

    /**
     * 删除单条数据
     * @param courseTypeVo
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(CourseTypeVo courseTypeVo){
        is.delCourseType(courseTypeVo);
        return "success";
    }

    /**
     * 批量删除
     * @param courseTypeId
     * @return
     */
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(String[] courseTypeId){
        String ids = "";
        for (int i=0;i<courseTypeId.length;i++){
            ids+=courseTypeId[i]+",";
        }
        ids = ids.substring(0,ids.length()-1);
        is.delCourseTypes(ids);
        return "success";
    }

    /**
     * 修改数据
     * @param courseTypeVo
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public String update(CourseTypeVo courseTypeVo){
        is.updateCourseType(courseTypeVo);
        return "success";
    }


}
