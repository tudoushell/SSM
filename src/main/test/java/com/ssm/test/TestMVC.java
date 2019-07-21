package com.ssm.test;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.Iterator;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:applicationContext-mvc.xml"})
public class TestMVC {
    @Autowired
    WebApplicationContext context;
    //虚拟mvc请求，获取处理结果
    MockMvc mockMvc;
    @Test
    public void testListEmp() throws Exception {
        //模拟请求拿到返回值
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps")
                                                                    .param("pageNo", "1")).andReturn();
        MockHttpServletRequest request = mvcResult.getRequest();
        PageInfo<Employee> info = (PageInfo<Employee>) request.getAttribute("pageInfo");
        System.out.println("当前页码：" + info.getPageNum());
        System.out.println("总页码： " + info.getPages());
        System.out.println("总记录数：" + info.getTotal());
        System.out.println(info.getPageSize());
        System.out.println(info.getNavigatePages());
        System.out.println(info.getEndRow());
        System.out.println(info.getNavigateFirstPage());
        //获取员工信息
        List<Employee> list = info.getList();
        Iterator<Employee> it = list.iterator();
        while (it.hasNext()){
            System.out.println(it.next());
        }

    }

    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
}
