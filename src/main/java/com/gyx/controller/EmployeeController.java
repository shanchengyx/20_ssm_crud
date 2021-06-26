package com.gyx.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gyx.domain.Employee;
import com.gyx.domain.Message;
import com.gyx.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class EmployeeController {
    @Resource
    private EmployeeService employeeService;

    /**
     * 获取所有员工信息
     *
     * @param pageNum 当前页码，默认是1
     * @return 返回获取到的所有员工信息
     */
    @ResponseBody
    @RequestMapping("/emps")
    public Message getEmployees(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        Message message = Message.success();
        //设置分页
        PageHelper.startPage(pageNum, 5);
        //进行分页查询
        message.add("pageInfo", new PageInfo(employeeService.queryAllEmployees(), 5));
        return message;
    }

    /**
     * 保存添加的员工
     *
     * @param employee 员工信息
     * @param result   结果集
     * @return 返回添加的结果
     */
    @ResponseBody
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    public Message saveEmp(@Valid Employee employee, BindingResult result) {
        //校验失败
        if (result.hasErrors()) {
            HashMap<String, Object> resultMap = new HashMap<>();//存放错误信息的map
            List<FieldError> errors = result.getFieldErrors();//获取错误信息
            for (FieldError error : errors) {
                resultMap.put(error.getField(), error.getDefaultMessage());//将错误信息放入map
                System.out.println(error.getField() + "出错：" + error.getDefaultMessage());
            }
            return Message.fail().add("errorMsg", resultMap);//返回失败
        }
        int nums = employeeService.addEmployee(employee);
        if (nums != -1) {//保存成功
            return Message.success();
        } else {//保存失败
            return Message.fail();
        }
    }

    /**
     * 检验用户名是否已存在
     *
     * @param empName 员工名
     * @return 返回检验结果
     */
    @ResponseBody
    @RequestMapping(value = "/checkUserExist")
    public Message checkUserExist(String empName) {
        if (employeeService.existEmpName(empName)) {
            return Message.fail();//存在就返回失败
        } else {
            return Message.success();//不存在就返回成功
        }
    }

    /**
     * 获取员工信息
     *
     * @param empId 员工id
     * @return 返回获取到的员工信息
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    public Message getEmployee(@PathVariable("id") Integer empId) {
        return Message.success().add("employee", employeeService.queryEmployeeById(empId));
    }

    /**
     * 修改员工信息
     *
     * @param employee 员工信息
     * @return 返回修改的结果
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.PUT)
    public Message updateEmp(@Valid Employee employee) {
        int nums = employeeService.updateEmployee(employee);
        if (nums != -1) {//保存成功
            return Message.success();
        } else {//保存失败
            return Message.fail();
        }
    }

    /**
     * 删除员工
     *
     * @param empIds 员工id，id之间用 "-" 分隔
     * @return 返回删除的结果
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}", method = RequestMethod.DELETE)
    public Message delEmployees(@PathVariable("ids") String empIds) {
        //如果没有 - ，说明只要删除一个员工
        if (!empIds.contains("-")) {
            int nums = employeeService.deleteEmployeeById(Integer.parseInt(empIds));
            if (nums != -1) {
                return Message.success();
            } else {
                return Message.fail();
            }
        }

        //批量删除
        //先把字符串转成Integer数组
        String[] ids = empIds.split("-");
        ArrayList<Integer> idList = new ArrayList<>(ids.length);
        for (String id : ids) {
            idList.add(Integer.parseInt(id));
        }
        int nums = employeeService.deleteEmployees(idList);
        //如果影响的数据行数等于id个数，说明全部删除成功，反之则没有全部删除成功
        if (nums == ids.length) {
            return Message.success();
        } else {
            return Message.fail();
        }
    }
}
