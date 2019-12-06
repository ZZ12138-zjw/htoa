package com.ht.controller.xiaoen;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.service.xiaoen.IDeptService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.employee.DeptVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by shkstart on 2019/12/4
 * @author LaIWeiChun
 */
@Controller
@RequestMapping("/dept")
public class DeptController{

    @Autowired
    private IDeptService dept;

    @Autowired
    private IEmpService emp;

    @RequestMapping("/depList")
    @ResponseBody
    public Map depList(String page,  String limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",dept.selectCount());
        JSONArray jsonArray=(JSONArray)JSON.toJSON(dept.selectPage(Integer.parseInt(page),Integer.parseInt(limit)));
        map.put("data",jsonArray);
        return map;
    }


    @RequestMapping("/to_depList")
    public String to_depList(){
        return "dept_list";
    }

    @RequestMapping("/to_deptAdd")
    public String toDpetAdd(Map map){
        map.put("empList",emp.selectAll());
        return "dept_add";
    }


    @RequestMapping("/add")
    @ResponseBody
    public String add(DeptVo deptVo){
        dept.save(deptVo);
        return "success";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(DeptVo deptVo){
        dept.delete(deptVo);
        return "success";
    }

    @RequestMapping("/deletes")
    @ResponseBody
    public String deletes(DeptVo[] deptVos) {

        String tempDepIds="";
        for (int i=0;i<deptVos.length;i++){
            DeptVo d=deptVos[i];
            tempDepIds+=d.getDepid()+",";
        }
        String dpeIds=tempDepIds.substring(0,tempDepIds.length()-1);
        System.out.println(dpeIds);
        dept.delAll(dpeIds);
        return "success";
    }

    @RequestMapping("/to_deptUpdate")
    public String to_deptUpdate(Map map,String depId){
        DeptVo deptVo=dept.select(Integer.parseInt(depId));
        map.put("deptVo",deptVo);
        map.put("empList",emp.selectAll());
        return "dept_update";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(DeptVo deptVo){
        dept.update(deptVo);
        return  "success";
    }











}
