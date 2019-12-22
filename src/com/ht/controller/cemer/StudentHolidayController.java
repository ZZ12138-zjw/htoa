package com.ht.controller.cemer;

import com.ht.service.cemer.StudentHolidayService;
import com.ht.service.cemer.StudentService;
import com.ht.service.xiaoen.IDeptService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.util.DateHelper;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.HolidayVo;
import com.ht.vo.student.StudentVo;
import com.ht.vo.student.holidayStudentVo;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
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

    @Resource
    private StudentService student;
    @Resource
    private IDeptService dept;
    @Resource
    private IEmpService emp;


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
        map.put("data",holidayService.selectStuHolidayById(student.getStuId(),Integer.parseInt(page),Integer.parseInt(limit)));
        map.put("count",holidayService.selectStuHolidayById(student.getStuId(),Integer.parseInt(page),Integer.parseInt(limit)).size());
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

        //测试打印
        System.out.println(holidayStudentVo.toString());
        holidayService.saveHoliday(holidayStudentVo);

        //设置流程实例变量集合
        Map map=new HashMap();
        //用户id
        System.out.println("用户id"+studentVo.getStuId());
        map.put("stuId",studentVo.getStuId());
        //天数
        map.put("day",holidayStudentVo.getHolidayDay());
        System.out.println("stuHid"+holidayStudentVo.getHolidayId());
        map.put("stuHid",holidayStudentVo.getHolidayId());

        //启动流程实例(通过流程定义的key来启动一个实例)
        ProcessInstance startProcess = runtimeService.startProcessInstanceByKey("stuLeave",map);
        //根据流程实例id获取当前实例正在执行的任务
        Task singleResult = taskService.createTaskQuery().processInstanceId(startProcess.getId()).orderByProcessInstanceId().desc().singleResult();


        //动态执行人
        Map amap = new HashMap();
        //查询这个请假学生的任课老师
        System.out.println("任课老师id"+holidayService.selectEmpByStuId(studentVo.getStuId()));
        amap.put("assignee",holidayService.selectEmpByStuId(studentVo.getStuId()));
        //完成任务
        taskService.complete(singleResult.getId(),amap);
        return "success";
    }


    /**
     * 查看批注 我的批注
     * @param hid
     * @param map
     * @return
     */
    @RequestMapping("/lookComment")
    public String lookComment(String hid,Map map){
        //通过jobId查询历史变量对象
        HistoricVariableInstance singleResult = historyService.createHistoricVariableInstanceQuery().variableValueEquals("stuHid",Integer.parseInt(hid)).singleResult();
        //获取流程实例id (查看实例批注)
        List<Comment> commentList = taskService.getProcessInstanceComments(singleResult.getProcessInstanceId());
        List list=new ArrayList();
        for(Comment comment:commentList){
            Map dataMap=new HashMap();
            EmpVo empVo=new EmpVo();
            empVo.setEmpId(Integer.parseInt(comment.getUserId()));
            EmpVo e = emp.select(empVo);
            dataMap.put("fullMessage",comment.getFullMessage());
            dataMap.put("time",comment.getTime());
            dataMap.put("stuName",e.getEmpName());
            list.add(dataMap);
        }
        map.put("commentList",list);
        return "student_jsp/student_comment_list";
    }


    /**
     * 查询学生的请假记录
     * @return
     */
    @RequestMapping("/myTaskList")
    public String myTaskList(HttpSession session, ModelMap model){
        EmpVo empVo = (EmpVo)session.getAttribute("empVo");
        //任务集合
        List<Task> list = taskService.createTaskQuery().taskAssignee(empVo.getEmpId()+ "").list();
        //存单据集合
        List holidays=new ArrayList();
        for (Task task:list){
            System.out.println("任务id"+task.getId());
            Object hid = taskService.getVariable(task.getId(), "stuHid");
            Map map= (HashMap)holidayService.selectStuHolidayByHid((int) hid).get(0);
            map.put("taskId",task.getId());
            holidays.add(map);
        }
        model.put("holidayList",holidays);
        return "student_holiday/studentMyTask_list";
    }


    @RequestMapping("/to_empLeaveAdult")
    public String toEmpLeaveAdult(String taskId,String hid,Map map){
        map.put("taskId",taskId);
        List list = holidayService.selectStuHolidayByHid(Integer.parseInt(hid));
        map.put("holiday",list.get(0));
        return  "student_holiday/studentLeave_adult";
    }

    /**
     * 审批任务
     * @param hid
     *      单据id
     * @param taskId
     *      任务id
     * @param flow
     *      审批结果
     * @param remark
     *      审批说明
     * @param session
     * @return
     */
    @RequestMapping("/complete")
    @ResponseBody
    public String complete(String hid,String taskId,String flow,String remark,HttpSession session){
        //根据任务id获取任务对象
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();

        //根据任务对象获取流程实例
        String processInstanceId = task.getProcessInstanceId();

        //单据id查询单据对象
        holidayStudentVo holiday = holidayService.select(Integer.parseInt(hid));

        //获取用户名称
        EmpVo empVo=(EmpVo)session.getAttribute("empVo");
        //设置当前任务办理人(备注表)
        Authentication.setAuthenticatedUserId(empVo.getEmpId()+"");
        //设置备注信息，(任务id，实例id，页面上的备注)
        taskService.addComment(taskId,processInstanceId,remark);

        //查询请假的天数
        int day =(int)taskService.getVariable(taskId, "day");

        System.out.println("查询出来的天数 "+day);
        Map variable=new HashMap();
        if (flow.equals("同意") && task.getName().equals("任课老师审批")){
            //如果任课老师同意，就设下一节点负责人
            variable.put("flow",flow);
            variable.put("assignee",holidayService.selectEmpByStuId2(holiday.getStudentId()));
        }else if (flow.equals("同意") && day>=2){
            //如果班主任同意，且天数大于两天。则需要校长审批
            variable.put("flow",flow);
            //查询班主任的部门负责人，就能找到上上级负责人(校长)
            EmpVo e=new EmpVo();
            e.setEmpId(holidayService.selectEmpByStuId2(holiday.getStudentId()));
            variable.put("assignee", dept.selectChairman(emp.select(e).getDeptId()));
        }else {
            variable.put("flow",flow);
        }

        //完成当前任务
        taskService.complete(taskId,variable);
        //根据流程实例获取实例对象(完成流程的实例依然会存在数据库中 但是查询出来是null的)
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        //改变单据状态
        if (processInstance==null && "同意".equals(flow)){
            holiday.setStatus("已完成");
        }else if (processInstance==null && "不同意".equals(flow)) {
            holiday.setStatus("不同意");
        }
        holidayService.update(holiday);
        return  "success";

    }



}
