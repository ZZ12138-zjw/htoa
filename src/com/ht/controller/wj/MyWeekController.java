package com.ht.controller.wj;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.wj.MyWeekService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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

   /* @RequestMapping("/myweekLists")
    @ResponseBody
    public Map weekLists(String page, String limit,String empName){

        return ;
    }*/
}
