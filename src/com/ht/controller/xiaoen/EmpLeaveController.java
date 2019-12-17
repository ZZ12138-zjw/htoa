package com.ht.controller.xiaoen;

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
import org.activiti.engine.impl.identity.Authentication;
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
        map.put("userId",empVo.getEmpId());
        //天数
        map.put("day",holidayVo.getHolidayDay());
        //单据id
        System.out.println("单据id："+holidayVo.getHolidayid());
        map.put("hid",holidayVo.getHolidayid());
        map.put("assignee",empVo.getEmpId());

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


    @RequestMapping("/to_myTaskList")
    public String myTack(HttpSession session,Map map){
       EmpVo empVo=(EmpVo)session.getAttribute("empVo");
        //任务对象
        List<Task> list = taskService.createTaskQuery().taskAssignee(empVo.getEmpId()+"").list();
        //单据对象
        List holidayList=new ArrayList();
        for (Task task:list){
            Object hid = taskService.getVariable(task.getId(), "hid");
            if (holidayService.selectById(Integer.parseInt(hid+"")).size()>0){
                Map dataMap=(Map)holidayService.selectById(Integer.parseInt(hid+"")).get(0);
                dataMap.put("taskId",task.getId());
                holidayList.add(dataMap);
            }
        }
        map.put("holidayList",holidayList);
        return  "myTask_list";
    }

    @RequestMapping("/to_empLeaveAdult")
    public String toEmpLeaveAdult(String taskId,String hid,Map map){
        map.put("taskId",taskId);
        List list = holidayService.selectById(Integer.parseInt(hid));
        map.put("holiday",list.get(0));
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
        HistoricVariableInstance singleResult = historyService.createHistoricVariableInstanceQuery().variableValueEquals("hid",Integer.parseInt(hid)).singleResult();
        //获取流程实例id (查看实例批注)
        List<Comment> commentList = taskService.getProcessInstanceComments(singleResult.getProcessInstanceId());
        map.put("commentList",commentList);
        return "comment_list";

    }




    /**
     * 审批
     * @param hid
     *      单据id
     * @param taskId
     *      任务id
     * @param flow
     *      审批意见
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
        //根据id查询单据
        HolidayVo holidayVo=new HolidayVo();
        holidayVo.setHolidayid(Integer.parseInt(hid));
        HolidayVo h = holidayService.select(holidayVo);
        //获取用户名称
        EmpVo empVo=(EmpVo)session.getAttribute("empVo");
        //设置当前任务办理人(备注表)
        Authentication.setAuthenticatedUserId(empVo.getEmpId()+"");
        //设置备注信息，(任务id，实例id，页面上的备注)
        taskService.addComment(taskId,processInstanceId,remark);


        //获取下级处理人
        String assignee2=(String) taskService.getVariable(taskId,"assignee2");
        //这里先直接写死的(陈总的id) 因为所有上级的上级都是陈总
        String empId="3";
        //添加任务变量
        Map variable=new HashMap();
        variable.put("flow",flow);
        variable.put("assignee3",3);
        //完成当前任务
        taskService.complete(taskId,variable);
        //根据流程实例获取实例对象(完成流程的实例依然会存在数据库中 但是查询出来是null的)
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        //改变单据状态
        if (processInstance==null && "同意".equals(flow)){
            h.setStatus(2);
        }else if (processInstance==null && "不同意".equals(flow)){
            h.setStatus(3);
        }
        holidayService.update(h);
        return  "success";
    }



}
