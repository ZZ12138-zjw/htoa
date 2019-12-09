package com.ht.controller.zz12138;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.xiaoen.IDeptService;
import com.ht.service.zz12138.ICheckIndex;
import com.ht.vo.LogisticsCheck.CheckIndexVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/9 14:37
 */
@Controller
@RequestMapping("/checkcontro")
public class CheckIndexController {

    @Resource
    ICheckIndex iCheckIndexService;

    @Resource
    IDeptService deptService;

    @RequestMapping("/to_checkindex")
    public String to_checkindex(ModelMap model){
        System.out.println("进入考核指标页面");
        return "checkindex";
    }

    @ResponseBody
    @RequestMapping("/listcheckindex")
    public Map listcheckindex(String page,String limit){
        System.out.println("查询考核指标");
        Map map = new HashMap();
        int total = iCheckIndexService.selAllCheck();
        List list = iCheckIndexService.listCheckIndex(Integer.parseInt(page),Integer.parseInt(limit));
        JSONArray json = (JSONArray)JSON.toJSON(list);
        System.out.println(json.toJSONString());

        map.put("code",0);
        map.put("msg","");
        map.put("count",total);
        map.put("data",json);
        return map;
    }

    @RequestMapping("/to_addcheckindex")
    public String to_addcheckindex(ModelMap model){
        System.out.println("进入添加考核指标页面");
        List list = deptService.selectAll();
        model.put("allCheckList",list);
        return "addcheckindex";
    }

    @ResponseBody
    @RequestMapping("/addcheckindex")
    public String addcheckindex(CheckIndexVo vo){
        System.out.println("进入添加考核指标控制器"+vo.toString());
        iCheckIndexService.addCheckIndex(vo);
        return "success";
    }

    @RequestMapping("/to_editcheckindex")
    public String to_editcheckindex(String iD,ModelMap modelMap){
        System.out.println("进入编辑考核指标页面");
        CheckIndexVo vo = iCheckIndexService.selCheckIndex(Integer.parseInt(iD));
        List list = deptService.selectAll();
        modelMap.put("allDept",list);
        modelMap.put("checkIndexList",vo);
        System.out.println("allDept为："+list.toString()+"checkIndexList为："+vo.toString());
        return "editcheckindex";
    }

    @ResponseBody
    @RequestMapping("/editcheckindex")
    public String editcheckindex(CheckIndexVo vo,String depName){
        System.out.println("进入编辑考核指标控制器");
        System.out.println(vo.toString());
        vo.setDepName(depName);
        iCheckIndexService.updateCheckIndex(vo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/delcheckindex")
    public String delcheckindex(String iD){
        iCheckIndexService.delcheckindex(iD);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/alldelcheckindex")
    public String alldelcheckindex(String iD[]){
        System.out.println(iD.toString());
        String temp = "";
        for (int i=0;i<iD.length;i++){
            temp+=iD[i]+",";
        }
        String id=temp.substring(0,temp.length()-1);
        iCheckIndexService.delcheckindex(id);
        return "success";
    }
}
