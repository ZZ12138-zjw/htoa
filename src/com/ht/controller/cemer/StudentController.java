//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.ht.controller.cemer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.service.cemer.ClassService;
import com.ht.service.cemer.StudentService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.student.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/student"})
public class StudentController {
    @Resource
    StudentService studentService;
    @Resource
    ClassService classService;
    @Resource
    IEmpService empService;

    public StudentController() {
    }

    @RequestMapping({"/qingjia"})
    public String qingjiaPage() {
        return "order-list";
    }

    @RequestMapping({"/studentInfo"})
    public String toStudentInfo(HttpServletRequest request) {
        request.setAttribute("classes",this.studentService.selectAllClass());
        request.setAttribute("hours",this.studentService.selectAllHour());
        request.setAttribute("studentInfo", this.studentService.getStudentInfo());
        System.out.println(this.studentService.getStudentInfo().toString());
        return "student_info";
    }

    @RequestMapping({"/test"})
    public String toTestPage() {
        return "test";
    }

    @RequestMapping({"/selectAll"})
    @ResponseBody
    public Map getData(String page, String limit,StudentSearch studentSearch) {
        System.out.println(page);
        System.out.println(limit);
        Map map = new HashMap();
        map.put("code", 0);
        map.put("msg", " ");
        map.put("count", this.studentService.selectBySearchCount(studentSearch));
        JSONArray jsonArray = (JSONArray)JSON.toJSON(this.studentService.selectBySearch(Integer.parseInt(page), Integer.parseInt(limit),studentSearch));
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

    @RequestMapping(value = "/delStu")
    @ResponseBody
    public String delStu(int stuId){
        System.out.println(stuId);
        //studentService.delStu(studentVo);
        return "successful";
    }



    @RequestMapping(value = "{oname}/toAdd")
    public String otherToPage(@PathVariable("oname")String oname,HttpServletRequest request,String stuId){
        if(oname.equals("stuFal")){
            request.setAttribute("stuId",stuId);
            return "studentfamilyadd";
        }
        if(oname.equals("stuEdu")){
            request.setAttribute("stuId",stuId);
            return "StudentEduAdd";
        }
        if(oname.equals("stuHap")){
            request.setAttribute("stuId",stuId);
            request.setAttribute("emps",this.studentService.selectAllEmp());
            return "studentHapAdd";
        }
        if(oname.equals("holiday")){
            request.setAttribute("stuId",stuId);
            return "";
        }
        if(oname.equals("replyScore")){
            request.setAttribute("stuId",stuId);
            //empid打分老师，projectId答辩项目
            request.setAttribute("emps",this.studentService.selectAllEmp());
            request.setAttribute("reScores",this.studentService.selectAllReplyScore());
            return "ReplyScoreAdd";
        }
        if(oname.equals("score")){
            request.setAttribute("stuId",stuId);
            //termid学期号，testtypeid考试类型，courseid考试科目,empid录入人员
            request.setAttribute("terms",this.studentService.selectAllTerm());
            request.setAttribute("types",this.studentService.selectAllTestType());
            request.setAttribute("courses",this.studentService.selectAllCourse());
            request.setAttribute("emps",this.studentService.selectAllEmp());
            return "ScoreAdd";
        }
        return "";
    }
    @RequestMapping(value = "stuFal/add")
    @ResponseBody
    public String addStuFal(StudentFamily studentFamily){
        studentService.addStuFal(studentFamily);
        return "success";
    }

    @RequestMapping(value = "stuEdu/add")
    @ResponseBody
    public String addStuEdu(StudentEduVo studentEduVo){
        studentService.addStuEdu(studentEduVo);
        return "success";
    }

    @RequestMapping(value = "stuHap/add")
    @ResponseBody
    public String addStuHap(StudentHappeningVo studentHappeningVo){
        studentService.addStuHap(studentHappeningVo);
        return "success";
    }

    @RequestMapping(value = "holiday/add")
    @ResponseBody
    public String addStuholiday(holidayStudentVo holidayStudentVo){
        studentService.addStuHoliday(holidayStudentVo);
        return "success";
    }

    @RequestMapping(value = "replyScore/add")
    @ResponseBody
    public String addStuRescore(StudentReplyScoreVo studentReplyScoreVo){
        studentService.addStuReScore(studentReplyScoreVo);
        return "success";
    }

    @RequestMapping(value = "score/add")
    @ResponseBody
    public String addStuScore(StudentScoreVo studentScoreVo){
        studentService.addStuScore(studentScoreVo);
        return "success";
    }

    @RequestMapping(value = "{oname}/{type}")
    @ResponseBody
    public JSONObject getOtherData(String stuId,@PathVariable("oname") String oname,@PathVariable("type") String type,HttpServletRequest request) {
        JSONObject object = new JSONObject();
        object.put("code", 0);
        object.put("msg"," ");
        if(oname.equals("stuFal")){
            if(type.equals("select")){
                List familys = studentService.selectStuFamily(Integer.parseInt(stuId));
                object.put("count",familys.size());
                JSONArray jsonArray = (JSONArray)JSON.toJSON(familys);
                object.put("data",jsonArray);
                return object;
            }
        }
        if(oname.equals("stuEdu")){
            if(type.equals("select")){
                List edus = studentService.selectStuEdu(Integer.parseInt(stuId));
                object.put("count",edus.size());
                JSONArray jsonArray = (JSONArray)JSON.toJSON(edus);
                object.put("data",jsonArray);
                return object;
            }
        }
        if(oname.equals("stuHap")){
            if(type.equals("select")){
                List haps = studentService.selectStuHap(Integer.parseInt(stuId));
                object.put("count",haps.size());
                JSONArray jsonArray = (JSONArray)JSON.toJSON(haps);
                object.put("data",jsonArray);
                return object;
            }
        }
        if(oname.equals("holiday")){
            if(type.equals("select")){
                List holidays = studentService.selectHoliday(Integer.parseInt(stuId));
                object.put("count",holidays.size());
                JSONArray jsonArray = (JSONArray)JSON.toJSON(holidays);
                object.put("data",jsonArray);
                return object;
            }
        }if(oname.equals("replyScore")){
            if(type.equals("select")){
                List reScores = studentService.selectReplyScore(Integer.parseInt(stuId));
                object.put("count",reScores.size());
                JSONArray jsonArray = (JSONArray)JSON.toJSON(reScores);
                object.put("data",jsonArray);
                return object;
            }
        }if(oname.equals("score")){
            if(type.equals("select")){
                List scores = studentService.selectScore(Integer.parseInt(stuId));
                object.put("count",scores.size());
                JSONArray jsonArray = (JSONArray)JSON.toJSON(scores);
                object.put("data",jsonArray);
                return object;
            }
        }
        return object;
    }
}
