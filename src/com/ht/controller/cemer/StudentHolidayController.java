package com.ht.controller.cemer;

import org.activiti.engine.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/stuHoliday")
public class StudentHolidayController {
    @Resource
    private ProcessEngine processEngine;
    @Resource
    private TaskService taskService;
    @Resource
    private RuntimeService runtimeService;
    @Resource
    private HistoryService historyService;
    @Resource
    private RepositoryService repositoryService;

    @RequestMapping("/to_holidayList")
    public String toHolidayPage(){
        return "student_holiday/studentHoliday_list";
    }
    @RequestMapping("/holidayList")
    @ResponseBody
    public Map holidayList(String page, String limit, HttpSession session){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        //map.put("count",);



        return map;
    }
}
