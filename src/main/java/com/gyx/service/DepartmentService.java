package com.gyx.service;

import com.gyx.domain.Department;

import java.util.List;

public interface DepartmentService {
    /**
     * 查询所有部门
     *
     * @return 查询到的部门
     */
    List<Department> queryAllDepartments();
}
