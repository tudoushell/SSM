package com.ssm.dao;

import com.ssm.pojo.Employee;

import java.util.List;

public interface EmployeeMapper {

    /**
     * 批量删除员工
     * @param empIds
     */
    void delEmps(List<Integer> empIds);

    /**
     * 删除员工
     * @param empId
     */
    void delEmployee(Integer empId);


    /**
     * 更新员工信息
     * @param employee
     */
    void updateEmployee(Employee employee);

    /**
     * 列出所有的员工
     * @return
     */
    List<Employee> listEmp();

    /**
     * 通过员工 id 来获取用户信息
     * @param id
     * @return
     */
    Employee getEmployeeById(Integer id);

    /**
     * 新增员工
     * @param employee
     */
    void saveEmployee(Employee employee);

    /**
     * 查看用户名或邮箱是否存在
     * @param employee
     * @return
     */
    int checkUserOrEmail(Employee employee);
}
