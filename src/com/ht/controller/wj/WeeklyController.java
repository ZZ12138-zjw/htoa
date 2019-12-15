package com.ht.controller.wj;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.wj.WeekService;
import com.ht.service.xiaoen.IDeptService;
import com.ht.vo.employee.DeptVo;
import com.ht.vo.employee.WeekCheck;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/week")
public class WeeklyController {

    @Resource
    private IDeptService iDeptService;
    @Resource
    private WeekService weekService;

    @RequestMapping("/weekly_list")
    public String weekly_list(HttpServletRequest request){
        List<DeptVo> depVos = iDeptService.selectAll();
        request.setAttribute("depVos",depVos);
        return "weekly_list";
    }

    //查询所有周报
    @RequestMapping("/weekList")
    @ResponseBody
    public Map weekList(int page, int limit, WeekCheck weekCheck){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",weekService.selCount());
        map.put("data",weekService.selWeek(page,limit,weekCheck));
        System.out.println(map.toString());
        return map;
    }
}
