package com.ht.controller.zz12138;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.zz12138.IStudentRepair;
import com.ht.vo.LogisticsCheck.StudentRepairApplyVo;
import com.ht.vo.student.StudentClassVo;
import com.ht.vo.student.StudentVo;
import freemarker.template.SimpleDate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/19 10:00
 */

@Controller
@RequestMapping("/Stu/studentrepair")
public class StudentRepairApplyController {

    @Resource
    IStudentRepair studentRepair;

    @RequestMapping("/to_repairapply")
    public String test(){
        return "student_jsp/student_repairapply";
    }

    @ResponseBody
    @RequestMapping("/add_studentrepair")
    public String add_studentrepair(StudentRepairApplyVo studentRepairApplyVo,HttpSession session){

        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH");


        StudentVo stuVo = (StudentVo) session.getAttribute("studentVo");
        StudentClassVo studentClassVo = studentRepair.selectStudentClass(stuVo.getClassid());
        studentRepairApplyVo.setStudentID(stuVo.getStuId());
        studentRepairApplyVo.setStudentName(stuVo.getStuName());
        studentRepairApplyVo.setClassID(stuVo.getClassid());
        studentRepairApplyVo.setClassName(studentClassVo.getClassName());
        studentRepairApplyVo.setStartDate(simpleDateFormat.format(date));
        studentRepairApplyVo.setRepairStatus("待维修");
        System.out.println(studentRepairApplyVo.toString());
        studentRepair.addStudentRepair(studentRepairApplyVo);
        return "success";
    }

    @RequestMapping("/to_viewrepairapply")
    public String to_viewrepairapply(){
        return "student_jsp/student_myrepairapply";
    }

    @ResponseBody
    @RequestMapping("/student_viewrepairapply")
    public Map student_viewrepairapply(HttpSession session){
        StudentVo studentVo = (StudentVo) session.getAttribute("studentVo");
        Map map = new HashMap();
        int total = studentRepair.selectCount();
        List list = studentRepair.selectStudengRepair(studentVo.getStuId());
        JSONArray json = (JSONArray) JSON.toJSON(list);

        map.put("msg","");
        map.put("code",0);
        map.put("data",json);
        map.put("count",total);
        return map;
    }

    @RequestMapping("/to_repairapplyinfo")
    public String to_repairapplyinfo(String repairID, ModelMap model) throws ParseException {
        StudentRepairApplyVo vo = studentRepair.studentRepair(Integer.parseInt(repairID));
        String start = vo.getStartDate();
        String end = vo.getStartDate();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");
        Date startdate = sdf.parse(start);
        Date enddate = sdf.parse(end);

        vo.setStartDate(sdf.format(startdate));
        vo.setEndDate(sdf.format(enddate));
        System.out.println(vo.toString());
        model.put("studentRepair",vo);
        return "student_jsp/student_repairapplyinfo";
    }

    @ResponseBody
    @RequestMapping("/delrepairapply")
    public String delrepairapply(String repairID){
        studentRepair.delStudentRepair(Integer.parseInt(repairID));
        return "success";
    }
}
