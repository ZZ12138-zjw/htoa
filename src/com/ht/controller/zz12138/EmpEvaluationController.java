package com.ht.controller.zz12138;

import com.ht.service.zz12138.IEmpEvaluationService;
import com.ht.vo.LogisticsCheck.EmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EvaluationListVo;
import com.ht.vo.student.StudentVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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
    public Map liststudentempevaluation(String evaluationType, HttpSession session) {
        StudentVo studentVo = (StudentVo) session.getAttribute("studentVo");

        //根据学生ID查询evaluationlist状态是已读还是未读
        List<Map> evaluationList = empEvaluationService.selectEvaluationList(studentVo.getStuId());

        if (Integer.parseInt(evaluationType)==1){
            //根据班级ID查询班级列表，获得当前授课老师
            List<Map> studentClassList = empEvaluationService.selectClass(studentVo.getClassid());
            int empID = 0;

            //根据授课老师姓名查询授课老师ID，查询t_emp表
            for (Map<String,String> map : studentClassList){
                List<Map> empList = empEvaluationService.selectEmp(map.get("teacher"));
                Map<String,Integer> map2 = empList.get(0);
                empID = map2.get("empId");
                break;
            }

            //查询学生是否已读考评
            List<Map> evaluationStatus = empEvaluationService.seelctEvaluationStatus(empID,studentVo.getStuId());
            Map<String,Integer> map = evaluationStatus.get(0);
            if (map.get("evaluationStatus")==0){
                List<Map> empEvaluationList = empEvaluationService.selectEvaluation(empID, Integer.parseInt(evaluationType));
                System.out.println("考评内容："+empEvaluationList.toString());
                /*for (Map map2 : empEvaluationList) {

                    //
                }*/
            }else{
                System.out.println("学生已考评！");
            }


            //根据老师ID和教师类型查询教师考评表

        }

        /*for (Map<String,Integer> map : evaluationList){
            if (map.get("evaluationStatus")==0){

                Map studentClassMap = studentClassList.get(0);
                System.out.println(studentClassMap.toString());
            }
        }*/
        Map map = new HashMap();
        return map;
    }
}
