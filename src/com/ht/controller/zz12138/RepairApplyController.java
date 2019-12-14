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
import java.text.ParseException;
import java.text.ParsePosition;
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
    public String repairmanage(RepairManageVo vo) throws ParseException {
        System.out.println("进入添加维修管理");
        service.addRepairMange(vo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/repairapply")
    public String repairapply(RepairManageVo vo) throws ParseException {
        System.out.println("进入报修申请控制器");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
        String startdate = simpleDateFormat.format(new Date());
        vo.setStartDate(startdate);
        System.out.println(vo.toString());
        service.addRepairMange(vo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/listrepair")
    public Map listrepair(String page,String limit) throws ParseException {
        System.out.println("遍历维修管理");
        if (limit==null){
            limit=5+"";
        }
        List list = service.listRepairManage(Integer.parseInt(page),Integer.parseInt(limit));
        int total = service.selTotal();
        JSONArray json = (JSONArray) JSON.toJSON(list);
        Map map = new HashMap();
        map.put("data",json);
        map.put("code",0);
        map.put("msg","");
        map.put("count",total);
        System.out.println("map:"+map.toString());
        return map;
    }

    @ResponseBody
    @RequestMapping("/delrepairmanage")
    public void delrepairmanage(String repairID){
        System.out.println("删除了数据");
        service.delRepairManage(Integer.parseInt(repairID));
    }

    @RequestMapping("/to_repairapply")
    public String repairapply(ModelMap model){
        List list = service.selectAllDept();
        model.put("allDeptList",list);
        System.out.println("进入维修申请页面");
        return "repairapply";
    }

    @RequestMapping("/to_repairmanage")
    public String to_repairmanage(){
        System.out.println("进入维修管理页面");
        return "repairmanage";
    }

    @RequestMapping("/to_addrepairmanage")
    public String to_addrepairmanage(ModelMap model){
        List list = service.selectAllDept();
        model.put("allDeptList",list);
        System.out.println("进入添加维修管理页面");
        return "addrepairmanage";
    }

    @RequestMapping("/to_editrepairmanage")
    public String editrepairmanage(String repairid, ModelMap model){
        System.out.println("进入编辑维修管理页面");
        RepairManageVo vo = service.listRepair(Integer.parseInt(repairid));
        List list = service.selectAllDept();

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
        model.put("allDeptList",list);
        return "editrepairmanage";
    }

    @ResponseBody
    @RequestMapping("/alldelete")
    public String alldelete(String repairID[]){
        String temp = "";
        for (int i=0;i<repairID.length;i++){
             temp+=repairID[i]+",";
        }
        String id=temp.substring(0,temp.length()-1);
        service.alldelete(id);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/editrepairmanage")
    public String editrepairmanage(RepairManageVo vo){
        service.editrepairmanage(vo);
        return "success";
    }
}
