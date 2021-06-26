package com.gyx.controller;

import com.github.pagehelper.PageInfo;
import com.gyx.domain.Employee;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

;

@WebAppConfiguration
@SpringJUnitConfig(locations = {"classpath:conf/applicationContext.xml", "classpath:conf/dispatcherServlet.xml"})
class EmployeeControllerTest {
    @Resource
    private WebApplicationContext context;
    private MockMvc mockMvc;

    //junit5的beforeEach，在每个测试方法之前执行
    @BeforeEach
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    void testGetEmployees() {
        try {
            MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pageNum", "1")).andReturn();
            MockHttpServletRequest request = mvcResult.getRequest();
            PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
            System.out.println("当前页码 " + pageInfo.getPageNum());
            System.out.println("总页码 " + pageInfo.getPages());
            System.out.println("总记录数 " + pageInfo.getTotal());
            System.out.print("连续显示的页码 ");
            int[] navigatepageNums = pageInfo.getNavigatepageNums();
            System.out.println(Arrays.toString(navigatepageNums));
            List<Employee> employeeList = pageInfo.getList();
            employeeList.forEach(System.out::println);
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }
}