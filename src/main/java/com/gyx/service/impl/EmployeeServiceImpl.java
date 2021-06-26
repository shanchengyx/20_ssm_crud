package com.gyx.service.impl;

import com.gyx.dao.EmployeeMapper;
import com.gyx.domain.Employee;
import com.gyx.domain.EmployeeExample;
import com.gyx.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Resource
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> queryAllEmployees() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public int addEmployee(Employee employee) {
        return employeeMapper.insertSelective(employee);
    }

    @Override
    public boolean existEmpName(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(empName);
        return (employeeMapper.countByExample(example) > 0);
    }

    @Override
    public Employee queryEmployeeById(Integer empId) {
        return employeeMapper.selectByPrimaryKey(empId);
    }

    @Override
    public int updateEmployee(Employee employee) {
        return employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public int deleteEmployeeById(Integer empId) {
        return employeeMapper.deleteByPrimaryKey(empId);
    }

    @Override
    public int deleteEmployees(List<Integer> idList) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(idList);
        int nums = employeeMapper.deleteByExample(example);
        return nums;
    }
}
