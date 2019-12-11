package com.ht.controller.zz12138;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.zz12138.IEvaluationService;
import com.ht.vo.LogisticsCheck.EvaluationContentVo;
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
 * @date 2019/12/10 21:11
 */
@Controller
@RequestMapping("/evaluationcontro")
public class EvaluationContro {

    @Resource
    IEvaluationService evaluationService;

    @RequestMapping("/to_evaluationcontent")
    public String to_evaluationcontent(){
        System.out.println("进入考评内容页面");
        return "evaluationcontent";
    }

    @RequestMapping("/to_addevaluationcontent")
    public String to_addevaluationcontent(ModelMap model){
        List list = evaluationService.selDepName();
        model.put("allDepName",list);
        System.out.println("进入添加考评内容页面");
        return "addevaluationcontent";
    }

    @RequestMapping("/to_editevaluationcontent")
    public String to_editevaluationcontent(ModelMap model,String evaluationID){
        EvaluationContentVo vo = evaluationService.listByID(Integer.parseInt(evaluationID));
        List list = evaluationService.selAll();
        System.out.println(vo.toString());
        System.out.println(list.toString());
        model.put("evaluationList",vo);
        model.put("allEvaluationList",list);
        System.out.println("进入编辑考评内容页面");
        return "editevaluationcontent";
    }

    @ResponseBody
    @RequestMapping("/listevaluationcontent")
    public Map listevaluationcontent(String page,String limit){
        Map map = new HashMap();
        if (limit==null&&page==null){
            limit = 5+"";
            page = 1+"";
        }
        System.out.println(page+"  "+limit);
        System.out.println("进入遍历");
        List list = evaluationService.listEvaluationContent(Integer.parseInt(page),Integer.parseInt(limit));
        JSONArray jsonArray = (JSONArray) JSON.toJSON(list);
        int total = evaluationService.selAllCount();
        map.put("code",0);
        map.put("msg","");
        map.put("count",total);
        map.put("data",jsonArray);
        System.out.println(map.toString());
        return map;
    }

    @ResponseBody
    @RequestMapping("/editevaluationcontent")
    public String editevaluationcontent(EvaluationContentVo vo){
        System.out.println(vo.toString());
        evaluationService.updateEvaluationContent(vo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/addevaluationcontent")
    public String addevaluationcontent(EvaluationContentVo vo){
        evaluationService.addEvaluationContent(vo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/delevaluationcontent")
    public String delevaluationcontent(String evaluationID){
        evaluationService.delEvaluationContent(evaluationID);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/alldelevaluation")
    public String alldelevaluation(String evaluationID[]){
        String temp = "";
        for (int i=0;i<evaluationID.length;i++){
            temp+=evaluationID[i]+",";
        }
        String id=temp.substring(0,temp.length()-1);
        evaluationService.delEvaluationContent(id);
        return "success";
    }
}
