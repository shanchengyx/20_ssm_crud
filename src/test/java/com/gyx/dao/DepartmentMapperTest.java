package com.gyx.dao;

import com.gyx.domain.Department;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import javax.annotation.Resource;
import java.util.List;

@SpringJUnitConfig(locations = "classpath:conf/applicationContext.xml")
class DepartmentMapperTest {
    @Resource
    private DepartmentMapper departmentMapper;

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
        departmentMapper.insertSelective(new Department(null, "开发部"));
        departmentMapper.insertSelective(new Department(null, "测试部"));
    }

    @Test
    void selectByExample() {
    }

    @Test
    void selectByPrimaryKey() {
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

    @Test
    void testSelectByExample() {
        List<Department> departmentList = departmentMapper.selectByExample(null);
        departmentList.forEach(System.out::println);
    }

    @Test
    void testSelectByPrimaryKey() {
    }
}