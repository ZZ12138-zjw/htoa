package com.ht.controller.cemer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.cemer.ClassService;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.StudentClassVo;
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
        if(fallid == null || "".equals(fallid)){
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

    @RequestMapping("/add")
    @ResponseBody
    public String addClass(StudentClassVo studentClassVo){
        System.out.println(studentClassVo.toString());
        classService.addStuClass(studentClassVo);
        return "success";
    }

    @RequestMapping("/toUpdate")
    public String updateStuClass(int classId,HttpServletRequest request){
        request.setAttribute("stuClass",classService.getStuClassById(classId));
        request.setAttribute("emps",studentService.selectAllEmp());
        request.setAttribute("types",classService.selectAllTypes());
        request.setAttribute("levels",studentService.selectAllFall());
        return "classUpdate";
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public String updateStuClass(StudentClassVo studentClassVo){
        classService.updateStuClass(studentClassVo);
        return "success";
    }
    @RequestMapping(value = "/toLook")
    public String toLookStu(int classId,HttpServletRequest request){
        request.setAttribute("classId",classId);
        return "ClassStudent_list";
    }
    @RequestMapping("/loadStu")
    @ResponseBody
    public Map getStuData(int classId){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        JSONArray jsonArray = new JSONArray();
        map.put("count",classService.selectAllStudentByClassId(classId).size());
        jsonArray = (JSONArray)JSON.toJSON(classService.selectAllStudentByClassId(classId));
        map.put("data",jsonArray);
        return map;
    }
}
