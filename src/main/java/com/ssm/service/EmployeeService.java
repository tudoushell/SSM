package com.ssm.service;

import com.ssm.pojo.Employee;

import java.util.List;

public interface EmployeeService {

    /**
     * 查询用户名和邮箱是否存在
     * @param employee
     * @return
     */
    boolean checkUserOrEmail(Employee employee);

    List<Employee> listEmp();

    /**
     * 增加员工
     * @param employee
     */
    void saveEmp(Employee employee);
}
