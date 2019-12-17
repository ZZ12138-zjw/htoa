package com.ht.controller.shihehua;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.ht.service.cemer.StudentService;
import com.ht.service.shihehua.INoticeReceiptService;
import com.ht.service.shihehua.INoticeService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.educational.NoticeVo;
import com.ht.vo.educational.Notice_ReceiptVo;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 华 on 2019/12/12.
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Resource
    INoticeService ins;
    @Resource
    INoticeReceiptService inr;
    @Resource
    IEmpService ies;


    @RequestMapping("/tonotice_list")
    public String tonotice_list(){
        return "notice_list";
    }

    @RequestMapping("/tonotice_add")
    public String tonotice_add(){
        return "notice_add";
    }

    @RequestMapping("/notice_add")
    @ResponseBody
    public String notice_add(HttpSession session, NoticeVo noticeVo,String noticeType){
        //noticeTime==1 选择发送通知的群体为全体员工
        //noticeTime==2 选择发送通知的群体为全体学生
        //noticeTime==3 选择发送通知的群体为全体员工和全体学生
        if (Integer.parseInt(noticeType)==1){
            EmpVo empVo = (EmpVo) session.getAttribute("empVo");
            noticeVo.setEmpid(empVo.getEmpId());
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String noticeTime = simpleDateFormat.format(date);
            noticeVo.setNoticeTime(noticeTime);
            noticeVo.setTrueConut(0);
            noticeVo.setFalseCount(ies.selectCount());
            ins.addNotice(noticeVo);


            List<EmpVo> empVoListe = ies.selectAll();
            for (EmpVo e:empVoListe){
                if (e.getEmpId()==noticeVo.getEmpid()){
                    continue;
                }
                Notice_ReceiptVo notice_receiptVo = new Notice_ReceiptVo();
                notice_receiptVo.setNoticeId(noticeVo.getNoticeId());
                notice_receiptVo.setReceiver(e.getEmpId());
                notice_receiptVo.setIsRead(2);//1/已读，2/未读
                notice_receiptVo.setType(1);//类型为员工
                inr.addNoticeReceipt(notice_receiptVo);
            }


        }else if(Integer.parseInt(noticeType)==2){
            EmpVo empVo = (EmpVo) session.getAttribute("empVo");
            noticeVo.setEmpid(empVo.getEmpId());
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String noticeTime = simpleDateFormat.format(date);
            noticeVo.setNoticeTime(noticeTime);
            noticeVo.setTrueConut(0);
            noticeVo.setFalseCount(ins.StudentCount());
            ins.addNotice(noticeVo);

            List<StudentVo> studentVoList = ins.StudentList();
            for(StudentVo st:studentVoList){
                Notice_ReceiptVo notice_receiptVo = new Notice_ReceiptVo();
                notice_receiptVo.setNoticeId(noticeVo.getNoticeId());
                notice_receiptVo.setReceiver(st.getStuId());
                notice_receiptVo.setIsRead(2);//1/已读，2/未读
                notice_receiptVo.setType(2);//类型为学生
                inr.addNoticeReceipt(notice_receiptVo);
            }

        }else if(Integer.parseInt(noticeType)==3){
            EmpVo empVo = (EmpVo) session.getAttribute("empVo");
            noticeVo.setEmpid(empVo.getEmpId());
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String noticeTime = simpleDateFormat.format(date);
            noticeVo.setNoticeTime(noticeTime);
            noticeVo.setTrueConut(0);
            noticeVo.setFalseCount(ins.StudentCount()+ies.selectCount());
            ins.addNotice(noticeVo);


            List<EmpVo> empVoListe = ies.selectAll();
            for (EmpVo e:empVoListe){
                if (e.getEmpId()==noticeVo.getEmpid()){
                    continue;
                }
                Notice_ReceiptVo notice_receiptVo = new Notice_ReceiptVo();
                notice_receiptVo.setNoticeId(noticeVo.getNoticeId());
                notice_receiptVo.setReceiver(e.getEmpId());
                notice_receiptVo.setIsRead(2);//1/已读，2/未读
                notice_receiptVo.setType(3);//类型为全体
                inr.addNoticeReceipt(notice_receiptVo);
            }
            List<StudentVo> studentVoList = ins.StudentList();
            for(StudentVo st:studentVoList){
                Notice_ReceiptVo notice_receiptVo = new Notice_ReceiptVo();
                notice_receiptVo.setNoticeId(noticeVo.getNoticeId());
                notice_receiptVo.setReceiver(st.getStuId());
                notice_receiptVo.setIsRead(2);//1/已读，2/未读
                notice_receiptVo.setType(3);//类型为全体
                inr.addNoticeReceipt(notice_receiptVo);
            }

        }
        return "success";
    }

    @RequestMapping("/to_noticeupdate")
    public String to_noticeupdate(Map map,String noticeId){
        map.put("noticeList",ins.selNotice(Integer.parseInt(noticeId)));
        return "notice_update";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(NoticeVo noticeVo){
        ins.NoticeUpdate(noticeVo);
        return "success";
    }

    @RequestMapping("/EmpNoticeList")
    @ResponseBody
    public Map noticeList(String page,String limit){
        System.out.println("       "+page+"      "+limit);
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",ins.selEmpNoticeCount());
        map.put("data",ins.selEmpNoticePage(Integer.parseInt(page),Integer.parseInt(limit)));
        System.out.println(map);
        return map;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(String noticeId){
        ins.delNotice(Integer.parseInt(noticeId));
        return "success";
    }

    @RequestMapping("/deteles")
    @ResponseBody
    public String deletes(String[] noticeId){
        String ids = "";
        for(int i=0;i<noticeId.length;i++){
            ids+=noticeId[i]+",";
        }
        ids=ids.substring(0,ids.length()-1);
        ins.delNotices(ids);
        return "success";
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

    @RequestMapping("/to_noticeReceipt")
    public String to_noticeReceipt(ModelMap map, String noticeId){
        List list = ins.selNoticeReceiptEmpList(Integer.parseInt(noticeId));
        JSONArray json = (JSONArray) JSON.toJSON(list);
        map.put("noticeReceiptList",json);
        System.out.println("JSON:"+json.toJSONString());
        return "notice_receipt";
    }

    @RequestMapping("updateType")
    @ResponseBody
    public String EmpNoticeReceiptList(HttpSession session,String noticeId){
        System.out.println("noticeId   "+noticeId);
        EmpVo empVo = (EmpVo) session.getAttribute("empVo");
        ins.updateEmpNoticeReceiptType(empVo.getEmpId(),Integer.parseInt(noticeId));
        int trueCount = ins.EmpNoticeTrueCount(Integer.parseInt(noticeId));
        int falseCount = ins.EmpNoticeFalseCount(Integer.parseInt(noticeId));
        ins.updateEmpNoticeCount(trueCount,falseCount,Integer.parseInt(noticeId));
        return "success";
    }

}
