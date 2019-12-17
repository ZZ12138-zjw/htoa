package com.ht.controller.zz12138;

import aj.org.objectweb.asm.Handle;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.xiaoen.IDeptService;
import com.ht.service.xiaoen.IEmpService;
import com.ht.service.xiaoen.IHolidayService;
import com.ht.service.xiaoen.IJobService;
import com.ht.util.DateHelper;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.HolidayVo;
import org.activiti.engine.HistoryService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by shkstart on 2019/12/16
 * @author LaiWeiChun
 */
@Controller
@RequestMapping("/empLeave")
public class EmpLeaveController {

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
    private IJobService jobService;
    @Resource
    private IHolidayService holidayService;
    @Resource
    private IDeptService deptService;
    @Resource
    private IEmpService empService;

    @RequestMapping("/to_holidayList")
    public String to_holidayList(){
        return "holiday_list";
    }

    @RequestMapping("/holidayList")
    @ResponseBody
    public Map holidayList(String page, String limit, HttpSession session){
        EmpVo empVo=(EmpVo)session.getAttribute("empVo");
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",holidayService.selectCount());
        map.put("data",holidayService.selectPage(Integer.parseInt(page),Integer.parseInt(limit),empVo.getEmpId()));
        return map;
    }

    @RequestMapping("/to_holidayAdd")
    public String to_holidayAdd(){
        return "holiday_add";
    }

    @RequestMapping("/holidayAdd")
    @ResponseBody
    public String holidayAdd(HolidayVo holidayVo,String s,String e,HttpSession session){

        EmpVo empVo=(EmpVo)session.getAttribute("empVo");
        //设置状态 1：审批中 2：已完成 3:不批准
        holidayVo.setStatus(1);
        holidayVo.setEmpid(empVo.getEmpId());
        holidayVo.setStartTime(DateHelper.parseString(s,"yyyy-MM-dd"));
        holidayVo.setEndTime(DateHelper.parseString(e,"yyyy-MM-dd"));
        int dateDiff = DateHelper.getDateDiff(holidayVo.getStartTime(), holidayVo.getEndTime());
        holidayVo.setHolidayDay((Float.parseFloat(Math.abs(dateDiff)+"")));

        holidayService.save(holidayVo);

        //设置流程实例变量集合
        Map map=new HashMap();
        //用户id
        map.put("userId",empVo.getEmpName());
        //天数
        map.put("day",holidayVo.getHolidayDay());
        //单据id
        map.put("jobId",holidayVo.getHolidayid());
        map.put("assignee",empVo.getEmpName());

        //启动流程实例(通过流程定义的key来启动一个实例)
        ProcessInstance startProcess = runtimeService.startProcessInstanceByKey("empLeave",map);

        //根据流程实例id获取当前实例正在执行的任务
        Task singleResult = taskService.createTaskQuery().processInstanceId(startProcess.getId()).orderByProcessInstanceId().desc().singleResult();

        //动态执行人
        Map amap=new HashMap();
        amap.put("assignee2",deptService.selectChairman(empVo.getDeptId()));

        //完成任务(通过任务id完成任务)
        taskService.complete(singleResult.getId(),amap);

        return "success";
    }

    @RequestMapping("to_myTaskList")
    public String to_myTaskList(){
      return  "myTask_list";
    }

    @RequestMapping("/myTack")
    @ResponseBody
    public Map myTack(HttpSession session){
        Map map=new HashMap();
       EmpVo empVo=(EmpVo)session.getAttribute("empVo");
        List<Task> list = taskService.createTaskQuery().taskAssignee(empVo.getEmpName()).list();
        List holidayList=new ArrayList<>();
        for (Task task:list){
            //得到单据id
            int jobId = (int)taskService.getVariable(task.getId(),"jobId");
            HolidayVo holidayVo=new HolidayVo();
            holidayVo.setHolidayid(jobId);
            if (holidayService.selectById(jobId).size()>0){
                holidayList.add(holidayService.selectById(jobId).get(0));
            }
        }

        map.put("code",0);
        map.put("msg","");
        map.put("count",holidayList.size());
        JSONArray jsonArray=(JSONArray) JSON.toJSON(holidayList);
        System.out.println(jsonArray.toJSONString());
        map.put("data",jsonArray);
        return  map;
    }

    @RequestMapping("/to_empLeaveAdult")
    public String toEmpLeaveAdult(){
        return  "empLeave_adult";
    }




    /**
     * 查看批注  我的单据
     * @param hid
     * @param map
     * @return
     */
    @RequestMapping("/lookComment")
    public String lookComment(String hid,Map map){
        //通过jobId查询历史变量对象
        HistoricVariableInstance singleResult = historyService.createHistoricVariableInstanceQuery().variableValueEquals("jobId",hid).singleResult();
        //获取流程实例id (查看实例批注)
        List<Comment> commentList = taskService.getProcessInstanceComments(singleResult.getProcessInstanceId());
        map.put("commentList",commentList);
        return "comment_list";

    }




}
