package com.ht.controller.wj;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.wj.MyWeekService;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.WeeklyVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/myweek")
public class MyWeekController {

    @Resource
    private MyWeekService myWeekService;

    @RequestMapping("/myweekpage")
    public String myweek(){
        return "myWeek";
    }

    @RequestMapping("/weekAdd")
    public String weekAdd(){
        return "weekAdd";
    }

    @ResponseBody
   @RequestMapping("/addweek")
    public String addweek(WeeklyVo weeklyVo, HttpSession session){
        EmpVo empVo = (EmpVo) session.getAttribute("empVo");
        String empName = empVo.getEmpName();
        weeklyVo.setEmpid(empName);
        weeklyVo.setWorkday(new Date());
        myWeekService.addDoc(weeklyVo);
        return "success";
   }

    //查询所有周报
    @RequestMapping("/myweekList")
    @ResponseBody
    public Map myweekList(String page, String limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",myWeekService.selCount());
        JSONArray jsonArray=(JSONArray) JSON.toJSON(myWeekService.selweek(Integer.parseInt(page),Integer.parseInt(limit)));
        map.put("data",jsonArray);
        System.out.println(map.toString());
        return map;
    }
}
