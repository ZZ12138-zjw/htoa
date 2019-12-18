package com.ht.controller.wj;

import com.ht.service.cemer.ClassService;
import com.ht.service.cemer.StudentService;
import com.ht.service.shihehua.ICourseService;
import com.ht.service.wj.TestscoreService;
import com.ht.vo.student.TestscoreCheck;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
}
