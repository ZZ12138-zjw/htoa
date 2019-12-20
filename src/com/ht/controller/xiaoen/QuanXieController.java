package com.ht.controller.xiaoen;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.xiaoen.IGroupManagerService;
import com.ht.service.xiaoen.IModuleService;
import com.ht.util.DateHelper;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.GroupManagerVo;
import com.ht.vo.employee.ModuleVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 权限管理控制器
 * Created by shkstart on 2019/12/18
 * @author LaIWeiChun
 */
@Controller
@RequestMapping("/quanXie")
public class QuanXieController {


    @Resource
    private IModuleService module;
    @Resource
    private IGroupManagerService groupManager;

    @RequestMapping("/to_roleList")
    public String toRoleList(){
        return "role_list";
    }

    @RequestMapping("/roleList")
    @ResponseBody
    public Map roleList(int page,int limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",groupManager.selectCount());
        map.put("data",groupManager.selectPage(page,limit));
        return  map;
    }

    @RequestMapping("/to_roleAdd")
    public String toRoleAdd(){
        return  "role_add";
    }

    @RequestMapping("/roleAdd")
    @ResponseBody
    public String roleAdd(GroupManagerVo groupManagerVo, HttpSession session){
        //员工登录信息
        EmpVo empVo=(EmpVo)session.getAttribute("empVo");

        //创建者id
        groupManagerVo.setEmpId(empVo.getEmpId());
        groupManagerVo.setEmpName(empVo.getEmpName());
        //创建时间
        groupManagerVo.setCreateTime(DateHelper.formatDateTime(new Date()));
        //新增
        groupManager.save(groupManagerVo);
        return "succ";
    }

    @RequestMapping("/roleDle")
    @ResponseBody
    public String roleDle(GroupManagerVo groupManagerVo){
        //删除
        groupManager.delete(groupManagerVo);
        return  "succ";
    }

    /**
     * 权限编辑页面
     * @return
     */
    @RequestMapping("/toModuleEdit")
    public String toModuleEdit(){
        return "module_edit";
    }


    @RequestMapping("/moduleList")
    @ResponseBody
    public JSONArray moduleList(){


        JSONArray jsonArray=new JSONArray();

        Map map=new HashMap();
        map.put("title","角色权限");
        map.put("id",1);


        List<ModuleVo> fatModu = module.selectAll(0);
        JSONArray fatJsonArray=new JSONArray();
        for (ModuleVo fm:fatModu){
            JSONArray cJsonArray=new JSONArray();
            Map fmap=new HashMap();
            fmap.put("title",fm.getModuleName());
            fmap.put("id",fm.getController());

            //根据父节点id去查询子节点
            List<ModuleVo> cModu = module.selectAll(fm.getModuleId());
            for (ModuleVo cm:cModu){
                Map cmap=new HashMap();
                cmap.put("title",cm.getModuleName());
                cmap.put("id",cm.getController());
                cJsonArray.add(cmap);
            }
            fmap.put("children",cJsonArray);
            fatJsonArray.add(fmap);


        }


        map.put("children",fatJsonArray);

        jsonArray.add(map);

        System.out.println("测试："+jsonArray.toString());
        return jsonArray;
    }



}

