package com.gyx.service.impl;

import com.gyx.dao.DepartmentMapper;
import com.gyx.domain.Department;
import com.gyx.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Resource
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> queryAllDepartments() {
        return departmentMapper.selectByExample(null);
    }
}
