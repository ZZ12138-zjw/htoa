package com.ht.controller.zz12138;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/5 9:32
 */
@Controller
@RequestMapping("/contro")
public class RepairApplyController {

    @ResponseBody
    @RequestMapping("/repairmanage")
    public String repairmanage(String repairMan,String repairSort,String repairAddress,String startDate,String repairIndex){
        System.out.println("提交维修申请");
        System.out.println(repairMan+repairAddress+repairIndex+repairSort+startDate);
        return "success";
    }

    @RequestMapping("/repairapply")
    public String repairapply(){
        System.out.println("进入维修申请页面");
        return "repairapply";
    }
}
