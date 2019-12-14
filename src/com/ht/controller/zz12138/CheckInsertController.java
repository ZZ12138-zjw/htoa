package com.ht.controller.zz12138;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.zz12138.ICheckInsert;
import com.ht.vo.LogisticsCheck.CheckIndexVo;
import com.ht.vo.LogisticsCheck.CheckInsertVo;
import org.hibernate.annotations.Check;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * @author @ZZ12138-zjw
 * @date 2019/12/9 19:40
 */

@Controller
@RequestMapping("/checkinsertcontro")
public class CheckInsertController {

    @Resource
    ICheckInsert iCheckInsertService;

    @RequestMapping("/to_checkinsert")
    public String to_checkinsert(){
        return "checkinsert";
    }

    @RequestMapping("/to_addcheckinsert")
    public String to_addcheckinsert(ModelMap model){
        List list = iCheckInsertService.selectAll();
        model.put("allCheckInsertList",list);
        return "addcheckinsert";
    }

    @ResponseBody
    @RequestMapping("/listcheckinsert")
    public Map listcheckinsert(String page,String limit){
        if (limit==null){
            limit = 5+"";
        }
        List list = iCheckInsertService.listCheckInsert(Integer.parseInt(page),Integer.parseInt(limit));
        int total = iCheckInsertService.selAllCount();
        JSONArray jsonArray = (JSONArray) JSON.toJSON(list);
        Map map = new HashMap();

        System.out.println(jsonArray.toJSONString());

        map.put("count",total);
        map.put("msg","");
        map.put("code",0);
        map.put("data",jsonArray);
        return map;
    }

    @ResponseBody
    @RequestMapping("/addcheckinsert")
    public String addcheckinsert(CheckInsertVo vo){
        System.out.println("保存考核录入");
        List list = iCheckInsertService.selectCheckScore(vo.getCheckContent());
        Map map = (HashMap)list.get(0);
        vo.setCheckScore((Integer)map.get("checkScore"));
        iCheckInsertService.addCheckInsert(vo);
        return "true";
    }

    @ResponseBody
    @RequestMapping("/delcheckinsert")
    public String delcheckinsert(String iD){
        iCheckInsertService.delCheckInsert(iD);
        return "success";
    }

    @RequestMapping("/to_infocheckinsert")
    public String to_editcheckinsert(String iD,ModelMap model){
        //查询出所有考核录入信息
        List list = iCheckInsertService.selectAll();

        //查询出所有部门
        List deptList = iCheckInsertService.selectAllDep();

        /*//查询出所有员工
        List empList = iCheckInsertService.listCheckInsert();*/



        CheckInsertVo vo = iCheckInsertService.selInsertByID(Integer.parseInt(iD));
        vo.setID(Integer.parseInt(iD));
        System.out.println(vo.toString());
        model.put("allCheckIndex",list);
        model.put("checkInsert",vo);
        return "infocheckinsert";
    }

    @ResponseBody
    @RequestMapping("/editcheckinsert")
    public String editcheckinsert(CheckInsertVo vo){
        List list = iCheckInsertService.selectCheckScore(vo.getCheckContent());
        Map map = (HashMap)list.get(0);
        vo.setCheckScore((Integer) map.get("checkScore"));
        System.out.println(vo.toString());
        iCheckInsertService.editCheckInsert(vo);
        return "true";
    }

    @ResponseBody
    @RequestMapping("/alldelcheckinsert")
    public String alldelcheckinsert(String iD[]){
        System.out.println(iD.toString());
        String temp = "";
        for (int i=0;i<iD.length;i++){
            temp+=iD[i]+",";
        }
        String id=temp.substring(0,temp.length()-1);
        iCheckInsertService.delCheckInsert(id);
        return "true";
    }

    @ResponseBody
    @RequestMapping("/getcheckinsertphoto")
    public Map getcheckinsertphoto(){
        Map map = new HashMap();
        Map map2 = new HashMap();
        Map photo = new HashMap();

        List list = new ArrayList();

        map2.put("alt","背景1");
        map2.put("pid",666);
        map2.put("src","http://localhost:8080/images/1.jpg");
        map2.put("thumb","http://localhost:8080/images/1.jpg");

        photo.put("alt","背景2");
        photo.put("pid",666);
        photo.put("src","http://localhost:8080/images/bg.png");
        photo.put("thumb","http://localhost:8080/images/bg.png");

        list.add(map2);
        list.add(photo);
        JSONArray json = (JSONArray) JSON.toJSON(list);

        map.put("title","缩略图");
        map.put("id",123);
        map.put("start",0);
        map.put("data",json);
        return map;
    }
}
