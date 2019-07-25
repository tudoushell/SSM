package com.ssm.service;

import com.ssm.pojo.Employee;

import java.util.List;

public interface EmployeeService {

    /**
     * 删除员工
     * @param empId
     */
    void delEmployee(Integer empId);

    /**
     * 根据id 获取员工信息
     * @param id
     * @return
     */
    Employee getEmployeeById(Integer id);

    /**
     * 修改员工信息
     * @param employee
     * @return
     */
    void updateEmployee(Employee employee);

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
