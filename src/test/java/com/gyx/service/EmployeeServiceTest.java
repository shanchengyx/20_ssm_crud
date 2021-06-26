package com.gyx.service;

import com.gyx.domain.Employee;
import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@SpringJUnitConfig(locations = "classpath:conf/applicationContext.xml")
class EmployeeServiceTest {
    @Resource
    private EmployeeService employeeService;

    @Test
    void queryAllEmployees() {
        List<Employee> employeeList = employeeService.queryAllEmployees();
        employeeList.forEach(System.out::println);
    }

    @Test
    void addEmployee() {
        employeeService.addEmployee(new Employee(null, "nino", "W", "nino@ssm.com", 1));
    }

    @Test
    void existEmpName() {
        System.out.println(employeeService.existEmpName("Ichika"));
    }

    @Test
    void queryEmployeesById() {
        System.out.println(employeeService.queryEmployeeById(1));
    }

    @Test
    void updateEmployee() {
        System.out.println(employeeService.updateEmployee(new Employee(1, "一花", "W", "yihua@ssm.com", 2)));
    }

    @Test
    void deleteEmployeeById() {
        System.out.println(employeeService.deleteEmployeeById(2));
    }

    @Test
    void deleteEmployees() {
        ArrayList<Integer> idList = new ArrayList<>(Arrays.asList(7, 8, 9, 10));
        int nums = employeeService.deleteEmployees(idList);
        System.out.println(nums);
    }
}