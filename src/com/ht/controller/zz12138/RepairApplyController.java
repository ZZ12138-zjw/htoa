package com.ht.controller.zz12138;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.service.zz12138.IRepairManageService;
import com.ht.vo.LogisticsCheck.RepairManageVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/5 9:32
 */
@Controller
@RequestMapping("/repaircontro")
public class RepairApplyController {

    @Resource
    IRepairManageService service;

    @ResponseBody
    @RequestMapping("/repairmanage")
    public String repairmanage(RepairManageVo vo){
        if (vo.getStartDate()==null){
            Date currentTime = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String dateString = formatter.format(currentTime);
            vo.setStartDate(dateString);
        }
        System.out.println(vo.toString());
        service.addRepairMange(vo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/listrepair")
    public Map listrepair(String page,String limit){
        if (limit==null){
            limit=5+"";
        }
        List list = service.listRepairManage(Integer.parseInt(page),Integer.parseInt(limit));
        System.out.println("list为："+list.toString());
        JSONArray jsonArray=(JSONArray)JSON.toJSON(list);
        int total = service.selTotal();
        Map map = new HashMap();
        map.put("data",jsonArray);
        map.put("code",0);
        map.put("msg","");
        map.put("count",total);
        return map;
    }

    @RequestMapping("/repairapply")
    public String repairapply(){
        System.out.println("进入维修申请页面");
        return "repairapply";
    }

    @RequestMapping("/to_repairmanage")
    public String to_repairmanage(){
        System.out.println("进入维修管理页面");
        return "repairmanage";
    }
}
