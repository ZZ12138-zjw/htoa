package com.ht.controller.wj;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ht.service.wj.DocumentService;
import com.ht.vo.upload.dataDocVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/doc")
public class DocumentController {

    @Resource
    private DocumentService documentService;

    //资料文档
    @RequestMapping("/documentList")
    public String documentList(){
        return "documentList";
    }

    @RequestMapping("/docList")
    @ResponseBody
    public Map docList(String page, String limit){
        Map map=new HashMap();
        map.put("code",0);
        map.put("msg"," ");
        map.put("count",documentService.selCount());
        JSONArray jsonArray=(JSONArray) JSON.toJSON(documentService.selDocument(Integer.parseInt(page),Integer.parseInt(limit)));
        map.put("data",jsonArray);
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
    public JSONObject touploadoc(MultipartFile file, dataDocVo docVo, HttpServletRequest request) throws IOException {
        System.out.println("进入服务器");
        //获取原文件名
        String oldName = file.getOriginalFilename();
        System.out.println("原文件名" + oldName);
        //获取原文件后缀名
        String suffix = oldName.substring(oldName.indexOf("."));
        System.out.println("原文件后缀名" + suffix);
        //获取项目路径
        String path = request.getSession().getServletContext().getRealPath("\\");
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
        docVo.setEmpId(12);
        docVo.setUrl(filepath);
        documentService.addDoc(docVo);
        JSONObject resObj = new JSONObject();
        resObj.put("msg", "ok");
        return resObj;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public boolean delete(dataDocVo docVo){
        documentService.delDoc(docVo);
        return true;
    }

    @ResponseBody
    @RequestMapping("/deletes")
    public String deletes(String id){
        System.out.println("删除");
        id=id.substring(0,id.length()-1);
        System.out.println("sid "+id);
        documentService.deletes(id);
        return "success";
    }
}
