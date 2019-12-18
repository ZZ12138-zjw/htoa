package com.ht.controller.wj;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.service.wj.DocumentService;
import com.ht.vo.employee.EmpVo;
import com.ht.vo.upload.dataDocVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/doc")
public class DocumentController {

    @Resource
    private DocumentService documentService;

    @RequestMapping("/document_list")
    public String document_list(){
        return "document_list";
    }

    @RequestMapping("/docList")
    @ResponseBody
    public Map docList(int page, int limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",documentService.selCount());
        map.put("data",documentService.selDocument(page,limit));
        System.out.println(map.toString());
        return map;
    }

    //上传资料文档
    @RequestMapping("/uploadoc")
    public String uploadoc(){
        return "uploadDoc";
    }

    @ResponseBody
    @RequestMapping("/touploadoc")
    public Map touploadoc(MultipartFile file, dataDocVo docVo, HttpServletRequest request, HttpSession session) throws IOException {
        System.out.println("进入服务器");
        //获取原文件名
        String oldName = file.getOriginalFilename();
        System.out.println("原文件名" + oldName);
        //获取原文件后缀名
        String suffix = oldName.substring(oldName.indexOf("."));
        System.out.println("原文件后缀名" + suffix);
        //获取项目路径
        String path = request.getServletContext().getRealPath("/");
        System.out.println("项目路径" + path);

        //给上传文件夹加上年月日
        Calendar calendar = Calendar.getInstance();
        int month = calendar.get(Calendar.MONTH)+1;
        String mm = String.valueOf(month);
        if (month < 10){
            mm = "0" + mm;
        }
        path = path + "\\" + "upload\\" + calendar.get(Calendar.YEAR) + mm + calendar.get(Calendar.DAY_OF_MONTH);
        System.out.println("加上年月日后的上传路径" + path);

        //判断上传文件夹是否存在
        File file1 = new File(path);
        if (!file1.exists()){
            file1.mkdirs();
        }

        //创建新文件名
        String NewName = UUID.randomUUID().toString();
        //拼好完整文件名
        String filepath = path + "\\" + NewName + suffix;
        System.out.println("完整路径和文件名" + filepath);
        File file2 = new File(filepath);
        //保存文件
        file.transferTo(file2);
        System.out.println("文件上传并保存成功");
        docVo.setDataName(oldName);
        docVo.setOptime(new Date());
        EmpVo empVo = (EmpVo)session.getAttribute("empVo");
        int empid = empVo.getEmpId();
        docVo.setEmpId(empid);
        docVo.setUrl(calendar.get(Calendar.YEAR) + mm + calendar.get(Calendar.DAY_OF_MONTH)+"/"+NewName + suffix);
        documentService.addDoc(docVo);
        Map map = new HashMap<String,Object>();
        map.put("code","0");
        map.put("msg", "");
        return map;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public void delete(dataDocVo docVo){
        documentService.delDoc(docVo);
    }

    @ResponseBody
    @RequestMapping("/deletes")
    public String deletes(String[] id){
        String docIds = "";
        for (int i=0;i<id.length;i++){
            docIds+=id[i]+",";
        }
        String docid = docIds.substring(0,docIds.length()-1);
        documentService.deletes(docid);
        return "success";
    }
}
