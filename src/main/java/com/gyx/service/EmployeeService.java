package com.gyx.service;

import com.gyx.domain.Employee;

import java.util.List;

public interface EmployeeService {
    /**
     * 查询所有员工
     *
     * @return 查询到的员工
     */
    List<Employee> queryAllEmployees();

    /**
     * 保存员工
     *
     * @param employee 要保存的员工
     * @return 影响的数据行数
     */
    int addEmployee(Employee employee);

    /**
     * 检验用户名是否存在
     *
     * @param empName 员工名
     * @return 检验结果
     */
    boolean existEmpName(String empName);

    /**
     * 根据id查询员工信息
     *
     * @param empId 员工id
     * @return 查询到的员工信息
     */
    Employee queryEmployeeById(Integer empId);

    /**
     * 更新员工
     *
     * @param employee 员工信息
     * @return 影响的数据行数
     */
    int updateEmployee(Employee employee);

    /**
     * 根据id删除员工
     *
     * @param empId 员工id
     * @return 影响的数据行数
     */
    int deleteEmployeeById(Integer empId);

    /**
     * 批量删除员工
     *
     * @param idList
     * @return 影响的数据行数
     */
    int deleteEmployees(List<Integer> idList);
}
