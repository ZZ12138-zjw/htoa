package com.ht.controller.wj;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.wj.WeekService;
import com.ht.service.xiaoen.IDeptService;
import com.ht.vo.employee.DeptVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/week")
public class WeeklyController {

    @Resource
    private IDeptService iDeptService;
    /*@Resource
    private WeekService weekService;*/

    @RequestMapping("/weeklyList")
    public String weekly_list(){
        return "weekly_list";
    }

    //查询所有部门名称
    @RequestMapping("/deptName")
    @ResponseBody
    public List deptName(){
        List<DeptVo> depVos = iDeptService.selectAll();
        List depNames = new ArrayList();
        for (DeptVo depVo:depVos ) {
            depNames.add(depVo.getDepName());
        }
        return depNames;
    }

    //查询所有周报
    /*@RequestMapping("/weekLists")
    @ResponseBody
    public Map weekLists(String page, String limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",weekService.selCount());
        JSONArray jsonArray=(JSONArray) JSON.toJSON(weekService.selWeek(Integer.parseInt(page),Integer.parseInt(limit)));
        map.put("data",jsonArray);
        System.out.println(map.toString());
        return map;
    }*/
}
