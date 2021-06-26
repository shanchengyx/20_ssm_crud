package com.gyx.service;

import com.gyx.domain.Department;
import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringJUnitConfig(locations = "classpath:conf/applicationContext.xml")
class DepartmentServiceTest {
    @Resource
    private DepartmentService departmentService;

    @Test
    void queryAllDepartments() {
        List<Department> departmentList = departmentService.queryAllDepartments();
        System.out.println(departmentList);
    }
}