package com.ht.controller.shihehua;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.shihehua.INoticeReceiptService;
import com.ht.service.shihehua.INoticeService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.educational.NoticeVo;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 华 on 2019/12/18.
 */
@Controller
@RequestMapping("Stu/notice_student")
public class StudentNoticeController {
    @Resource
    INoticeService ins;
    @Resource
    IEmpService ies;

    @RequestMapping("/to_studentNotice")
    public String to_studentNotice(){
        return "student_jsp/notice_student_list";
    }

    @RequestMapping("/tonoticeType")
    public String tonoticeType(Map map,String noticeId){
        NoticeVo noticeVo = ins.selNotice(Integer.parseInt(noticeId));
        EmpVo empVo = new EmpVo();
        empVo.setEmpId(noticeVo.getEmpid());
        map.put("noticeList",noticeVo);
        map.put("empList",ies.select(empVo));
        return "notice_type";
    }

    @RequestMapping("/StrudentNoticeList")
    @ResponseBody
    public Map StrudentNoticeList(String page, String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",ins.selStudentNoticeCount());
        map.put("data",ins.selStudentNoticePage(Integer.parseInt(page),Integer.parseInt(limit)));
        System.out.println(map.toString());
        return map;
    }

    @RequestMapping("/to_noticeStudentReceipt")
    public String to_noticeStudentReceipt(ModelMap map, String noticeId,String noticeType){
        List list = new ArrayList();
        if (Integer.parseInt(noticeType)==2){
            list = ins.selNoticeReceiptStudentList(Integer.parseInt(noticeId));

        }else{
            list = ins.selNoticeReceiptEmpList(Integer.parseInt(noticeId));
            List list2 = ins.selNoticeReceiptStudentList(Integer.parseInt(noticeId));
            list.addAll(list2);
        }
        JSONArray json = (JSONArray) JSON.toJSON(list);
        map.put("noticeReceiptList",json);
        System.out.println("JSON:"+json.toJSONString());
        return "notice_receipt";
    }

    @RequestMapping("updateStudentType")
    @ResponseBody
    public String StudentNoticeReceiptList(HttpSession session,String noticeId){
        System.out.println("noticeId   "+noticeId);
        StudentVo studentVo = (StudentVo) session.getAttribute("studentVo");
        ins.updateStudentNoticeReceiptType(studentVo.getStuId(),Integer.parseInt(noticeId));
        NoticeVo noticeVo = ins.selNotice(Integer.parseInt(noticeId));
        if (noticeVo.getNoticeType()==2){
            int trueCount = ins.StudentNoticeTrueCount(Integer.parseInt(noticeId));
            int falseCount = ins.StudentNoticeFalseCount(Integer.parseInt(noticeId));
            ins.updateEmpNoticeCount(trueCount,falseCount,Integer.parseInt(noticeId));
        }else if (noticeVo.getNoticeType()==3){
            int trueCount = ins.EmpNoticeTrueCount(Integer.parseInt(noticeId))+ins.StudentNoticeTrueCount(Integer.parseInt(noticeId));
            int falseCount = ins.EmpNoticeFalseCount(Integer.parseInt(noticeId))+ins.StudentNoticeFalseCount(Integer.parseInt(noticeId));
            ins.updateEmpNoticeCount(trueCount,falseCount,Integer.parseInt(noticeId));
        }
        return "success";
    }


}
