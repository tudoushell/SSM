package com.ssm.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.SQLException;

public class TestSQL {
    @Test
    public void test() throws SQLException {
        ApplicationContext ctx = new  ClassPathXmlApplicationContext("applicationContext.xml");
        DataSource  dataSource = (DataSource) ctx.getBean("dataSource");
        System.out.println(dataSource.getConnection());

    }
}
