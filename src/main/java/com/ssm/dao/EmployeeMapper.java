package com.ssm.dao;

import com.ssm.pojo.Employee;

import java.util.List;

public interface EmployeeMapper {

    List<Employee> listEmp();

    Employee getEmployeeById(Integer id);

    void saveEmployee(Employee employee);
}
