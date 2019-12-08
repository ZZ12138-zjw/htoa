package com.ht.controller.zz12138;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.service.zz12138.IRepairManageService;
import com.ht.vo.LogisticsCheck.RepairManageVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

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
        System.out.println("进入维修申请");
        if (vo.getStartDate()==null){
            Date currentTime = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String dateString = formatter.format(currentTime);
            vo.setStartDate(dateString);
        }
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
        JSONArray jsonArray=(JSONArray)JSON.toJSON(list);
        int total = service.selTotal();
        Map map = new HashMap();
        map.put("data",jsonArray);
        map.put("code",0);
        map.put("msg","");
        map.put("count",total);
        return map;
    }

    @ResponseBody
    @RequestMapping("/delrepairmanage")
    public void delrepairmanage(String repairID){
        System.out.println("删除了数据");
        service.delRepairManage(Integer.parseInt(repairID));
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

    @RequestMapping("/to_addrepairmanage")
    public String to_addrepairmanage(){
        System.out.println("进入维修管理页面");
        return "addrepairmanage";
    }

    @RequestMapping("/to_editrepairmanage")
    public String editrepairmanage(String repairid, ModelMap model){
        System.out.println("进入编辑维修管理页面");
        RepairManageVo vo = service.listRepair(Integer.parseInt(repairid));
        List sortList = new ArrayList();
        List statusList = new ArrayList();

        Map sort1 = new HashMap();
        Map sort2 = new HashMap();
        Map sort3 = new HashMap();
        Map sort4 = new HashMap();

        Map status1 = new HashMap();
        Map status2 = new HashMap();
        Map status3 = new HashMap();

        sort1.put("repairSort","水电报修");
        sort2.put("repairSort","设备报修");
        sort3.put("repairSort","建筑报修");
        sort4.put("repairSort","其他报修");

        status1.put("repairStatus","待维修");
        status2.put("repairStatus","维修中");
        status3.put("repairStatus","已维修");

        sortList.add(sort1);
        sortList.add(sort2);
        sortList.add(sort3);
        sortList.add(sort4);

        statusList.add(status1);
        statusList.add(status2);
        statusList.add(status3);

        System.out.println(vo.toString());
        System.out.println("维修类型list:"+sortList.toString());
        System.out.println("维修状态list:"+statusList.toString());

        model.put("listRepair",vo);
        model.put("repairSortList",sortList);
        model.put("repairStatusList",statusList);
        return "editrepairmanage";
    }

}
