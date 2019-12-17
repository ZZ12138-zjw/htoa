package com.ht.controller.wj;

import com.alibaba.fastjson.JSONObject;
import com.ht.service.wj.SysreportService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@RequestMapping("/sysreport")
public class SysreportController {
    @Resource
    private SysreportService sysreportService;

    /*public Map empreport(){
        List list = sysreportService.empAssess();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("datas",list);

    }*/
}
