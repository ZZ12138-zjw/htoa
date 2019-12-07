//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.ht.controller.cemer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.StudentVo;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/student"})
public class StudentController {
    @Resource
    StudentService studentService;

    public StudentController() {
    }

    @RequestMapping({"/qingjia"})
    public String qingjiaPage() {
        return "order-list";
    }

    @RequestMapping({"/studentInfo"})
    public String toStudentInfo(HttpServletRequest request) {
        request.setAttribute("studentInfo", this.studentService.getStudentInfo());
        System.out.println(this.studentService.getStudentInfo().toString());
        return "student_info";
    }

    @RequestMapping({"/test"})
    public String toTestPage() {
        return "test";
    }

    @RequestMapping({"/testdata"})
    @ResponseBody
    public Map getData(String page, String limit) {
        System.out.println(page);
        System.out.println(limit);
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", " ");
        map.put("count", this.studentService.getStudentInfo().size());
        JSONArray jsonArray = (JSONArray)JSON.toJSON(this.studentService.pageGetStudentInfo(Integer.parseInt(page), Integer.parseInt(limit)));
        map.put("data", jsonArray);
        System.out.println(map.toString());
        return map;
    }

    @RequestMapping({"/toAdd"})
    public String toAddPage(HttpServletRequest request) {
        request.setAttribute("huor", this.studentService.getAllHuor());
        request.setAttribute("studentClass", this.studentService.getAllClass());
        return "studentAdd";
    }

    @RequestMapping({"/add"})
    @ResponseBody
    public String addStu(StudentVo studentVo) {
        System.out.println("进来了");
        this.studentService.addStuVo(studentVo);
        return "successful";
    }
    @RequestMapping(value = "/toUpdate")
    public String toUpd(int stuId,HttpServletRequest request){
        System.out.println(stuId);
        request.setAttribute("student",this.studentService.getById(stuId));
        request.setAttribute("huor", this.studentService.getAllHuor());
        request.setAttribute("studentClass", this.studentService.getAllClass());
        return "studentUpdate";
    }
    @RequestMapping(value = "/update")
    @ResponseBody
    public String updStu(StudentVo studentVo){
        System.out.println("进来了");
        studentService.updStu(studentVo);

        return "sucessful";
    }

}
