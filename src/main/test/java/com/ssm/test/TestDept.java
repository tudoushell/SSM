package com.ssm.test;

import com.ssm.dao.DeptMapper;
import com.ssm.pojo.Dept;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestDept {
    @Autowired
    DeptMapper deptMapper;

    @Test
    public void testInsert(){
        Dept dept = new Dept();
        dept.setDeptName("人事部");
        deptMapper.saveDept(dept);
    }

}
