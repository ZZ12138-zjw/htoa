package com.ht.controller.wj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/doc")
public class DocumentController {

    @Resource
    private DocumentService documentService;

    //资料文档列表
    @RequestMapping("/documentList")
    public String documentList(Model model){
        List documentList = documentService.selDocument();
        model.addAttribute("documentList",documentList);
        return "documentList";
    }

    //上传资料文档
    @RequestMapping("/uploadoc")
    public String uploadoc(){
        return "uploadoc";
    }
}
