package com.ht.controller.wj;

import com.alibaba.fastjson.JSONObject;
import com.ht.service.wj.SysreportService;
import com.ht.service.xiaoen.IDeptService;
import com.ht.vo.employee.DeptVo;
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
    public Map empreport(int page, int limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",sysreportService.selcount());
        map.put("data",sysreportService.empAssessReport(page,limit));
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
    public Map empattendance(int page, int limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",sysreportService.selAttcount());
        map.put("data",sysreportService.empAttendanceReport(page,limit));
        System.out.println(map.toString());
        return map;
    }
}
