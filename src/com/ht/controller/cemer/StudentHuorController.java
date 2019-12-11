package com.ht.controller.cemer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.cemer.IStudentFloorService;
import com.ht.service.cemer.IStudentHuorService;
import com.ht.vo.student.StudentHuorVo;
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
@RequestMapping("/huor")
public class StudentHuorController {

    @Resource
    IStudentHuorService ih;
    @Resource
    IStudentFloorService isf;

    @RequestMapping("/to_huor_list")
    public String to_huor_list(){
        return "huor_list";
    }

    @RequestMapping("/huorList")
    @ResponseBody
    public Map huorList(String page, String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",ih.selHuorCount());
        map.put("data",ih.selHuorPage(Integer.parseInt(page),Integer.parseInt(limit)));
        System.out.println(map.toString());
        return map;
    }

    @RequestMapping("/tohuor_add")
    public String tohuor_add(Map map){
        map.put("floorList",isf.selFloorList());
        return "huor_add";
    }

    @RequestMapping("/huorAdd")
    @ResponseBody
    public String huorAdd(StudentHuorVo studentHuorVo){
        ih.addHuor(studentHuorVo);
        return "success";
    }

    @RequestMapping("/tohuor_update")
    public String tohuor_update(Map map,String huorId){
        StudentHuorVo studentHuorVo = ih.selHuor(Integer.parseInt(huorId));
        map.put("huorList",studentHuorVo);
        map.put("floorList",isf.selFloorList());
        return "huor_update";
    }

    @RequestMapping("/huorUpdate")
    @ResponseBody
    public String huorUpdate(StudentHuorVo studentHuorVo){
        ih.updateHuor(studentHuorVo);
        return "success";
    }


    @RequestMapping("/delete")
    @ResponseBody
    public String delete(StudentHuorVo studentHuorVo){
        ih.delHuor(studentHuorVo);
        return "success";
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(String[] hourId){
        String ids = "";
        for (int i=0;i<hourId.length;i++){
            ids+=hourId[i]+",";
        }
        ids=ids.substring(0,ids.length()-1);
        ih.delHuors(ids);
        return "success";
    }

}
