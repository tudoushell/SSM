package com.ssm.controller;

import com.ssm.pojo.Dept;
import com.ssm.pojo.Msg;
import com.ssm.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/dept")
@Controller
public class DeptController {
    @Autowired
    private DeptService deptService;

    @ResponseBody
    @GetMapping("/listDept")
    public Msg listDept(){
        List<Dept> listDept = deptService.listDept();
        return Msg.sucess().add("listDept", listDept);
    }
}
