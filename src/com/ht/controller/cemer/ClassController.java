package com.ht.controller.cemer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.cemer.ClassService;
import com.ht.service.cemer.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/cla")
public class ClassController {
    @Resource
    StudentService studentService;
    @Resource
    ClassService classService;

    @RequestMapping(value = "/class")
    public String toClassPage(HttpServletRequest request){
        request.setAttribute("falls",this.studentService.selectAllFall());
        return "student_class";
    }

    @RequestMapping(value = "/classAll")
    @ResponseBody
    public Map getClassData(String page,String limit,String fallid){
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", " ");
        JSONArray jsonArray =  new JSONArray();
        if(fallid == null || fallid.equals("")){
            map.put("count", this.classService.selectAll().size());
            jsonArray = (JSONArray) JSON.toJSON(this.classService.selectByPage(Integer.parseInt(page), Integer.parseInt(limit)));
            map.put("data", jsonArray);
            return map;
        }else {
            map.put("count",this.classService.selectByAllFallcount(Integer.parseInt(fallid)).size());
            jsonArray = (JSONArray)JSON.toJSON(this.classService.selectByPageFall(Integer.parseInt(fallid),Integer.parseInt(page),Integer.parseInt(limit)));
            map.put("data",jsonArray);
            return map;
        }
    }

    @RequestMapping(value = "/delCla")
    @ResponseBody
    public String delClass(int classId){
        //删除班级
        classService.delClass(classService.getById(classId));
        //并且把改班内所有学生的班级字段改为空值
        classService.updateStudentClassId(classId);
        return "success";
    }

    @RequestMapping(value = "/toAdd")
    public String toClassAddPage(HttpServletRequest request){
        request.setAttribute("emps",studentService.selectAllEmp());
        request.setAttribute("types",classService.selectAllTypes());
        request.setAttribute("levels",studentService.selectAllFall());
        return "ClassAdd";
    }

}
