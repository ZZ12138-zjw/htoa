package com.ht.controller;

import com.ht.service.shihehua.INoticeService;
import com.ht.vo.employee.EmpVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by shkstart on 2019/12/3
 * @author LaIWeiChun
 */
@Controller
public class TestController {
    @Resource
    INoticeService ins;

    @RequestMapping("/test")
    public String test(){
        System.out.println("我进来了");
        return "index";
    }

    @RequestMapping("/to_welcome")
    public String to_welcome(HttpSession session,Map map){
        EmpVo empVo = (EmpVo) session.getAttribute("empVo");
        map.put("EmpNoticeList",ins.selEmpNoticeList(empVo.getEmpId()));
        return "welcome2";
    }

    @RequestMapping("/to_top")
    public String toTop(){
        return "top";
    }




}
