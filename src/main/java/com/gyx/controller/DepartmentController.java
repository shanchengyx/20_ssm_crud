package com.gyx.controller;

import com.gyx.domain.Department;
import com.gyx.domain.Message;
import com.gyx.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class DepartmentController {
    @Resource
    private DepartmentService departmentService;

    /**
     * 获取所有部门信息
     *
     * @return 返回到显示员工信息的页面
     */
    @ResponseBody
    @RequestMapping("/depts")
    public Message getEmployees() {
        Message message = Message.success();
        List<Department> departmentList = departmentService.queryAllDepartments();
        message.add("departmentList", departmentList);
        return message;
    }
}
