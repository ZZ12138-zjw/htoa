package com.ht.controller.shihehua;

import com.ht.service.shihehua.INoticeReceiptService;
import com.ht.service.shihehua.INoticeService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.vo.educational.NoticeVo;
import com.ht.vo.educational.Notice_ReceiptVo;
import com.ht.vo.employee.EmpVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
    public String notice_add(HttpSession session, NoticeVo noticeVo){
        noticeVo.setEmpid(1);
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String noticeTime = simpleDateFormat.format(date);
        noticeVo.setNoticeTime(noticeTime);
        ins.addNotice(noticeVo);
        //noticeTime==1 选择发送通知的群体为全体员工
        //noticeTime==2 选择发送通知的群体为全体学生
        //noticeTime==3 选择发送通知的群体为全体员工和全体学生
        if (noticeVo.getNoticeType()==1){
            List<NoticeVo> noticeVoList = ins.NoticeIdList(noticeVo.getTitle());
            for (NoticeVo nt:noticeVoList){
                int noticeid = nt.getNoticeId();
                int empid = nt.getEmpid();
                List<EmpVo> empVoListe = ies.selectAll();
                for (EmpVo e:empVoListe){
                    if (e.getEmpId()==empid){
                        continue;
                    }else{
                        Notice_ReceiptVo notice_receiptVo = new Notice_ReceiptVo();
                        notice_receiptVo.setNoticeId(noticeid);
                        notice_receiptVo.setReceiver(e.getEmpId());
                        notice_receiptVo.setIsRead(2);
                        inr.addNoticeReceipt(notice_receiptVo);
                    }
                }
            }
        }else if(noticeVo.getNoticeType()==2){
            List<NoticeVo> noticeVoList = ins.NoticeIdList(noticeVo.getTitle());

        }
        return "success";
    }
}
