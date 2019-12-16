package com.ht.controller.wj;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.wj.MyWeekService;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.WeeklyVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/myweek")
public class MyWeekController {

    @Resource
    private MyWeekService myWeekService;

    @RequestMapping("/myweekly_list")
    public String myweekly_list(){
        return "myweekly_list";
    }

    @RequestMapping("/weekly_add")
    public String weekly_add(){
        return "weekly_add";
    }

    @ResponseBody
   @RequestMapping("/addweek")
    public String addweek(WeeklyVo weeklyVo, HttpSession session){
        EmpVo empVo = (EmpVo) session.getAttribute("empVo");
        int empid = empVo.getEmpId();
        weeklyVo.setEmpid(empid);
        weeklyVo.setWorkday(new Date());
        myWeekService.addweek(weeklyVo);
        return "success";
   }

    //查询所有周报
    @RequestMapping("/tomyweekList")
    @ResponseBody
    public Map tomyweekList(int page, int limit,HttpSession session,Integer empid){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",myWeekService.selCount(session,empid));
        map.put("data",myWeekService.selweek(page,limit,empid,session));
        System.out.println(map.toString());
        return map;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public void delete(WeeklyVo weeklyVo){
        myWeekService.delete(weeklyVo);
    }

    @RequestMapping("/to_weekUpdate")
    public String  to_weekUpdate(WeeklyVo weeklyVo, Model model){
        weeklyVo = myWeekService.selbyid(weeklyVo);
        model.addAttribute("weeklyVo",weeklyVo);
        System.out.println(weeklyVo);
        return "weekly_update";
    }

    @ResponseBody
    @RequestMapping("/weekupdate")
    public String weekupdate(WeeklyVo weeklyVo, HttpServletRequest request) throws ParseException {
        String workdays = request.getParameter("workdays");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(workdays);
        weeklyVo.setWorkday(date);
        System.out.println(weeklyVo);
        myWeekService.update(weeklyVo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/deletes")
    public String deletes(String[] id){
        System.out.println("删除");
        String docIds = "";
        for (int i=0;i<id.length;i++){
            docIds+=id[i]+",";
        }
        String docid = docIds.substring(0,docIds.length()-1);
        myWeekService.deletes(docid);
        return "success";
    }

    @RequestMapping("/selwek")
    public String selwek(int worklogid, Model model){
        List mlist = myWeekService.mlist(worklogid);
        model.addAttribute("mlist",mlist);
        System.out.println(mlist);
        return "selwek";
    }

}
