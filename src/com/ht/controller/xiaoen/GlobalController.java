package com.ht.controller.xiaoen;

import com.ht.service.xiaoen.IGlobalService;
import com.ht.vo.employee.EmpVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by shkstart on 2019/12/9
 * @author LaiWeiChun
 */
@Controller
public class GlobalController {


    @Autowired
    private IGlobalService global;

    @RequestMapping("/to_login")
    public String toLogin(){
        return  "login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public String lgoin(HttpSession session,String phone,String password){
        System.out.println(" "+password+"  "+phone);
        EmpVo empVo=global.login(phone,password);
        System.out.println("empVo "+empVo==null);
        if (empVo==null){
            return "failed";
        }
        session.setAttribute("empVo",empVo);
        return  "success";
    }

    @RequestMapping("/sign_out")
    public String sign_out(HttpSession session){
        session.invalidate();
        return "redirect:login.jsp";
    }




}
