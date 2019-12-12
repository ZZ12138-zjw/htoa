package com.ht.controller.xiaoen;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.service.xiaoen.*;
import com.ht.vo.employee.DeptVo;
import com.ht.vo.employee.EmpCkBean;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.employee.JobVo;
import org.activiti.engine.runtime.Job;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.MarshalledObject;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by shkstart on 2019/12/5
 * @author LaiWeiChun
 */
@Controller
@RequestMapping("/emp")

public class EmpController {

    @Autowired
    private IEmpService emp;

    @Autowired
    private IDeptService dept;

    @Autowired
    private IJobService job;

    @Autowired
    private IFamilyInfoService familyInfo;

    @Autowired
    private ICertificatesService certificates;

    @Autowired
    private IEducationService education;

    @Autowired
    private IDocumentService documentEmpService;



    @RequestMapping("/to_emplist")
    public String toEmpList(){
        return "emp_list";
    }

    @RequestMapping("/empList")
    @ResponseBody
    public Map empList(int page, int limit, EmpCkBean empCk){
        Map map=new HashMap();
       /* JSONArray jsonArray= (JSONArray)JSON.toJSON(emp.selectAll());*/
        map.put("data",emp.selectPage(page,limit,empCk));
        map.put("code",0);
        map.put("msg","");
        map.put("count",emp.selectCount());
        return map;
    }


    /**
     * 查询所有部门名称
     *
     * @return
     */
    @RequestMapping("/depName")
    @ResponseBody
    public List depName() {
        Map map=new HashMap();
        List<DeptVo> deptVos = dept.selectAll();
        List<String> dpeNames = new ArrayList();
        for (int i = 0; i < deptVos.size(); i++) {
            DeptVo deptVo = deptVos.get(i);
            dpeNames.add(deptVo.getDepName());
        }
        return dpeNames;
    }


    /**
     * 更改员工状态
     * @param empId
     *      员工id
     * @param status
     *      状态
     *          1 启动
     *          0 禁用
     * @return
     *      返回成功标识
     */
    @RequestMapping("/udtStatus")
    @ResponseBody
    public String udtStatus(int empId,int status){
        emp.udtStatus(empId,status);
        return "success";
    }


    /**
     * 重置密码
     * @param empId
     * @return
     *      返回成功标识
     */
    @RequestMapping("/resetPwd")
    @ResponseBody
    public String resetPwd(int empId){
        emp.resetPwd(empId);
        return "success";
    }


    /**
     * 跳往登录页面
     * @param map
     * @return
     */
    @RequestMapping("/to_empAdd")
    public String toEmpAdd(Map map){
        map.put("depList",dept.selectAll());
        return "emp_add";
    }


    /**
     * 新增员工
     * @param empVo
     * @return
     *      返回成功标识
     */
    @RequestMapping("/empAdd")
    @ResponseBody
    public String empAdd(EmpVo empVo,String hireday,String birt){

        //layui的控件向后台传值都是String类型
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        //ParsePosition用来标明解析的开始位，其实也可以不传 index--输出类型
        ParsePosition position1=new ParsePosition(0);
        ParsePosition position2=new ParsePosition(0);
        Date hiredayDate= format.parse(hireday,position1);
        Date birtDate= format.parse(birt,position2);

        //分别是入职日期和出生日期
        empVo.setHireDay(hiredayDate);
        empVo.setBirthday(birtDate);
        //状态
        empVo.setStatus(1);
        //默认密码
        empVo.setPassword("123456");
        emp.save(empVo);
        return "success";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(EmpVo empVo){
        emp.delete(empVo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/deletes")
    public String deletes(String[] empIds){
        String tempEmpIds="";
        for (int i=0;i<empIds.length;i++){
            System.out.println(empIds[i]);
            tempEmpIds+=empIds[i]+",";
        }
        String empId=tempEmpIds.substring(0,tempEmpIds.length()-1);
        emp.delAll(empId);
        return "success";
    }

    @RequestMapping("/to_empUpdate")
    public String toEmpUpdate(EmpVo empVo,Map map){
        EmpVo e = emp.select(empVo);
        map.put("empVo",e);
        map.put("depList",dept.selectAll());
        return "emp_update";
    }

    @RequestMapping("/empUpdate")
    @ResponseBody
    public String empUpdate(EmpVo empVo,String hireday,String birt){

        System.out.println("入职时间"+hireday+" 员工生日"+birt);
        //layui的控件向后台传值都是String类型
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        //ParsePosition用来标明解析的开始位，其实也可以不传 index--输出类型
        ParsePosition position1=new ParsePosition(0);
        ParsePosition position2=new ParsePosition(0);
        Date hiredayDate= format.parse(hireday,position1);
        Date birtDate= format.parse(birt,position2);

        //分别是入职日期和出生日期
        empVo.setHireDay(hiredayDate);
        empVo.setBirthday(birtDate);

        emp.update(empVo);
        return "success";
    }

    @RequestMapping("/jobList")
    @ResponseBody
    public Map jobList(int empId){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg","无数据");
        map.put("count",job.selectCount());
        map.put("data",job.selectAll(empId));
        return  map;
    }

    @RequestMapping("/educationList")
    @ResponseBody
    public Map educationList(int empId){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg","无数据");
        map.put("count",education.selectCount());
        map.put("data",education.selectAll(empId));
        return  map;
    }

    @RequestMapping("/familylnfoList")
    @ResponseBody
    public Map familylnfoList(int empId){

        Map map=new HashMap();
        map.put("code",0);
        map.put("msg","无数据");
        System.out.println(familyInfo.selectCount()+" "+familyInfo.selectAll(empId));
        map.put("count",familyInfo.selectCount());
        map.put("data",familyInfo.selectAll(empId));
        return  map;
    }


    @RequestMapping("/documentList")
    @ResponseBody
    public Map documentList(int empId){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",documentEmpService.selectCount());
        map.put("data",documentEmpService.selectAll(empId));
        return  map;
    }

    @RequestMapping("to_jobAdd")
    public String toJobAdd(String empId,Map map){
        map.put("empId",empId);
        return "job_add";
    }

    @RequestMapping("/jobAdd")
    @ResponseBody
    public String jobAdd(JobVo jobVo,String beginDate,String endTime){

        //layui的控件向后台传值都是String类型
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        //ParsePosition用来标明解析的开始位，其实也可以不传 index--输出类型
        ParsePosition position1=new ParsePosition(0);
        ParsePosition position2=new ParsePosition(0);
        Date startDate= format.parse(beginDate,position1);
        Date endDate= format.parse(endTime,position2);
        jobVo.setStartDate(startDate);
        jobVo.setEndDate(endDate);
        job.save(jobVo);
        return "success";
    }


    @RequestMapping("/to_jobUpdate")
    public String toJobUpdate(JobVo jobVo,Map map){
        JobVo j = job.select(jobVo);
        System.out.println(j.toString());
        map.put("jobVo",j);
        return "job_update";
    }

    @RequestMapping("/jobUpdate")
    @ResponseBody
    public String jobUpdate(JobVo jobVo,String beginDate,String endTime){
        //layui的控件向后台传值都是String类型
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        //ParsePosition用来标明解析的开始位，其实也可以不传 index--输出类型
        ParsePosition position1=new ParsePosition(0);
        ParsePosition position2=new ParsePosition(0);
        Date startDate= format.parse(beginDate,position1);
        Date endDate= format.parse(endTime,position2);
        jobVo.setStartDate(startDate);
        jobVo.setEndDate(endDate);
        job.update(jobVo);
        return "success";
    }

    @RequestMapping("/jobDelete")
    @ResponseBody
    public String jobDelete(JobVo jobVo){
        System.out.println(jobVo.toString());
        job.delete(jobVo);
        return "success";
    }








}
