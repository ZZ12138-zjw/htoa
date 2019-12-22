package com.ht.controller.zz12138;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.zz12138.IEmpEvaluationService;
import com.ht.vo.LogisticsCheck.AddEmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EvaluationListVo;
import com.ht.vo.student.StudentVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/19 16:40
 */
@Controller
@RequestMapping("/Stu/empevaluationcontro")
public class EmpEvaluationController {

    @Resource
    IEmpEvaluationService empEvaluationService;

    @RequestMapping("/to_empevaluationlist")
    public String to_empevaluationlist(){
        return "student_jsp/student_empevaluationlist";
    }

    @ResponseBody
    @RequestMapping("/liststudentempevaluation")
    public Map liststudentempevaluation(String evaluation, HttpSession session) {
        //获取session
        StudentVo studentVo = (StudentVo) session.getAttribute("studentVo");

        int evaluationType = Integer.parseInt(evaluation);

        //通过班级ID获取到专业老师与专职班主任
        List<Map> studentClass = empEvaluationService.selectClass(studentVo.getClassid());
        Map<String,String> map = studentClass.get(0);

        //
        if (evaluationType==1){
            //通过专业老师姓名查询t_emp表获取到专业老师的ID
            List<Map> studentClass1 = empEvaluationService.selectEmpByEmpName(map.get("teacher"));
            Map<String,Integer> empMap = studentClass1.get(0);

            //通过学生ID与教师ID查询evaluationList获取evaluationContentID
            List<Map> list = empEvaluationService.selectEvaluationList(studentVo.getStuId(),empMap.get("empId"));
            Map<String,Object> map1 = list.get(0);

            if (Integer.parseInt(map1.get("evaluationStatus") + "")==0){
                List empEvaluationList = empEvaluationService.selectEvaluation(Integer.parseInt(map1.get("empEvaluationID") + ""));

                Map dataMap = new HashMap();
                JSONArray json = (JSONArray) JSON.toJSON(empEvaluationList);

                dataMap.put("msg","");
                dataMap.put("code",0);
                dataMap.put("count",1);
                dataMap.put("data",json);
                return dataMap;
            }else{
                Map dataMap = new HashMap();

                dataMap.put("msg", "");
                dataMap.put("code", 0);
                dataMap.put("count", 1);
                dataMap.put("data", "");
                return dataMap;
            }
            //学生ID与考评ID查询该学生的考评状态
//            List<Map> evaluationList =

        }else{
            //通过专职班主任姓名查询t_emp表获取到专业老师的ID
            List<Map> studentClass1 = empEvaluationService.selectEmpByEmpName(map.get("classTeacher"));
            Map<String, Integer> empMap = studentClass1.get(0);

            //通过学生ID与教师ID查询evaluationList获取evaluationContentID
            List<Map> list = empEvaluationService.selectEvaluationList(studentVo.getStuId(), empMap.get("empId"));
            Map<String, Object> map1 = list.get(0);

            System.out.println(map1.toString());
            if (Integer.parseInt(map1.get("evaluationStatus") + "") == 0) {
                List empEvaluationList = empEvaluationService.selectEvaluation(Integer.parseInt(map1.get("empEvaluationID") + ""));
                Map dataMap = new HashMap();
                JSONArray json = (JSONArray) JSON.toJSON(empEvaluationList);

                dataMap.put("msg", "");
                dataMap.put("code", 0);
                dataMap.put("count", 1);
                dataMap.put("data", json);
                return dataMap;
            } else {
                Map dataMap = new HashMap();

                dataMap.put("msg", "");
                dataMap.put("code", 0);
                dataMap.put("count", 1);
                dataMap.put("data", "");
                return dataMap;
            }
        }
    }

    @RequestMapping("/to_startevaluation")
    public String to_startevaluation(String empEvaluationID, ModelMap model, HttpServletRequest request) {
        EmpEvaluationVo vo = empEvaluationService.selectEmpEvaluation(Integer.parseInt(empEvaluationID));
        String evaluationContent[] = vo.getEvaluationContent().split(",");
        String evaluationContentID[] = vo.getEvaluationContentID().split(",");
        String evaluationScore[] = vo.getEvaluationScore().split(",");

        List content = new ArrayList();
        List contentID = new ArrayList();
        List score = new ArrayList();

        request.setAttribute("evaluationContent", evaluationContent);
        request.setAttribute("evaluationContentID", evaluationContentID);
        request.setAttribute("evaluationScore", evaluationScore);
        request.setAttribute("empEvaluationVo",vo);
        return "student_jsp/student_startevaluation";
    }

    @ResponseBody
    @RequestMapping("/addempevaluation")
    public String addempevaluation(AddEmpEvaluationVo addEmpEvaluationVo,HttpSession session){
        String evaluationSingleGetScore[] = addEmpEvaluationVo.getEvaluationSingleGetScore().split(",");
        StudentVo studentVo = (StudentVo) session.getAttribute("studentVo");
        int totalScore = 0;
        for (int i=0;i<evaluationSingleGetScore.length;i++){
            totalScore+=Integer.parseInt(evaluationSingleGetScore[i]);
        }
        addEmpEvaluationVo.setEvaluationTotalGetScore(totalScore);
        addEmpEvaluationVo.setStuId(studentVo.getStuId());
        addEmpEvaluationVo.setStuName(studentVo.getStuName());
        empEvaluationService.addEvaluation(addEmpEvaluationVo);
        empEvaluationService.updateEvaluationStatus(addEmpEvaluationVo.getStuId(),Integer.parseInt(addEmpEvaluationVo.getEmpEvaluationID()));
        System.out.println(addEmpEvaluationVo.toString());
        return "success";
    }
}
