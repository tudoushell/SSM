package com.ssm.test;

import com.ssm.dao.DeptMapper;
import com.ssm.dao.EmployeeMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.SQLException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestSQL {
//    SqlSessionFactory sqlSessionFactory = null;
//
//    {
//        InputStream inputStream = null;
//        String resource = "mybatis-config.xml";
//        try {
//            inputStream = Resources.getResourceAsStream(resource);
//            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }
    @Autowired
    EmployeeMapper employeeMapper;
    @Test
    public void test2(){
        System.out.println(employeeMapper.getEmployeeById(1));
    }


    @Test
    public void test() throws SQLException {
        ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
        DataSource  dataSource = (DataSource) ctx.getBean("dataSource");
    }
}
