package com.ht.controller.cemer;

import com.ht.service.cemer.SystemSettingService;
import com.ht.vo.educational.TermVo;
import com.ht.vo.employee.DeptVo;
import com.ht.vo.student.ReplyScoreVo;
import com.ht.vo.student.StudentFallVo;
import com.ht.vo.student.StudentTypeVo;
import com.ht.vo.student.TestTypeVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/system_setting")
public class SystemSettingsController {

    @Resource
    SystemSettingService settingService;

    @RequestMapping(value = "/toSetting")
    public String toMainPage(){
        return "system_setting/system_setting";
    }

    @RequestMapping(value = "/jiebie_setting")
    public String toJieBiePage(){
        return "system_setting/jiebie_setting";
    }

    @RequestMapping("/jiebie_data")
    @ResponseBody
    public Map getjiebieData(String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",settingService.selectJieBieAll().size());
        map.put("data",settingService.selectJieBieByPage(Integer.parseInt(page),Integer.parseInt(limit)));
        return map;
    }

    @RequestMapping("/jiebie_toAdd")
    public String toJieBieAddPage(){
        return "system_setting/jiebie_add";
    }
    @RequestMapping("/jiebie_add")
    @ResponseBody
    public String addJieBie(StudentFallVo studentFallVo){
        settingService.addStudentFallVo(studentFallVo);
        return "success";
    }

    @RequestMapping("/jiebie_delete")
    @ResponseBody
    public String deleteJieBie(int fallid){
        StudentFallVo studentFallVo = settingService.getFallById(fallid);
        settingService.deleteJieBie(studentFallVo);
        return "success";
    }

    @RequestMapping("/clatype_setting")
    public String toClaType(){
        return "system_setting/clatype_setting";
    }

    @RequestMapping("/clatype_data")
    @ResponseBody
    public Map getclatypeData(String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",settingService.selectClaTypeAll().size());
        map.put("data",settingService.selectClaTypeByPage(Integer.parseInt(page),Integer.parseInt(limit)));
        return map;
    }
    @RequestMapping("/clatype_toAdd")
    public String toClaTypetoAdd(){
        return "system_setting/clatype_add";
    }

    @RequestMapping("/clatype_add")
    @ResponseBody
    public String addClaType(StudentTypeVo studentTypeVo){
        settingService.addClassTypeVo(studentTypeVo);
        return "success";
    }

    @RequestMapping("/clatype_delete")
    @ResponseBody
    public String delclaType(int classType){
        settingService.deleteClaType(settingService.getclaTypeById(classType));
        return "success";
    }

    @RequestMapping("/dept_setting")
    public String toDeptPage(){
        return "system_setting/dept_setting";
    }
    @RequestMapping("/dept_data")
    @ResponseBody
    public Map getDeptData(String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",settingService.selectDeptAll().size());
        map.put("data",settingService.selectDeptByPage(Integer.parseInt(page),Integer.parseInt(limit)));
        return map;
    }
    @RequestMapping("/dept_toAdd")
    public String toDeptAdd(HttpServletRequest request){
        request.setAttribute("dept",settingService.selectDeptAll());
        request.setAttribute("emps",settingService.selectEmpAll());
        return "system_setting/dept_add";
    }
    @RequestMapping("/dept_add")
    @ResponseBody
    public String addDept(DeptVo deptVo){
        settingService.addDept(deptVo);
        return "success";
    }

    @RequestMapping("/dept_delete")
    @ResponseBody
    public String delDept(int depid){
        settingService.deleteDept(settingService.getDeptById(depid));
        return "success";
    }

    @RequestMapping("/term_setting")
    public String toTermPage(){
        return "system_setting/term_setting";
    }

    @RequestMapping("/term_data")
    @ResponseBody
    public Map getTermData(String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",settingService.selectTermAll().size());
        map.put("data",settingService.selectTermByPage(Integer.parseInt(page),Integer.parseInt(limit)));
        return map;
    }
    @RequestMapping("/term_toAdd")
    public String toTermAddPage(){
        return "system_setting/term_add";
    }

    @RequestMapping("/term_add")
    @ResponseBody
    public String addTerm(TermVo termVo){
        settingService.addTerm(termVo);
        return "success";
    }
    @RequestMapping("/term_delete")
    @ResponseBody
    public String delTerm(int termid){
        settingService.delTerm(settingService.getTermById(termid));
        return "success";
    }

    @RequestMapping("/replyscore_setting")
    public String toReplyscoreSetting(){
        return "system_setting/replyscore_setting";
    }

    @RequestMapping("/replyscore_data")
    @ResponseBody
    public Map getReplyscoreSetting(String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",settingService.selectReplyScoreAll().size());
        map.put("data",settingService.selectReplyScoreByPage(Integer.parseInt(page),Integer.parseInt(limit)));
        return map;
    }

    @RequestMapping("/replyscore_toAdd")
    public String toReplyScoreAddPage(){
        return "system_setting/replyscore_add";
    }
    @RequestMapping("/replyscore_add")
    @ResponseBody
    public String addReplyScore(ReplyScoreVo replyScoreVo){
        settingService.addReplyScore(replyScoreVo);
        return "success";
    }

    @RequestMapping("/replyscore_delete")
    @ResponseBody
    public String delReplyScore(int projectId){
        settingService.delReplyScore(settingService.getReplyScoerById(projectId));
        return "success";
    }

    @RequestMapping("/testtype_setting")
    public String totestTypePage(){

        return "system_setting/testtype_setting";
    }

    @RequestMapping("/testtype_data")
    @ResponseBody
    public Map gettesttypedata(String page,String limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",settingService.selectTestType().size());
        map.put("data",settingService.selectTestTypePage(Integer.parseInt(page),Integer.parseInt(limit)));
        return map;
    }
    @RequestMapping("/testtype_toAdd")
    public String toAddTestType(){
        return "system_setting/testtype_add";
    }
    @RequestMapping("/testtype_add")
    @ResponseBody
    public String addTestType(TestTypeVo testTypeVo){
        settingService.addTestType(testTypeVo);
        return "success";
    }
    @RequestMapping("/testtype_delete")
    @ResponseBody
    public String delTestTypeDelete(int typeId){
        settingService.delTestType(settingService.getTestTypeById(typeId));
        return "success";
    }
}
