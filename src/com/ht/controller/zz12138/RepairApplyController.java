package com.ht.controller.zz12138;

import com.ht.service.zz12138.IRepairManageService;
import com.ht.vo.LogisticsCheck.RepairManageVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/5 9:32
 */
@Controller
@RequestMapping("/contro")
public class RepairApplyController {

    @Resource
    IRepairManageService service;

    @ResponseBody
    @RequestMapping("/repairmanage")
    public String repairmanage(String repairMan,String repairSort,String repairAddress,String repairName,String repairDept){
        RepairManageVo vo = new RepairManageVo();
        vo.setRepairName(repairName);
        vo.setRepairMan(repairMan);
        vo.setRepairDept(repairDept);
        vo.setRepairSort(repairSort);
        vo.setRepairAddress(repairAddress);
        vo.setRepairStatus("待维修");
        vo.setStartDate(new Date());

        service.addRepairMange(vo);
        return "success";
    }

    @RequestMapping("/repairapply")
    public String repairapply(){
        System.out.println("进入维修申请页面");
        return "repairapply";
    }
}
