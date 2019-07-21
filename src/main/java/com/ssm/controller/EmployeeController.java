package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Employee;
import com.ssm.pojo.Msg;
import com.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @ResponseBody
    @GetMapping("/emps")
    public Msg listEmps(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        PageHelper.startPage(pageNo, 5);
        List<Employee> listEmp = employeeService.listEmp();
        PageInfo<Employee> pageInfo = new PageInfo<>(listEmp, 5);
        return Msg.sucess().add("pageInfo", pageInfo);
    }


//    @GetMapping("/emps")
//    public String listEmp(@RequestParam(value = "pageNo", defaultValue = "1")Integer pageNo, Model model){
//        //引入分页插件
//        PageHelper.startPage(pageNo, 5);
//        List<Employee> listEmp = employeeService.listEmp();
//        PageInfo<Employee> pageInfo = new PageInfo<>(listEmp, 5);
//        model.addAttribute("pageInfo", pageInfo);
//        return "list";
//    }

}
