package com.ht.controller.wj;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.cemer.ClassService;
import com.ht.service.cemer.StudentScoreService;
import com.ht.service.cemer.StudentService;
import com.ht.service.shihehua.ICourseService;
import com.ht.service.wj.TestscoreService;
import com.ht.vo.student.ScoreCheck;
import com.ht.vo.student.StudentReplyScoreVo;
import com.ht.vo.student.StudentScoreVo;
import com.ht.vo.student.TestscoreCheck;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/testscore")
public class TestscoreController {
    @Resource
    private TestscoreService testscoreService;
    @Resource
    private ClassService classService;
    @Resource
    private StudentService studentService;
    @Resource
    private ICourseService iCourseService;
    @Resource
    private StudentScoreService scoreService;

    @RequestMapping("/Test_score")
    public String Test_score(HttpServletRequest request){
        List termList = testscoreService.selterm();
        request.setAttribute("termList",termList);
        List classList = classService.selectAll();
        request.setAttribute("classList",classList);
        List testtypeList = studentService.selectAllTestType();
        request.setAttribute("testtypeList",testtypeList);
        List courseList = iCourseService.selCourseList();
        request.setAttribute("courseList",courseList);
        return "Test_score";
    }

    @RequestMapping("/tse")
    @ResponseBody
    public Map tse(int page, int limit, TestscoreCheck testscoreCheck){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",testscoreService.selCount());
        map.put("data",testscoreService.selTestscore(page,limit,testscoreCheck));
        System.out.println(map.toString());
        return map;
    }

    @RequestMapping("/toAddScore")
    public String toAddForm(HttpServletRequest request){
        request.setAttribute("classes",studentService.selectAllClass());
        request.setAttribute("terms",studentService.selectAllTerm());
        request.setAttribute("cources",studentService.selectAllCourse());
        request.setAttribute("emps",studentService.selectAllEmp());
        request.setAttribute("types",studentService.selectAllTestType());
        return "student/scoreAdd_form";
    }

    @RequestMapping("/score_form")
    public String toScoreTable(HttpServletRequest request, ScoreCheck scoreCheck,String time1,String time2){
        System.out.println(scoreCheck.toString());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date testTime = new Date();
        try {
            testTime = sdf.parse(time1+" "+time2);
            scoreCheck.setScoreTime(testTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        request.setAttribute("scoreCheck",scoreCheck);
        request.setAttribute("cla",scoreService.getById(scoreCheck.getClassid()));
        request.setAttribute("emp",scoreService.empById(scoreCheck.getEmpid()));
        request.setAttribute("course",scoreService.courseById(scoreCheck.getCourseId()));
        request.setAttribute("type",scoreService.typeById(scoreCheck.getTestType()));
        return "student/scoreAdd_list";
    }

    @RequestMapping("/getTableData")
    @ResponseBody
    public Map getData(int classid){
        Map map = new HashMap();
        List datas = scoreService.stuByClassId(classid);
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",datas.size());
        JSONArray jsonArray = (JSONArray) JSON.toJSON(datas);
        map.put("data",jsonArray);
        return map;
    }

    @RequestMapping("/addScore")
    @ResponseBody
    public String addScore(String tableList,String empId,String courseId,String testType,String termid,String scoreTime){
        System.out.println(tableList);
        JSONArray jsonArray = JSONArray.parseArray(tableList);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date time = new Date();
        try {
            time = sdf.parse(scoreTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        for(int i = 0;i<jsonArray.size();i++){
            StudentScoreVo s = new StudentScoreVo();
            Map o = (Map)jsonArray.get(i);
            s.setScore(Integer.parseInt(o.get("s1").toString()));
            s.setRescore(Integer.parseInt(o.get("s2").toString()));
            s.setScoreTime(time);
            s.setStuid(Integer.parseInt(o.get("stuId").toString()));
            s.setCourseId(Integer.parseInt(courseId));
            s.setRemark(o.get("rs").toString());
            s.setEmpid(Integer.parseInt(empId));
            s.setTermid(Integer.parseInt(termid));
            s.setTestType(Integer.parseInt(testType));
            scoreService.addScore(s);
        }

        return "success";
    }
}
