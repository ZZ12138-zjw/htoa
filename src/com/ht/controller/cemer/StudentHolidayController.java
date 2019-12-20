package com.ht.controller.cemer;

import com.ht.service.cemer.StudentHolidayService;
import com.ht.util.DateHelper;
import com.ht.vo.student.StudentVo;
import com.ht.vo.student.holidayStudentVo;
import org.activiti.engine.*;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/stuHoliday")
public class StudentHolidayController {
    @Resource
    private ProcessEngine processEngine;
    @Resource
    private TaskService taskService;
    @Resource
    private RuntimeService runtimeService;
    @Resource
    private HistoryService historyService;
    @Resource
    private RepositoryService repositoryService;
    @Resource
    private StudentHolidayService holidayService;

    //我的请假信息
    @RequestMapping("/to_holidayList")
    public String toHolidayPage(){
        return "student_holiday/studentHoliday_list";
    }
    @RequestMapping("/holidayList")
    @ResponseBody
    public Map holidayList(String page, String limit, HttpSession session){
        StudentVo student = (StudentVo)session.getAttribute("studentVo");
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",holidayService.holidayCount(student.getStuId()));
        map.put("data",holidayService.selectStuHolidayById(student.getStuId(),Integer.parseInt(page),Integer.parseInt(limit)));
        return map;
    }
    //请假申请
    @RequestMapping("/to_holidayAdd")
    public String to_holidayAdd(){
        return "student_holiday/holiday_add";
    }

    @RequestMapping("/holidayAdd")
    @ResponseBody
    public String holidayAdd(holidayStudentVo holidayStudentVo,String s,String e,HttpSession session){
        StudentVo studentVo = (StudentVo)session.getAttribute("studentVo");

        holidayStudentVo.setStatus("审批中");
        holidayStudentVo.setStudentId(studentVo.getStuId());
        holidayStudentVo.setStartTime(DateHelper.parseString(s,"yyyy-MM-dd"));
        holidayStudentVo.setEndTime(DateHelper.parseString(e,"yyyy-MM-dd"));
        int dateDiff = DateHelper.getDateDiff(holidayStudentVo.getStartTime(), holidayStudentVo.getEndTime());
        holidayStudentVo.setHolidayDay(Math.abs(dateDiff));

        holidayService.saveHoliday(holidayStudentVo);

        //设置流程实例变量集合
        Map map=new HashMap();
        //用户id
        map.put("stuId",studentVo.getStuId());
        //天数
        map.put("day",holidayStudentVo.getHolidayDay());
        //单据id
        System.out.println("单据id："+holidayStudentVo.getHolidayId());
        map.put("hid",holidayStudentVo.getHolidayId());
        map.put("assignee",holidayStudentVo.getStudentId());

        //启动流程实例(通过流程定义的key来启动一个实例)
        ProcessInstance startProcess = runtimeService.startProcessInstanceByKey("stuLeave",map);
        //根据流程实例id获取当前实例正在执行的任务
        Task singleResult = taskService.createTaskQuery().processInstanceId(startProcess.getId()).orderByProcessInstanceId().desc().singleResult();

        //动态执行人
        Map amap = new HashMap();
        amap.put("assignee2",holidayService.selectEmpByStuId(studentVo.getStuId()));
        //完成任务
        taskService.complete(singleResult.getId(),amap);
        return "success";
    }

}
