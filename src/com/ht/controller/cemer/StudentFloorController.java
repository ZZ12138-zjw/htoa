package com.ht.controller.cemer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.cemer.IStudentFloorService;
import com.ht.vo.student.StudentFloorVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 华 on 2019/12/10.
 */

@Controller
@RequestMapping("floor")
public class StudentFloorController {

    @Resource
    IStudentFloorService isf;

    @RequestMapping("/to_floor_list")
    public String to_floor_list(){
        return "floor_list";
    }
    @RequestMapping("flooorList")
    @ResponseBody
    public Map floorList(String page,String limit){
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", " ");
        map.put("count",isf.selFloorCount());
        JSONArray jsonArray = (JSONArray) JSON.toJSON(isf.selFloorPage(Integer.parseInt(page),Integer.parseInt(limit)));
        map.put("data",jsonArray);
        return map;
    }

    @RequestMapping("/tofloor_add")
    public String tofloor_add(){
        return "floor_add";
    }

    @RequestMapping("/flooradd")
    @ResponseBody
    public String flooradd(StudentFloorVo studentFloorVo){
        isf.addFloor(studentFloorVo);
        return "success";
    }

    @RequestMapping("/tofloor_update")
    public String tofloor_update(Map map,String floorId){
        map.put("FloorVo",isf.selFloor(Integer.parseInt(floorId)));
        return "floor_update";
    }


    @RequestMapping("/floorupdate")
    @ResponseBody
    public String floorupdate(StudentFloorVo studentFloorVo){
        isf.updFloor(studentFloorVo);
        return "success";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(StudentFloorVo studentFloorVo){
        isf.delFloor(studentFloorVo);
        return "success";
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(String[] floorId){
        String ids = "";
        for (int i=0;i<floorId.length;i++){
            ids+=floorId[i]+",";
        }
        ids=ids.substring(0,ids.length()-1);
        isf.delFloors(ids);
        return "success";
    }

}
