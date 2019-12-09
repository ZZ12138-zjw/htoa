package com.ht.controller.shihehua;

import com.ht.service.shihehua.ICourseService;
import com.ht.service.shihehua.ITrialService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.educational.TrialVo;
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
@RequestMapping("/trial")
public class TrialController {
    @Resource
    ITrialService its;
    @Resource
    ICourseService ics;
    @Resource
    IEmpService ies;


    /**
     * 去试讲和培训页面
     * @return
     */
    @RequestMapping("/to_trial_list")
    public String to_trial_list(){
        return "trial_list";
    }

    /**
     * 去添加页面
     * @return
     */
    @RequestMapping("/totrial_add")
    public String totrial_add(Map map){
        map.put("courseList",ics.selCourseList());
        map.put("empList",ies.selectAll());
        return "trial_add";
    }

    /**
     * 去修改页面
     * @param map
     * @return
     */
    @RequestMapping("totrial_update")
    public String totrial_update(Map map){

        return "trial_update";
    }

    @RequestMapping("/trialList")
    @ResponseBody
    public Map trialList(String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",its.selTrialCount());
        map.put("data",its.selTrialListPage(Integer.parseInt(page),Integer.parseInt(limit)));
        System.out.println(map.toString());
        return map;
    }

    /**
     * 添加
     * @param trialVo
     * @return
     */
    @RequestMapping("/trialadd")
    @ResponseBody
    public String trialadd(TrialVo trialVo){
        System.out.println(trialVo.toString());
        its.addTrial(trialVo);
        return "success";
    }


    /**
     * 删除所选行
     * @param trialVo
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(TrialVo trialVo) {
        its.delTrial(trialVo);
        return "success";
    }

    /**
     * 批量删除
     * @return
     */
    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(String[] trialid){
        String ids = "";
        for (int i=0;i<trialid.length;i++){
            ids+=trialid[i]+",";
        }
        ids=ids.substring(0,ids.length()-1);
        its.delTrials(ids);
        return "success";
    }

}
