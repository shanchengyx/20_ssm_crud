package com.gyx.dao;

import com.gyx.domain.Employee;
import com.gyx.domain.EmployeeExample;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@SpringJUnitConfig(locations = "classpath:conf/applicationContext.xml")
class EmployeeMapperTest {
    @Resource
    private EmployeeMapper employeeMapper;

    @Resource
    private SqlSession sqlSession;

    @Test
    void testTemplate() {
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null, uid, "W", uid + "@ssm.com", 1));
        }
    }

    @Test
    void countByExample() {
    }

    @Test
    void deleteByExample() {
    }

    @Test
    void deleteByPrimaryKey() {
    }

    @Test
    void insert() {
    }

    @Test
    void insertSelective() {
        employeeMapper.insertSelective(new Employee(null, "Ichika", "女", "Ichika@ssm.com", 1));
    }

    @Test
    void selectByExample() {
    }

    @Test
    void selectByPrimaryKey() {
    }

    @Test
    void testSelectByExampleWithDept() {
    }

    @Test
    void testSelectByPrimaryKeyWithDept() {
    }

    @Test
    void selectByExampleWithDept() {
        List<Employee> employeeList = employeeMapper.selectByExampleWithDept(new EmployeeExample());
        employeeList.forEach(System.out::println);
    }

    @Test
    void selectByPrimaryKeyWithDept() {
        List<Employee> employeeList = employeeMapper.selectByExampleWithDept(new EmployeeExample());
        employeeList.forEach(System.out::println);
    }

    @Test
    void updateByExampleSelective() {
    }

    @Test
    void updateByExample() {
    }

    @Test
    void updateByPrimaryKeySelective() {
    }

    @Test
    void updateByPrimaryKey() {
    }
}