package com.ht.controller.wj;

import org.activiti.engine.*;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

@Controller
@RequestMapping("/process")
public class ProcessController {
    @Resource
    private ProcessEngine processEngine;
    @Resource
    private TaskService taskService;
    @Resource
    private RuntimeService runtimeService;
    @Resource
    private HistoryService historyService;
    @Resource
    private RepositoryService repositoryService;

    //流程列表
    @RequestMapping("/process_list")
    public String process_list(Model model){
        ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();
        query.orderByProcessDefinitionVersion().desc();
        List<ProcessDefinition> processList = query.list();
        model.addAttribute("processList",processList);
        return "process_list";
    }

    //上传流程
    @RequestMapping("/uploadPro")
    public String uploadPro(){
        return "uploadPro";
    }

    //上传流程操作
    @RequestMapping("/touploadPro")
    public String toupload(MultipartFile fbfile){
        try {
            //创建临时file对象
            File file = File.createTempFile("tmp", null);
            //把MultipartFile对象转换成java.io.FileUI对象
            fbfile.transferTo(file);
            //部署Zip文件  将流程上传到Activiti框架
            Deployment deployment = repositoryService.createDeployment().addZipInputStream(new ZipInputStream(new FileInputStream(file))).deploy();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/process/process_list";
    }

    //查看流程图
    @RequestMapping("/selPro")
    public String selPro(String did, String imageName, HttpServletResponse resp){
        InputStream in = repositoryService.getResourceAsStream(did,imageName);
        try {
            OutputStream out = resp.getOutputStream();
            // 把图片的输入流程写入resp的输出流中
            byte[] b = new byte[1024];
            for (int len = -1; (len= in.read(b))!=-1; ) {
                out.write(b, 0, len);
            }
            // 关闭流
            out.close();
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    //下载流程图
    @RequestMapping("/downloadPro")
    public String downloadPro(String id,HttpServletResponse resp){
        try {

            //设置response对象的头参数，attachment就是附件，filename=文件名称
            resp.setHeader("Content-disposition","attachment;filename=" +id+".zip" );
            //下载的文件类型是zip文件
            resp.setContentType("application/x-zip-compressed");

            //----------------------------------------------------------------------------

            //流程定义对象
            ProcessDefinition processDefinition = repositoryService
                    .createProcessDefinitionQuery()
                    .processDefinitionId(id).singleResult();
            //部署id
            String deploymentId = processDefinition.getDeploymentId();

            //bpmn资源文件名称
            String resourceName_bpmn = processDefinition.getResourceName();
            //bpmn资源文件输入流
            InputStream inputStream_bpmn = repositoryService.getResourceAsStream(deploymentId, resourceName_bpmn);
            //png文件名称
            String resourceName_png = processDefinition.getDiagramResourceName();
            //png资源文件输入流
            InputStream inputStream_png = repositoryService.getResourceAsStream(deploymentId, resourceName_png);

            //------创建输出流，绑定到response对象-------------------------------------------------------
            OutputStream out = resp.getOutputStream();
            //创建ZIP输出对象，绑定到输出流
            ZipOutputStream zipo = new ZipOutputStream(out);

            //流复制
            byte[] b = new byte[1024];
            int len = -1;

            //定义zip压缩包中的文件对象（zip实体）
            ZipEntry ze = new ZipEntry(resourceName_bpmn);
            //把创建的实体对象放到压缩包中
            zipo.putNextEntry(ze);
            //文件内容拷贝
            while((len = inputStream_bpmn.read(b,0,1024)) != -1){
                zipo.write(b,0,b.length);
            }
            zipo.closeEntry();
            //---------------
            ZipEntry ze1 = new ZipEntry(resourceName_png);
            zipo.putNextEntry(ze1);
            while((len = inputStream_png.read(b,0,1024)) != -1){
                zipo.write(b,0,b.length);
            }
            //关闭流
            inputStream_bpmn.close();
            inputStream_png.close();
            zipo.flush();
            zipo.close();
            out.flush();
            out.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    //删除流程定义
    @RequestMapping("/delete")
    public String delete(String id){
        repositoryService.deleteDeployment(id,true);
        return "redirect:/process/process_list";
    }
}
