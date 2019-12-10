package com.ht.controller.shihehua;

import com.ht.service.shihehua.IWeekArrangeService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.educational.WeekArrangeVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 华 on 2019/12/9.
 */
@Controller
@RequestMapping("/weekarrange")
public class WeekArrangeController {

    @Resource
    IWeekArrangeService iw;
    @Resource
    IEmpService ie;

    @RequestMapping("/to_weekarrange_list")
    public String to_weekarrange_list(){
        return "weekarrange_list";
    }
    @RequestMapping("/weekarrangeList")
    @ResponseBody
    public Map weekarrangeList(String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",iw.selWeekArrangeCount());
        map.put("data",iw.selWeekArrangePage(Integer.parseInt(page),Integer.parseInt(limit)));
        return map;
    }

    @RequestMapping("/toweekarrange_add")
    public String toweekarrange_add(Map map){
        map.put("empList",ie.selectAll());
        return "weekarrange_add";
    }

    @RequestMapping("/addweekarrange")
    @ResponseBody
    public String addweekarrange(WeekArrangeVo weekArrangeVo){
        iw.addWeekArrange(weekArrangeVo);
        return "success";
    }

    @RequestMapping("delete")
    @ResponseBody
    public String delete(WeekArrangeVo weekArrangeVo){
        iw.delWeekArrange(weekArrangeVo);
        return "success";
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(String[] weekArrangeid){
        String ids = "";
        for (int i=0;i<weekArrangeid.length;i++){
            ids+=weekArrangeid[i]+",";
        }
        ids=ids.substring(0,weekArrangeid.length-1);
        iw.delWeekArranges(ids);
        return "success";
    }

    @RequestMapping("/toweekarrange_update")
    public String toweekarrange_update(Map map,String weekArrangeid){
        WeekArrangeVo weekArrangeVo = iw.selWeekArrange(Integer.parseInt(weekArrangeid));
        map.put("weekarrangeList",weekArrangeVo);
        map.put("empList",ie.selectAll());
        return "weekarrange_update";
    }

    @RequestMapping("update")
    @ResponseBody
    public String update(WeekArrangeVo weekArrangeVo){
        iw.updateWeekArrange(weekArrangeVo);
        return "success";
    }

}
