package com.ssm.test;

import com.ssm.dao.EmployeeMapper;
import com.ssm.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestEmp {

    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCheckUserOrEmail(){
        Employee employee = new Employee();
        employee.setEmpName("tom");
        System.out.println(employeeMapper.checkUserOrEmail(employee));
    }

    @Test
    public void testListAll(){
        List<Employee> employeeList = employeeMapper.listEmp();
        System.out.println(employeeList.get(2));
    }

    @Test
    public void testInsertMore(){
        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 300; i++){
            String uuid = UUID.randomUUID().toString().substring(0, 4);
//            employeeMapper.saveEmployee(new Employee(null, uuid, "1", uuid + "@123.com", 1));
        }
        System.out.println("finished");
    }


    @Test
    public void testInsert(){
        Employee employee = new Employee();
        employee.setEmpName("Mike");
        employee.setGender("0");
        employee.setEmail("1234@124.com");
        employeeMapper.saveEmployee(employee);
    }
}
