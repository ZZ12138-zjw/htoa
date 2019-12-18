package com.ht.controller.cemer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.cemer.ReScoreService;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.ReScoreCheck;
import com.sun.media.sound.SoftTuning;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/reScore")
@Controller
public class ReScoreController {
    @Resource
    ReScoreService scoreService;
    @Resource
    StudentService studentService;

    @RequestMapping("/page")
    public String toMainPage(HttpServletRequest request){
        request.setAttribute("projects",scoreService.selectAllProject());
        request.setAttribute("classes",studentService.selectAllClass());
        request.setAttribute("emps",studentService.selectAllEmp());
        return "reScore_list";
    }

    @RequestMapping("/loadData")
    @ResponseBody
    public Map getDataByCheck(ReScoreCheck scoreCheck,String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");

        map.put("count",scoreService.getByCheckCount(scoreCheck));
        JSONArray jsonArray = new JSONArray();
        jsonArray = (JSONArray) JSON.toJSON(scoreService.getByCheck(scoreCheck,Integer.parseInt(page),Integer.parseInt(limit)));
        map.put("data",jsonArray);
        return map;
    }

    @RequestMapping(value = "/toAddReScore")
    public String toAddReScore(HttpServletRequest request){
        request.setAttribute("projects",scoreService.selectAllProject());
        request.setAttribute("classes",studentService.selectAllClass());
        request.setAttribute("emps",studentService.selectAllEmp());
        return "classReScoreAdd";
    }

    @RequestMapping("/addReScore")
    public String addReScore(ReScoreCheck reScoreCheck,HttpServletRequest request){
        System.out.println(reScoreCheck.toString());
        request.setAttribute("reScoreChecks",reScoreCheck);
        return "reScoreAdd_form";
    }

    @RequestMapping("/loadReScore")
    @ResponseBody
    public Map getData(HttpServletRequest request){
        Map map = new HashMap();
        ReScoreCheck reScoreCheck = (ReScoreCheck)request.getAttribute("reScoreChecks");
        List students = scoreService.getStudentByClassid(reScoreCheck.getClassid());
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",students.size());
        JSONArray jsonArray = (JSONArray)JSON.toJSON(students);
        map.put("data",jsonArray);
        return map;
    }
}
