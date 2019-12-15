package com.ht.controller.cemer;

import com.ht.service.cemer.OtherService;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@RequestMapping("/other")
@Controller
public class OtherController {
    @Resource
    OtherService otherService;

    @RequestMapping(value = "stuFal/toUpdate")
    public String toStuFalUpdatePage(int familyid, HttpServletRequest request){
        request.setAttribute("stuFal",otherService.getStuFalById(familyid));
        return "studentFalUpdate";
    }

    @RequestMapping("stuFal/update")
    @ResponseBody
    public String updateStuFal(StudentFamily studentFamily){
        otherService.updateStuFal(studentFamily);
        return "success";
    }

    @RequestMapping("stuFal/del")
    @ResponseBody
    public String delStuFal(int familyid){
        otherService.delStuFal(otherService.getStuFalById(familyid));
        return "success";
    }

    @RequestMapping("stuEdu/toUpdate")
    public String toStuEduUpdatePage(int Eduid,HttpServletRequest request){
        request.setAttribute("stuEdu",otherService.getStuEduById(Eduid));
        return "studentEduUpdate";
    }

    @RequestMapping("stuEdu/update")
    @ResponseBody
    public String updateStuEdu(StudentEduVo studentEduVo){
        otherService.updateStuEdu(studentEduVo);
        return "success";
    }
    @RequestMapping("stuEdu/del")
    @ResponseBody
    public String delStuEdu(int Eduid){
        otherService.delStuEdu(otherService.getStuEduById(Eduid));
        return "success";
    }

    @RequestMapping(value = "stuHap/toUpdate")
    public String toStuHapUpdatePage(int happenid,HttpServletRequest request){
        request.setAttribute("stuHap",otherService.getStuHapById(happenid));
        return "studentHapUpdate";
    }
    @RequestMapping("stuHap/update")
    @ResponseBody
    public String updateStuHap(StudentHappeningVo studentHappeningVo){
        otherService.updateStuHap(studentHappeningVo);
        return "success";
    }

    @RequestMapping(value = "stuHap/del")
    @ResponseBody
    public String delStuHap(int happenid){
        otherService.delStuHap(otherService.getStuHapById(happenid));
        return "success";
    }

    @RequestMapping("holiday/toUpdate")
    public String toHolidayUpdatePage(int holidayId,HttpServletRequest request){
        request.setAttribute("holiday",otherService.getHolidayById(holidayId));
        return "studentHolidayUpdate";
    }

    @RequestMapping("holiday/update")
    @ResponseBody
    public String updateHoliday(holidayStudentVo holidayStudentVo){
        otherService.updateHoliday(holidayStudentVo);
        return "success";
    }

    @RequestMapping("holiday/del")
    @ResponseBody
    public String delHoliday(int holidayId){
        otherService.delHoliday(otherService.getHolidayById(holidayId));
        return "success";
    }

    @RequestMapping(value = "replyScore/toUpdate")
    public String toReplyScoreUpdatePage(int replyId,HttpServletRequest request){
        request.setAttribute("replyScore",otherService.getReScoreById(replyId));
        return "studentReScoreUpdate";
    }

    @RequestMapping("replyScore/update")
    @ResponseBody
    public String updateReScore(StudentReplyScoreVo studentReplyScoreVo){
        otherService.updateReScore(studentReplyScoreVo);
        return "success";
    }

    @RequestMapping(value = "replyScore/del")
    @ResponseBody
    public String delReScore(int replyId){
        otherService.delReScore(otherService.getReScoreById(replyId));
        return "success";
    }

    @RequestMapping(value = "score/toUpdate")
    public String toScoreUpdatePage(int scoreId,HttpServletRequest request){
        request.setAttribute("score",otherService.getReScoreById(scoreId));
        return "scoreUpdate";
    }
}
