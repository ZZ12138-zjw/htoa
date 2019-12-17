package com.ht.controller.zz12138;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.ht.service.zz12138.ICheckInsert;
import com.ht.vo.LogisticsCheck.CheckIndexVo;
import com.ht.vo.LogisticsCheck.CheckInsertVo;
import org.hibernate.annotations.Check;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * @author @ZZ12138-zjw
 * @date 2019/12/9 19:40
 */

@Controller
@RequestMapping("/checkinsertcontro")
public class CheckInsertController {

    @Resource
    ICheckInsert iCheckInsertService;

    @RequestMapping("/to_checkinsert")
    public String to_checkinsert(){
        return "checkinsert";
    }

    @RequestMapping("/to_addcheckinsert")
    public String to_addcheckinsert(ModelMap model){
        List list = iCheckInsertService.selectAll();
        List list2 = iCheckInsertService.selectAllCheckIndex();
        List list3 = iCheckInsertService.selectAllDep();
        model.put("allDeptList",list3);
        model.put("allCheckInsertList",list);
        model.put("allCheckIndexList",list2);
        return "addcheckinsert";
    }

    @ResponseBody
    @RequestMapping("/listcheckinsert")
    public Map listcheckinsert(String page,String limit){
        System.out.println("page:"+page+"limit:"+limit);
        if (limit==null){
            limit = 5+"";
        }
        List list = iCheckInsertService.listCheckInsert(Integer.parseInt(page),Integer.parseInt(limit));
        int total = iCheckInsertService.selAllCount();
        JSONArray jsonArray = (JSONArray) JSON.toJSON(list);
        Map map = new HashMap();

        System.out.println(jsonArray.toJSONString());

        map.put("count",total);
        map.put("msg","");
        map.put("code",0);
        map.put("data",jsonArray);
        return map;
    }

    @ResponseBody
    @RequestMapping("/addcheckinsert")
    public String addcheckinsert(CheckInsertVo vo2) throws IOException {

        System.out.println("保存考核录入");
        System.out.println(vo2.toString());
        List list = iCheckInsertService.selectCheckScore(vo2.getCheckContentID());
        Map map3 = new HashMap();
        map3.put("checkinsertcode","success");
        map3.put("imguploadcode","success");

        for(int i=0;i<list.size();i++){
            Map map2 = (HashMap)list.get(i);
            vo2.setCheckScore((Integer) map2.get("checkScore"));
            vo2.setCheckContent((String)map2.get("checkContent"));
        }
        System.out.println("list:"+list.toString());
        System.out.println("vo2:"+vo2.toString());
        iCheckInsertService.addCheckInsert(vo2);

        return "true";
    }

    @ResponseBody
    @RequestMapping("/imgupload")
    public Map imgupload(MultipartFile file, HttpServletRequest request,String checkDate) throws IOException {
        //获取原文件名
        String oldName = file.getOriginalFilename();

        System.out.println("1234");
        System.out.println("原文件名" + oldName);
        //获取原文件后缀名
        String suffix = oldName.substring(oldName.indexOf("."));
        System.out.println("原文件后缀名" + suffix);
        //获取项目路径
        String path = request.getSession().getServletContext().getRealPath("\\");
        System.out.println("项目路径" + path);

        String path2 = "E:\\Code Editor\\IDEA 2019.1.1 WorkSpace\\GItHub_Online\\htoa\\web\\WEB-INF\\static\\";

        //给上传文件夹加上年月日
        /*Calendar calendar = Calendar.getInstance();
        int month = calendar.get(Calendar.MONTH)+1;
        String mm = String.valueOf(month);
        if (month < 10){
            mm = "0" + mm;
        }*/
        path2 = path2 + "\\" + "checkinsertimg\\" +checkDate;
        System.out.println("加上年月日后的上传路径" + path2);

        //判断上传文件夹是否存在
        File file1 = new File(path2);
        if (!file1.exists()){
            file1.mkdirs();
        }

        //创建新文件名
        String NewName = UUID.randomUUID().toString();
        //拼好完整文件名
        String filepath = path2 + "\\" + oldName;




        System.out.println("完整路径和文件名" + filepath);
        File file2 = new File(filepath);
        //保存文件
        file.transferTo(file2);
        Map map = new HashMap<String,Object>();
        map.put("code",1);
        map.put("msg", "ok");
        map.put("data",oldName);
        return map;
    }

    @ResponseBody
    @RequestMapping("/delcheckinsert")
    public String delcheckinsert(String iD){
        iCheckInsertService.delCheckInsert(iD);
        return "success";
    }

    @RequestMapping("/to_infocheckinsert")
    public String to_editcheckinsert(String checkInsertID, ModelMap model,HttpServletRequest request){
        System.out.println("进入查看考核录入详情");
        CheckInsertVo vo = new CheckInsertVo();
        List list = iCheckInsertService.selectAllCheckInsert(Integer.parseInt(checkInsertID));
        Map map = (HashMap)list.get(0);
        Date date = (Date) map.get("checkDate");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
        String checkdate = simpleDateFormat.format(date);
        map.put("checkDate2",checkdate);
        System.out.println(map.toString());
        request.setAttribute("checkInsertList",map);
        return "infocheckinsert";
    }

    /*@ResponseBody
    @RequestMapping("/editcheckinsert")
    public String editcheckinsert(CheckInsertVo vo){
        List list = iCheckInsertService.selectCheckScore(vo.getCheckContent());
        Map map = (HashMap)list.get(0);
        vo.setCheckScore((Integer) map.get("checkScore"));
        System.out.println(vo.toString());
        iCheckInsertService.editCheckInsert(vo);
        return "true";
    }*/

    @ResponseBody
    @RequestMapping("/alldelcheckinsert")
    public String alldelcheckinsert(String iD[]){
        System.out.println(iD.toString());
        String temp = "";
        for (int i=0;i<iD.length;i++){
            temp+=iD[i]+",";
        }
        String id=temp.substring(0,temp.length()-1);
        iCheckInsertService.delCheckInsert(id);
        return "true";
    }

    @RequestMapping("/to_editcheckinsert")
    public String to_editcheckinsert(int checkInsertID,ModelMap model) throws ParseException {
        System.out.println(checkInsertID);
        CheckInsertVo checkInsert = iCheckInsertService.selectCheckInsert(checkInsertID);
        String checkDate = checkInsert.getCheckDate();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
        Date date = simpleDateFormat.parse(checkDate);

        checkInsert.setCheckDate(simpleDateFormat.format(date));

        List allCheckInsert = iCheckInsertService.selectAll();
        List allEmpList = iCheckInsertService.selectAllEmp();
        List allDeptList = iCheckInsertService.selectAllDep();
        List allCheckIndexList = iCheckInsertService.selectAllCheckIndex();

        System.out.println("checkInsert:"+checkInsert.toString());

        model.put("checkInsertList",checkInsert);
        model.put("allCheckInsert",allCheckInsert);
        model.put("allEmpList",allEmpList);
        model.put("allDeptList",allDeptList);
        model.put("allCheckIndexList",allCheckIndexList);
        return "editcheckinsert2";
    }

    @ResponseBody
    @RequestMapping("/getcheckinsertphoto")
    public Map getcheckinsertphoto(String checkInsertID){

        List list = iCheckInsertService.selectAllCheckInsert(Integer.parseInt(checkInsertID));
        List list2 = new ArrayList();
        Map map = (HashMap)list.get(0);
        Map map2 = new HashMap();
        Map map3 = new HashMap();

        Date date = (Date) map.get("checkDate");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH");
        String checkDate2 = simpleDateFormat.format(date);

        System.out.println(map.toString()+"  "+checkDate2);

        map2.put("alt",map.get("imageName"));
        map2.put("pid",1);
        map2.put("src","http://localhost:8080/checkinsertimg/2019-12-16 05/icon1.jpg");
        map2.put("thumb","http://localhost:8080/checkinsertimg/2019-12-16 05/icon1.jpg");
        list2.add(map2);
        JSONArray json = (JSONArray) JSON.toJSON(list2);

        map3.put("title","考核巡查图片");
        map3.put("id",123);
        map3.put("start",0);
        map3.put("data",json);
        System.out.println("map3:"+map3.toString());
        return map3;
    }

    @ResponseBody
    @RequestMapping("/listemp")
    public Map listemp(String depid){
        List list = iCheckInsertService.selectAllEmp(Integer.parseInt(depid));
        Map map = new HashMap();
        map.put("empList",list);
        System.out.println(map.toString());
        return map;
    }
}