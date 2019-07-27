package com.ssm.service.impl;

import com.ssm.dao.EmployeeMapper;
import com.ssm.pojo.Employee;
import com.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Transactional
    @Override
    public void delEmps(List<Integer> ids) {
        employeeMapper.delEmps(ids);
    }

    @Transactional
    @Override
    public void delEmployee(Integer empId) {
        employeeMapper.delEmployee(empId);
    }

    @Override
    public Employee getEmployeeById(Integer id) {
        return employeeMapper.getEmployeeById(id);
    }

    @Transactional
    @Override
    public void updateEmployee(Employee employee) {
        employeeMapper.updateEmployee(employee);
    }

    @Override
    public boolean checkUserOrEmail(Employee employee) {
        int count  = employeeMapper.checkUserOrEmail(employee);
        return count == 0;
    }

    @Override
    public List<Employee> listEmp() {
        return employeeMapper.listEmp();
    }

    @Transactional
    @Override
    public void saveEmp(Employee employee) {
        employeeMapper.saveEmployee(employee);
    }
}
