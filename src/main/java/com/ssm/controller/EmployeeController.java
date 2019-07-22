package com.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Employee;
import com.ssm.pojo.Msg;
import com.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    /**
     * 判断用户名或邮箱是否存在
     * @param employee
     * @return
     */
    @ResponseBody
    @GetMapping("/checkEmp")
    public Msg checkEmpInfo(Employee employee){
        if(employeeService.checkUserOrEmail(employee)){
            return Msg.sucess();
        }else{
            return Msg.fail().add("info", "已存在");
        }
    }

    /**
     * 保存用户信息
     * @param employee
     * @return
     */
    @ResponseBody
    @PostMapping("/saveEmp")
    public Msg saveEmp(@Validated Employee employee, BindingResult bindingResult){
        Map<String, Object> map = new HashMap<>();
        if (bindingResult.hasErrors()){
          List<FieldError> listError = bindingResult.getFieldErrors();
            Iterator<FieldError> it = listError.iterator();
            while (it.hasNext()){
                FieldError params = it.next();
                map.put(params.getField(), params.getDefaultMessage());
            }
            return  Msg.fail().add("error", map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.sucess();
        }

    }

    /**
     * 列出员工信息
     * @param pageNo
     * @return
     */
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
