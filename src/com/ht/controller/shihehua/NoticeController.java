package com.ht.controller.shihehua;

import com.ht.service.shihehua.INoticeService;
import com.ht.vo.educational.NoticeVo;
import com.ht.vo.employee.EmpVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 华 on 2019/12/12.
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Resource
    INoticeService ins;

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
        EmpVo empVo = (EmpVo) session.getAttribute("empVo");
        noticeVo.setEmpid(empVo.getEmpId());
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String noticeTime = simpleDateFormat.format(date);
        noticeVo.setNoticeTime(noticeTime);
        ins.addNotice(noticeVo);

        return "success";
    }
}
