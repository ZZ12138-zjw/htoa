package com.ht.controller.xiaoen;

import com.alibaba.fastjson.JSONObject;
import com.ht.service.xiaoen.IDeptService;
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

    @RequestMapping("/dept_list")
    public String  toDeptList(Map map, String currPage, HttpServletResponse response) throws IOException {
        if (currPage==null || "".equals(currPage)){
            currPage="1";
        }
        List deptList = dept.selectPage(Integer.parseInt(currPage),10);
        map.put("deptCount",dept.selectCount());
        map.put("deptList",deptList);
        map.put("currPage",currPage);
        return "dept_list";
    }

    @RequestMapping("/to_dept_add")
    public String toDpetAdd(){
        return "dept_add";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(DeptVo deptVo){
        dept.save(deptVo);
        return "success";
    }


}
