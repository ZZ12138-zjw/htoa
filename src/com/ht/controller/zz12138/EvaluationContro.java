package com.ht.controller.zz12138;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.zz12138.IEmpEvaluationService;
import com.ht.service.zz12138.IEvaluationService;
import com.ht.vo.LogisticsCheck.EmpEvaluationVo;
import com.ht.vo.LogisticsCheck.EvaluationContentVo;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.student.StudentClassVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author @ZZ12138-zjw
 * @date 2019/12/10 21:11
 */
@Controller
@RequestMapping("/evaluationcontro")
public class EvaluationContro {

    @Resource
    IEvaluationService evaluationService;

    @Resource
    IEmpEvaluationService empEvaluationService;


    @RequestMapping("/to_evaluationcontent")
    public String to_evaluationcontent() {
        System.out.println("进入考评内容页面");
        return "evaluationcontent";
    }

    @RequestMapping("/to_addevaluationcontent")
    public String to_addevaluationcontent(ModelMap model) {
        List allDeptList = empEvaluationService.selectAllDept();
        List allEmpList = empEvaluationService.selectAllEmp();
        System.out.println("allEmpList:" + allEmpList);
        model.put("allDeptList", allDeptList);
        model.put("allEmpList", allEmpList);
        System.out.println("进入添加考评内容页面");
        return "addevaluationcontent";
    }

    @RequestMapping("/to_editevaluationcontent")
    public String to_editevaluationcontent(ModelMap model, String evaluationID) {
        EvaluationContentVo vo = evaluationService.listByID(Integer.parseInt(evaluationID));
        List list = evaluationService.selAll();
        List allDeptList = evaluationService.selDepName();
        System.out.println(vo.toString());
        System.out.println(list.toString());
        model.put("evaluationList", vo);
        model.put("allDeptList", allDeptList);
        model.put("allEvaluationList", list);
        System.out.println("进入编辑考评内容页面");
        return "editevaluationcontent";
    }

    @ResponseBody
    @RequestMapping("/listevaluationcontent")
    public Map listevaluationcontent(String page, String limit) {
        Map map = new HashMap();
        if (limit == null && page == null) {
            limit = 5 + "";
            page = 1 + "";
        }
        System.out.println(page + "  " + limit);
        System.out.println("进入遍历");
        List list = evaluationService.listEvaluationContent(Integer.parseInt(page), Integer.parseInt(limit));
        System.out.println("list:" + list.toString());
        JSONArray jsonArray = (JSONArray) JSON.toJSON(list);
        int total = evaluationService.selAllCount();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", total);
        map.put("data", jsonArray);
        System.out.println(map.toString());
        return map;
    }

    @ResponseBody
    @RequestMapping("/editevaluationcontent")
    public String editevaluationcontent(EvaluationContentVo vo) {
        System.out.println(vo.toString());
        evaluationService.updateEvaluationContent(vo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/addevaluationcontent")
    public String addevaluationcontent(EvaluationContentVo vo) {
        evaluationService.addEvaluationContent(vo);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/delevaluationcontent")
    public String delevaluationcontent(String evaluationID) {
        evaluationService.delEvaluationContent(evaluationID);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/alldelevaluation")
    public String alldelevaluation(String evaluationID[]) {
        String temp = "";
        for (int i = 0; i < evaluationID.length; i++) {
            temp += evaluationID[i] + ",";
        }
        String id = temp.substring(0, temp.length() - 1);
        evaluationService.delEvaluationContent(id);
        return "success";
    }

    @RequestMapping("/to_empevaluation")
    public String to_empevaluation() {
        System.out.println("进入教室考评页面");
        return "empevaluation";
    }

    @ResponseBody
    @RequestMapping("/listempevaluation")
    public Map listempevaluation(String page, String limit) {
        System.out.println("遍历教师考评");
        if (limit == null) {
            limit += 5;
        }
        List list = empEvaluationService.listEmpEvaluation(Integer.parseInt(page), Integer.parseInt(limit));
        int total = empEvaluationService.selAllCount();
        Map map = new HashMap();
        JSONArray json = (JSONArray) JSON.toJSON(list);

        map.put("code", 0);
        map.put("count", total);
        map.put("msg", "");
        map.put("data", json);
        System.out.println(map.toString());

        return map;
    }

    @RequestMapping("/to_addempevaluation")
    public String to_addempevaluation(ModelMap model, String depid) {
        System.out.println("进入添加教师考评页面");
        System.out.println("depid:" + depid);
        List allDeptList = empEvaluationService.selectAllDept();
        List allEmpList = empEvaluationService.selectAllEmp();
        List allEvaluationContentList = empEvaluationService.selectAllEvaluation();

        System.out.println("addDeptList:" + allDeptList.toString());
        System.out.println("allEmpList:" + allEmpList.toString());

        model.put("allDeptList", allDeptList);
        model.put("allEmpList", allEmpList);
        model.put("allEvaluationContentList", allEvaluationContentList);

        return "addempevaluation";
    }

    @ResponseBody
    @RequestMapping("/listevaluationemp")
    public String listevaluationemp(String depId) {
        System.out.println("进入查询员工");
        System.out.println(depId);
        return "true";
    }

    @ResponseBody
    @RequestMapping("/evaluationcontent")
    public Map evaluationcontent(String depID, String evaluationType) {
        System.out.println("进入异步查询考评内容");
        System.out.println("evaluationType:" + evaluationType);
        System.out.println("depID:" + depID);
        List list = empEvaluationService.selectEvaluationContent(Integer.parseInt(depID), Integer.parseInt(evaluationType));
        Map map = new HashMap();
        map.put("evaluationContentList", list);
        return map;
    }

    @ResponseBody
    @RequestMapping("/listemp")
    public Map listemp(String depid) {
        System.out.println("进入异步查询考评内容");
        System.out.println(depid);
        List list = empEvaluationService.selectEmp(Integer.parseInt(depid));
        Map map = new HashMap();
        map.put("evaluationContentList", list);
        System.out.println(map.toString());
        return map;
    }

    @ResponseBody
    @RequestMapping("/listevaluationtype")
    public int listevaluationtype(Integer empId) {
        int emp = empId;
        System.out.println("进入异步查询员工类型");
        System.out.println(emp);
        EmpVo vo = empEvaluationService.selEmp(emp);
        System.out.println(vo.getPostName());
        if (vo.getPostName().equals("专业老师")) {
            return 1;
        }
        return 2;
    }

    @ResponseBody
    @RequestMapping("/addempevaluation")
    public String addempevaluation(EmpEvaluationVo empEvaluationVo) throws ParseException {
        System.out.println("进入添加员工考评后台");

        String empEvaluationContent = empEvaluationVo.getEvaluationContent();
        empEvaluationVo.setEvaluationContent(empEvaluationVo.getEvaluationContent().substring(0, empEvaluationContent.length() - 1));

        String evaluationContentID = empEvaluationVo.getEvaluationContentID();
//        int evaluationContentIDlength = Integer.parseInt(evaluationContentID);
        empEvaluationVo.setEvaluationContentID(empEvaluationVo.getEvaluationContentID().substring(0, evaluationContentID.length() - 1));

        Date today = new Date();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
        System.out.println("today:" + today);


        Date start = simpleDateFormat.parse(empEvaluationVo.getStartDate());
        Date end = simpleDateFormat.parse(empEvaluationVo.getEndDate());

        if (end.getTime() > today.getTime() && start.getTime() > today.getTime()) {
            empEvaluationVo.setEvaluationStatus(0);
        } else if (start.getTime() < today.getTime() && end.getTime() < today.getTime()) {
            empEvaluationVo.setEvaluationStatus(2);
        } else if (end.getTime() > today.getTime() && start.getTime() < today.getTime()) {
            empEvaluationVo.setEvaluationStatus(1);
        }

        List<Map> evaluationContentList = empEvaluationService.selectEvaluationContent(empEvaluationVo.getEvaluationContentID());
        int totalScore = 0;

        for (int i = 0; i < evaluationContentList.size(); i++) {
            Map map = evaluationContentList.get(i);
            totalScore += (Integer) map.get("evaluationScore");
        }

        empEvaluationVo.setEvaluationScore(totalScore);
        System.out.println("empEvaluationVo:" + empEvaluationVo.toString());
        empEvaluationService.addEmpEvaluation(empEvaluationVo);


        List<Map> classes = new ArrayList<>();
        if (empEvaluationVo.getEvaluationType() == 1) {//老师
            classes = empEvaluationService.selectClass1(empEvaluationVo.getEmpName());
        } else {//班主任
            classes = empEvaluationService.selectClass2(empEvaluationVo.getEmpName());
        }

        for (Map cla : classes) {
            StudentClassVo clz = empEvaluationService.selClass1(Integer.parseInt(cla.get("classId") + ""));
            //根据班级编号查询班级列表
            List<Map> studentList = empEvaluationService.selectStudent(clz.getClassId());
            //根据员工ID查询考评ID
            List<Map> evaluationList = empEvaluationService.selectEvaluationByEmpID(empEvaluationVo.getEmpID());
            List allEvaluationID = new ArrayList();



            /*for (Map map3 : evaluationList){
            }*/

            for (Map stu : studentList) {
                for (int i = 0; i < evaluationList.size(); i++) {
                    Map<String,String> map4 = evaluationList.get(i);
                    String evaluationid[] = map4.get("evaluationContentID").split(",");
                    Map<String,Integer> map5 = new HashMap<>();
                    for (int j=0;j<evaluationid.length;j++){
                        String evaID = evaluationid[j];
                        map5.put("evaluationContentID",Integer.parseInt(evaID));
                        System.out.println("map5:"+map5.toString());
                    }
                    empEvaluationService.addEvaluationList(empEvaluationVo.getEmpID(), empEvaluationVo.getEmpName(), clz.getClassId(), clz.getClassName(), Integer.parseInt(stu.get("stuId") + ""),map5.get("evaluationContentID"));
                }
            }
        }















        List<Map> list2 = empEvaluationService.selectEvaluationByEmpID(empEvaluationVo.getEmpID());
        for (Map<String,Integer> map:list2){
            empEvaluationService.addEvaluationID(map.get("empID"));
        }
        return "success";
    }

    @ResponseBody
    @RequestMapping("/delempevaluation")
    public String delempevaluation(String empEvaluationID) {
        empEvaluationService.delEmpEvaluation(Integer.parseInt(empEvaluationID));
        return "success";
    }

    @RequestMapping("/to_editempevaluation")
    public String alldelempevaluation(HttpServletRequest request, String empEvaluationID, ModelMap model) throws ParseException {
        EmpEvaluationVo vo = empEvaluationService.selectEmpEvaluation(Integer.parseInt(empEvaluationID));
        List list = empEvaluationService.selectAllDept();

        String evaluationContent[] = vo.getEvaluationContent().split(",");
        String evaluationContentID[] = vo.getEvaluationContentID().split(",");

        List list1 = new ArrayList();
        List list2 = new ArrayList();

        for (int i = 0; i < evaluationContent.length; i++) {

            list1.add(evaluationContent[i]);
            list2.add(evaluationContentID[i]);
        }

        Date start = new Date();
        Date end = new Date();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
        start = simpleDateFormat.parse(vo.getStartDate());
        end = simpleDateFormat.parse(vo.getEndDate());

        vo.setStartDate(simpleDateFormat.format(start));
        vo.setEndDate(simpleDateFormat.format(end));

        model.put("empEvaluationList", vo);
//        model.put("allList",allList);
//        model.put("evaluationContentID",map2);
        model.put("allDeptList", list);
        request.setAttribute("evaluationContent", list1);
        request.setAttribute("evaluationContentID", list2);


        System.out.println("empEvaluationList:" + vo.toString());
        System.out.println("list1:" + list1.toString());
        System.out.println("list2:" + list2.toString());
        return "editempevaluation";
    }
}