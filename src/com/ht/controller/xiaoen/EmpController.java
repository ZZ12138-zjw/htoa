package com.ht.controller.xiaoen;

import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.employee.EmpCkBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by shkstart on 2019/12/5
 * @author LaiWeiChun
 */
@Controller
@RequestMapping("/emp")

public class EmpController {

    @Autowired
    private IEmpService emp;


    @RequestMapping("/to_emplist")
    public String toEmpList(){
        return "emp_list";
    }

    @RequestMapping("/empList")
    @ResponseBody
    public Map empList(int page, int limit, EmpCkBean empCk){
        System.out.println(empCk.toString());
        Map map=new HashMap();
       /* JSONArray jsonArray= (JSONArray)JSON.toJSON(emp.selectAll());*/
        map.put("code",0);
        map.put("msg","");
        map.put("count",emp.selectCount());
        map.put("data",emp.selectPage(page,limit));
        return map;
    }






}
