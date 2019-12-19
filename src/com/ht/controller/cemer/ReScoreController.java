package com.ht.controller.cemer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.cemer.ReScoreService;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.ReScoreCheck;
import com.ht.vo.student.StudentReplyScoreVo;
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
        //System.out.println(reScoreCheck.toString());
        request.setAttribute("reScoreChecks",reScoreCheck);
        request.setAttribute("cla",scoreService.getById(reScoreCheck.getClassid()));
        request.setAttribute("reScore",scoreService.getProById(reScoreCheck.getProjectId()));
        request.setAttribute("emp",scoreService.getEById(reScoreCheck.getEmpId()));
        return "reScoreAdd_form";
    }

    @RequestMapping("/loadReScore")
    @ResponseBody
    public Map getData(int classid){
        Map map = new HashMap();
        List students = scoreService.getStudentByClassid(classid);
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",students.size());
        JSONArray jsonArray = (JSONArray)JSON.toJSON(students);
        System.out.println(jsonArray.toJSONString());
        map.put("data",jsonArray);
        return map;
    }

    @RequestMapping(value = "/addStuReScore")
    @ResponseBody
    public String addStuReScore(String reScoreList,String empId,String projectId){
        System.out.println(reScoreList);
        JSONArray jsonArray = JSONArray.parseArray(reScoreList);
        for(int i = 0;i<jsonArray.size();i++){
            StudentReplyScoreVo s = new StudentReplyScoreVo();
            Map o = (Map)jsonArray.get(i);
            s.setScore1(Integer.parseInt(o.get("s1").toString()));
            s.setScore2(Integer.parseInt(o.get("s2").toString()));
            s.setScore3(Integer.parseInt(o.get("s3").toString()));
            s.setScore4(Integer.parseInt(o.get("s4").toString()));
            s.setScore5(Integer.parseInt(o.get("s5").toString()));
            s.setScore6(Integer.parseInt(o.get("s6").toString()));
            s.setScore7(Integer.parseInt(o.get("s7").toString()));
            s.setStudentId(Integer.parseInt(o.get("stuId").toString()));
            s.setProjectId(Integer.parseInt(projectId));
            s.setEmpId(Integer.parseInt(empId));
            s.setRemark(o.get("rs").toString());

            scoreService.addStuRescore(s);
        }
        return "success";
    }
}
