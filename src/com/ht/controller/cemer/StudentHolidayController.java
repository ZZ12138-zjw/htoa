package com.ht.controller.cemer;

import org.activiti.engine.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;


@Controller
@RequestMapping("/stuHoliday")
public class StudentHolidayController {
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



}
