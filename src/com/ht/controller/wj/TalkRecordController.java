package com.ht.controller.wj;

import com.ht.service.cemer.StudentService;
import com.ht.service.wj.TalkRecordService;
import com.ht.vo.employee.ChatRecordVo;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/talk")
public class TalkRecordController {
    @Resource
    private TalkRecordService talkRecordService;
    @Resource
    private StudentService studentService;

    @RequestMapping("/talkpage")
    public String talkpage(){
        return "talkRecord";
    }

    @RequestMapping("/talkList")
    @ResponseBody
    public Map talkList(String page, String limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",talkRecordService.selCount());
        map.put("data",talkRecordService.talkList(Integer.parseInt(page),Integer.parseInt(limit)));
        System.out.println(map.toString());
        return map;
    }

    @RequestMapping("/addTalkRecord")
    public String addTalkRecord(HttpServletRequest request){
        List stulist = studentService.getStudentInfo();
        request.setAttribute("stulist",stulist);
        return "addTalkRecord";
    }

    @ResponseBody
    @RequestMapping("/toaddTalk")
    public String toaddTalk(ChatRecordVo chatRecordVo, HttpSession session){
        EmpVo empVo = (EmpVo) session.getAttribute("empVo");
        int empid = empVo.getEmpId();
        chatRecordVo.setTeacher(empid);
        chatRecordVo.setChatDate(new Date());
        talkRecordService.addTalk(chatRecordVo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public boolean delete(ChatRecordVo chatRecordVo){
        talkRecordService.delete(chatRecordVo);
        return true;
    }

    @ResponseBody
    @RequestMapping("/deletes")
    public String deletes(String[] id){
        System.out.println("删除");
        String docIds = "";
        for (int i=0;i<id.length;i++){
            docIds+=id[i]+",";
        }
        String docid = docIds.substring(0,docIds.length()-1);
        talkRecordService.deletes(docid);
        return "success";
    }
}
