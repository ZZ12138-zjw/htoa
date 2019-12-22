package com.ht.controller.wj;

import com.alibaba.fastjson.JSONObject;
import com.ht.service.wj.SysreportService;
import com.ht.service.xiaoen.IDeptService;
import com.ht.service.zz12138.IFloorManageService;
import com.ht.vo.employee.DeptVo;
import com.ht.vo.employee.WeekCheck;
import com.ht.vo.student.HourNameSearch;
import com.ht.vo.student.StuqjSearch;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequestMapping("/sysreport")
public class SysreportController {

    @Resource
    private IDeptService iDeptService;
    @Resource
    private SysreportService sysreportService;

    @RequestMapping("/emp_assessreport")
    public String emp_assessreport(HttpServletRequest request){
        List<DeptVo> depVos = iDeptService.selectAll();
        request.setAttribute("depVos",depVos);
        return "emp_assessreport";
    }

    @ResponseBody
    @RequestMapping("/empassess")
    public Map empreport(int page, int limit,WeekCheck weekCheck){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",sysreportService.selcount());
        map.put("data",sysreportService.empAssessReport(page,limit,weekCheck));
        System.out.println(map.toString());
        return map;
    }

    @ResponseBody
    @RequestMapping("/xq")
    public Map xq(int empID){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("data",sysreportService.empAssessXq(empID));
        return map;
    }

    @RequestMapping("/emp_attendancereport")
    public String emp_attendancereport(){
        return "emp_attendancereport";
    }

    @ResponseBody
    @RequestMapping("/empattendance")
    public Map empattendance(int page, int limit,WeekCheck weekCheck){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",sysreportService.selAttcount());
        map.put("data",sysreportService.empAttendanceReport(page,limit,weekCheck));
        System.out.println(map.toString());
        return map;
    }

    @RequestMapping("/dormitory")
    public String dormitory(HttpServletRequest request){
        List floorList = sysreportService.selfloorList();
        request.setAttribute("floorList",floorList);
        return "dormitorycount";
    }

    @ResponseBody
    @RequestMapping("/hourNameList")
    public Map hourNameList(int floorId){
        System.out.println("进入方法");
        List hourNameList = sysreportService.hourNameList(floorId);
        System.out.println(hourNameList.size());
        Map map = new HashMap();
        map.put("hourNameList",hourNameList);
        return map;
    }

    @ResponseBody
    @RequestMapping("/dormitorycount")
    public Map dormitorycount(int page, int limit, HourNameSearch hourNameSearch){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",sysreportService.seldormitory());
        map.put("data",sysreportService.dormitoryCount(page,limit,hourNameSearch));
        System.out.println(map.toString());
        return map;
    }

    @RequestMapping("/employeesLeave")
    public String employeesLeave(){
        return "employeesLeave";
    }

    @ResponseBody
    @RequestMapping("/employeesLeavekh")
    public Map employeesLeavekh(int page, int limit,WeekCheck weekCheck){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",sysreportService.selempqj());
        map.put("data",sysreportService.EmployeesLeave(page,limit,weekCheck));
        System.out.println(map.toString());
        return map;
    }

    @ResponseBody
    @RequestMapping("/empqjxq")
    public Map empqjxq(int empid){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("data",sysreportService.empqingjiaxq(empid));
        return map;
    }

    @RequestMapping("/stuloyeesLeave")
    public String stuloyeesLeave(){
        return "stuloyeesLeave";
    }

    @ResponseBody
    @RequestMapping("/stuloyeesLeavekh")
    public Map stuloyeesLeavekh(int page, int limit, StuqjSearch stuqjSearch){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",sysreportService.selstuqj());
        map.put("data",sysreportService.StuloyeesLeave(page,limit,stuqjSearch));
        System.out.println(map.toString());
        return map;
    }

    @ResponseBody
    @RequestMapping("/stuqjxq")
    public Map stuqjxq(int studentId){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("data",sysreportService.stuqingjiaxq(studentId));
        return map;
    }
}
