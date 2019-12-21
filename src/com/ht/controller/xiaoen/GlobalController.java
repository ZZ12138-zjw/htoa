package com.ht.controller.xiaoen;

import com.ht.service.shihehua.INoticeService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.service.xiaoen.IGlobalService;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by shkstart on 2019/12/9
 * @author LaiWeiChun
 */
@Controller
public class GlobalController {

    @Autowired
    private IGlobalService global;
    @Resource
    private INoticeService ins;
    @Resource
    private IEmpService emp;

    /**
     * 跳往员工登录页面
     * @return
     */
    @RequestMapping("/to_login")
    public String toLogin(){
        return  "login";
    }


    /**
     * 员工端登录
     * @param session
     * @param phone
     *      登录账号
     * @param password
     *      登录密码
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public String lgoin(HttpSession session,String phone,String password){
        EmpVo empVo=global.login(phone,password);
        if (empVo==null){
            return "failed";
        }
        session.setAttribute("empVo",empVo);
        return  "success";
    }



    /**
     * 员工端退出
     *
     * @param session
     * @return
     */
    @RequestMapping("/sign_out")
    public String sign_out(HttpSession session){
        session.invalidate();
        return "redirect:login.jsp";
    }

    /**
     * 进入员工后台主页面，前提是要先登录
     * @return
     */
    @RequestMapping("/htoa")
    public String htOa(){
        return "index";
    }

    /**
     * 首页
     * @param session
     * @param map
     * @return
     */
    @RequestMapping("/to_welcome")
    public String to_welcome(HttpSession session, Map map){
        EmpVo empVo = (EmpVo) session.getAttribute("empVo");
        map.put("EmpNoticeList",ins.selEmpNoticeList(empVo.getEmpId()));
        return "welcome2";
    }

    /**
     * 一些重复的头文件
     * @return
     */
    @RequestMapping("/to_top")
    public String toTop(){
        return "top";
    }

    /**
     * 进入学生端的后台,前提是要先登录
     * @return
     */
    @RequestMapping("/toStu")
    public String toStu(){
        return  "student_jsp/student_index";
    }

    /**
     * 学生端登录页面
     * @return
     */
    @RequestMapping("/toStuLogin")
    private String toStuLogin(){
        return   "student_jsp/student_login";
    }

    @RequestMapping("/stuLogin")
    @ResponseBody
    public String stuLogin(String phone,String password,HttpSession session){
        StudentVo studentVo = global.stuLogin(phone, password);
        if (studentVo==null){
            return "failed";
        }
        session.setAttribute("studentVo",studentVo);
        return  "success";
    }

    /**
     * 修改密码页面
     * @return
     */
    @RequestMapping("/toCheckOldPwd")
    public String toCheckOldPwd(){
        return "ck_pwd";
    }

    @RequestMapping("/toChangePwd")
    public String toChangePwd(){
        return "change_pwd";
    }
    /**
     * 验证旧密码是否正确
     * @param password
     * @param session
     * @return
     */
    @RequestMapping("/checkOldPwd")
    @ResponseBody
    public String checkOldPwd(String password,HttpSession session){
        EmpVo empVo =(EmpVo)session.getAttribute("empVo");
        EmpVo ckR = emp.ckOldPwd(password, empVo.getEmpId() + "");
        if (ckR!=null){
            return "success";
        }
        return "";
    }

    /**
     * 修改密码
     * @param password
     * @param session
     * @return
     */
    @RequestMapping("/changePwd")
    @ResponseBody
    public String changePwd(String password,HttpSession session){
        System.out.println("测试密码:"+password);
        EmpVo empVo =(EmpVo)session.getAttribute("empVo");
        empVo.setPassword(password);
        global.changPassword(empVo);
        return "success";
    }


    /**
     * 学生端主页
     * @return
     */
    @RequestMapping("/studentWelcome")
    public String toStudentWelcome(){
        return "student_jsp/student_welcome";
    }



}
