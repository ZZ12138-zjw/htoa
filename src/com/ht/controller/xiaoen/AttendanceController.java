package com.ht.controller.xiaoen;

import com.ht.service.xiaoen.IAttendanceService;
import com.ht.service.xiaoen.IDeptService;
import com.ht.vo.employee.AttendanceVo;
import com.ht.vo.employee.EmpVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 考核控制器
 * Created by shkstart on 2019/12/13
 * @author LaIWeiChun
 */
@Controller
@RequestMapping("/attendance")
public class AttendanceController {


    @Autowired
    private IAttendanceService attendance;
    @Autowired
    private IDeptService dept;

    @RequestMapping("/to_attendanceList")
    public String toAttendanceList(){
        return "attendance_list";
    }

    @RequestMapping("/to_attendanceAuditorList")
    public String to_attendanceAuditorList(){
       return  "attendance_auditorList";
    }


    @RequestMapping("/to_attendanceAdd")
    public String to_attendanceAdd(HttpSession session, HttpServletResponse response){
        EmpVo empVo =(EmpVo)session.getAttribute("empVo");
        return "attendance_add";
    }


    @RequestMapping("/attendanceList")
    @ResponseBody
    public Map attendanceList(String page,String limit,HttpSession session){
        EmpVo empVo=(EmpVo)session.getAttribute("empVo");
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("data",attendance.selectPage(Integer.parseInt(page),Integer.parseInt(limit),empVo.getEmpName()));
        map.put("count",attendance.selectCount());
        return map;

    }

    @RequestMapping("/attendanceAdd")
    @ResponseBody
    public String attendanceAdd(AttendanceVo attendanceVo, String time, HttpSession session){
        //获取到登录信息
        EmpVo empVo=(EmpVo)session.getAttribute("empVo");
        if ("陈生武".equals(empVo.getEmpName())){
            return  "No";
        }else {
            //拼接一下时间
            attendanceVo.setNotTime(attendanceVo.getNotTime()+" "+time);
            //是否为部门负责人
            if(empVo.getEmpName().equals(dept.selectChairmanName(empVo.getDeptId()))){
                //所有上级都是宏图软件，而宏图软件负责人是陈生武
                attendanceVo.setAuditor("陈生武");
            }else {
                //查该员工部门负责人
                attendanceVo.setAuditor(dept.selectChairmanName(empVo.getDeptId()));
            }
            //状态为审核中
            attendanceVo.setStatus(1);
            attendanceVo.setEmpName(empVo.getEmpName());
            attendance.save(attendanceVo);
            return "success";
        }
    }

    @RequestMapping("/attendanceListByEmp")
    @ResponseBody
    public Map attendanceListByEmp(HttpSession session){
        //获取到登录信息
        EmpVo empVo=(EmpVo)session.getAttribute("empVo");
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("data", attendance.selectMyAuditor(empVo.getEmpName()));
        map.put("count",attendance.selectMyAuditor(empVo.getEmpName()).size());
        return map;
    }

    @RequestMapping("/to_attendanceUpdate")
    public String toAttendanceUpdate(AttendanceVo attendanceVo,Map map){
        map.put("attVo",attendance.select(attendanceVo));
        return  "attendance_update";
    }

    @RequestMapping("/attendanceUpdate")
    @ResponseBody
    public String attendanceUpdate(AttendanceVo attendanceVo){
            attendanceVo.setAuditorTime(new Date());
            attendance.update(attendanceVo);
            return  "success";
    }










}
