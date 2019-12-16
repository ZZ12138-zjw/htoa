package com.ht.controller.cemer;

import com.ht.service.cemer.OtherService;
import com.ht.service.cemer.StudentService;
import com.ht.vo.student.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@RequestMapping("/other")
@Controller
public class OtherController {
    @Resource
    OtherService otherService;
    @Resource
    StudentService studentService;

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
    public String updateStuEdu(StudentEduVo studentEduVo,String time1,String time2){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startTime = new Date();
        Date endTime = new Date();
        try {
            startTime = sdf.parse(time1);
            endTime = sdf.parse(time2);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        studentEduVo.setBegindate(startTime);
        studentEduVo.setEnddate(endTime);
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
        request.setAttribute("emps",this.studentService.selectAllEmp());
        return "studentHapUpdate";
    }
    @RequestMapping("stuHap/update")
    @ResponseBody
    public String updateStuHap(StudentHappeningVo studentHappeningVo,String time){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date optime = new Date();
        try {
            optime = sdf.parse(time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        studentHappeningVo.setOptime(optime);
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
        request.setAttribute("emps",this.studentService.selectAllEmp());
        request.setAttribute("reScores",this.studentService.selectAllReplyScore());
        return "studentReplyScoreUpdate";
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
        StudentScoreVo studentScoreVo = otherService.getStuScore(scoreId);
        String time = studentScoreVo.getScoreTime()+"";
        String time1 = time.substring(0,time.indexOf(" ")-1);
        System.out.println(time1);
        String time2 = time.substring(time.indexOf(" ")+1,time.length()-2);
        System.out.println(time2);
        request.setAttribute("time1",time1);
        request.setAttribute("time2",time2);
        request.setAttribute("score",studentScoreVo);
        request.setAttribute("terms",this.studentService.selectAllTerm());
        request.setAttribute("types",this.studentService.selectAllTestType());
        request.setAttribute("courses",this.studentService.selectAllCourse());
        request.setAttribute("emps",this.studentService.selectAllEmp());
        return "scoreUpdate";
    }

    @RequestMapping(value = "score/update")
    @ResponseBody
    public String updateScore(StudentScoreVo studentScoreVo,String time1,String time2){
        System.out.println(studentScoreVo.toString());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date time = new Date();
        try {
            time = sdf.parse(time1+" "+time2);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        studentScoreVo.setScoreTime(time);
        otherService.updateStuScore(studentScoreVo);
        return "success";
    }

    @RequestMapping(value = "score/del")
    @ResponseBody
    public String delStuScore(int scoreId){
        otherService.delReScore(otherService.getReScoreById(scoreId));
        return "success";
    }
}
