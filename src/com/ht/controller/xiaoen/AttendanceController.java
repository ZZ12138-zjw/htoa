package com.ht.controller.xiaoen;

import com.ht.service.xiaoen.IAttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by shkstart on 2019/12/13
 * @author LaIWeiChun
 */
@Controller
@RequestMapping("/attendance")
public class AttendanceController {


    @Autowired
    private IAttendanceService attendance;


    @RequestMapping("/to_attendanceList")
    public String toAttendanceList(){
        return "attendance_list";
    }



    @RequestMapping("/attendanceList")
    @ResponseBody
    public Map attendanceList(String page,String limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("data",attendance.selectPage(Integer.parseInt(page),Integer.parseInt(limit)));
        map.put("count",attendance.selectCount());
        return map;

    }

}
