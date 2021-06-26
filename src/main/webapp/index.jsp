<!-- 引入jstl文件 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>员工信息</title>
    <!-- 静态包含头部文件 -->
    <%@include file="/common/head.jsp" %>
</head>
<body>
<!-- 页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>公司论坛-员工管理</h1>
        </div>
    </div>

    <!-- 添加员工的模态框 -->
    <div class="modal fade" id="emp-add-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加员工</h4>
                </div>
                <div class="modal-body">
                    <!-- 表单 -->
                    <form class="form-horizontal">
                        <!-- 用户名 -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <input type="text" name="name" class="form-control" id="empName-input"
                                       placeholder="用户名">
                                <!-- 提示信息 -->
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <!-- 性别 -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex1-input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex2-input" value="W"> 女
                                </label>
                            </div>
                        </div>
                        <!-- 邮箱 -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input name="email" type="text" class="form-control" id="email-input" placeholder="邮箱">
                                <!-- 提示信息 -->
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <!-- 部门 -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <select id="department-add-list" class="form-control" name="deptId">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="emp-add-submit-btn" class="btn btn-primary">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 修改员工信息的模态框 -->
    <div class="modal fade" id="emp-edit-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改员工信息</h4>
                </div>
                <div class="modal-body">
                    <!-- 表单 -->
                    <form class="form-horizontal">
                        <!-- 用户名 -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <input type="text" name="name" class="form-control" id="empName-edit" placeholder="用户名">
                                <!-- 提示信息 -->
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <!-- 性别 -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex1-edit" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex2-edit" value="W"> 女
                                </label>
                            </div>
                        </div>
                        <!-- 邮箱 -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input name="email" type="text" class="form-control" id="email-edit" placeholder="邮箱">
                                <!-- 提示信息 -->
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <!-- 部门 -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <select id="department-edit-list" class="form-control" name="deptId">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="emp-edit-submit-btn" class="btn btn-primary">提交</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button id="emp-add-modal_btn" class="btn btn-primary">新增</button>
            <button id="emps-del-btn" class="btn btn-danger">删除</button>
        </div>
    </div>

    <!-- 表格 -->
    <div class="row">
        <div class="col-md-12">
            <table id="emp-table" class="table table-hover">
                <!-- 表头 -->
                <thead>
                <tr>
                    <th>
                        <!-- 批量删除的按钮 -->
                        <input id="emp-del-check-all" type="checkbox"/>
                    </th>
                    <th>id</th>
                    <th>用户名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>

                <!-- 表数据 -->
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <!-- 分页 -->
    <div class="row">
        <!-- 分页信息 -->
        <div id="page-info-area" class="col-md-6">

        </div>

        <!-- 分页条 -->
        <div id="page-nav-area" class="col-md-6">

        </div>
    </div>
</div>

<script type="text/javascript">
    /**
     * jquery的function
     */
    $(function () {
        toPage(1);//进来就先访问第一页
    });

    /**
     * 跳转到指定页
     * @param pageNum 要跳转的页码
     */
    function toPage(pageNum) {
        //发送ajax请求，获取员工信息
        $.getJSON(
            '${pageScope.APP_PATH}/emps',
            'pageNum=' + pageNum,
            function (data) {
                buildEmpTable(data);//填充表格
                buildPageInfo(data);//填充分页信息
                BuildPageNav(data);//填充分页条
            }
        );
    }

    /**
     * 填充员工表
     * @param data 服务器回传的json数据
     */
    function buildEmpTable(data) {
        //先清空表格
        $('#emp-table tbody').empty();
        let employees = data.extend.pageInfo.list;//取出员工数组
        //遍历，填充员工信息到表格
        $.each(employees, function (index, item) {
            //拼串
            let checkBox = $('<td></td>').append($('<input type="checkbox"/>').addClass('emp-del-check'));
            let empIdTd = $('<td></td>').append(item.id);//id
            let empNameTd = $('<td></td>').append(item.name);//name
            let empSexTd = $('<td></td>').append(item.sex == 'M' ? '男' : '女');//sex
            let empEmailTd = $('<td></td>').append(item.email);//email
            let empDepartmentTd = $('<td></td>').append(item.department.name);//department
            let editBtn = $('<button></button>').addClass('btn btn-primary btn-sm emp-edit-btn')
                .append($('<span></span>').addClass('glyphicon glyphicon-pencil').append('编辑'));//编辑按钮
            editBtn.attr('empId', item.id);//给编辑按钮添加员工id的属性
            let delBtn = $('<button></button>').addClass('btn btn-danger btn-sm emp-del-btn')
                .append($('<span></span>').addClass('glyphicon glyphicon-trash').append('删除'));//删除按钮
            delBtn.attr('empId', item.id);//给编辑按钮添加员工id的属性
            let empBtnTd = $('<td></td>').append(editBtn).append(' ').append(delBtn);//把按钮放在一个td里面
            //把上面的元素都放到tr里面
            $('<tr></tr>')
                .append(checkBox)
                .append(empIdTd)
                .append(empNameTd)
                .append(empSexTd)
                .append(empEmailTd)
                .append(empDepartmentTd)
                .append(empBtnTd)
                .appendTo('#emp-table tbody');
        });
    }

    /**
     * 填充分页信息
     * @param data 服务器回传的json数据
     */
    function buildPageInfo(data) {
        let pageInfoArea = $('#page-info-area');

        //先清空分页信息
        pageInfoArea.empty();
        let pageInfo = data.extend.pageInfo;
        pageInfoArea
            .append('当前' + pageInfo.pageNum + '页，共' + pageInfo.pages + '页，共' + pageInfo.total + '条记录');
    }

    /**
     * 填充分页条
     * @param data 服务器回传的json数据
     */
    function BuildPageNav(data) {
        $('#page-nav-area').empty();//先清空分页条
        let pageInfo = data.extend.pageInfo;//先取出pageInfo

        let ul = $('<ul></ul>').addClass('pagination');//ul
        let firstPageLi = $('<li></li>').append($('<a></a>').append('首页').attr('href', '#'));//首页
        let prePageLi = $('<li></li>').append($('<a></a>').append('&laquo;').attr('href', '#'));//上一页
        let nextPageLi = $('<li></li>').append($('<a></a>').append('&raquo;').attr('href', '#'));//下一页
        let lastPageLi = $('<li></li>').append($('<a></a>').append('末页').attr('href', '#'));//末页
        //如果没有上一页，就设置为不可用状态
        if (!pageInfo.hasPreviousPage) {
            firstPageLi.addClass('disabled');
            prePageLi.addClass('disabled');
        } else {
            //给首页添加单击事件
            firstPageLi.click(function () {
                toPage(1);
            });
            //给上一页添加单击事件
            prePageLi.click(function () {
                toPage(pageInfo.pageNum - 1);
            });
        }
        //如果没有下一页，就设置为不可用状态
        if (!pageInfo.hasNextPage) {
            nextPageLi.addClass('disabled');
            lastPageLi.addClass('disabled');
        } else {
            //给下一页添加单击事件
            nextPageLi.click(function () {
                toPage(pageInfo.pageNum + 1);
            });
            //给末页添加单击事件
            lastPageLi.click(function () {
                toPage(pageInfo.pages);
            });
        }

        ul.append(firstPageLi).append(prePageLi);//先把首页和上一页放进来
        //生成页码
        $.each(pageInfo.navigatepageNums, function (index, item) {
            let numLi = $('<li></li>').append($('<a></a>').append(item).attr('href', '#'));
            //如果是当前页，就设置为激活状态
            if (pageInfo.pageNum == item) {
                numLi.addClass('active');
            }
            //给页码添加单击事件
            numLi.click(function () {
                toPage(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);//再把下一页和末页放进来

        let navEle = $('<nav></nav>').append(ul);//分页条
        navEle.appendTo('#page-nav-area');//把分页条放到分页条的div中
    }

    /**
     * 给新增按钮添加单击事件
     */
    $('#emp-add-modal_btn').click(function () {
        getDepartments('#department-add-list');//获取部门信息，并填充到下拉菜单中
        //弹出模态框
        $('#emp-add-modal').modal({
            backdrop: 'static'
        });
    });

    /**
     * 获取部门信息，并填充到下拉菜单中
     * @param ele 要把部门信息填充到哪个表单中
     */
    function getDepartments(ele) {
        $.getJSON(
            '${pageScope.APP_PATH}/depts',
            '',
            function (data) {
                $(ele).empty();
                let departmentList = data.extend.departmentList;
                //将部门信息填充到下拉菜单中
                $.each(departmentList, function (index, item) {
                    $(ele).append($('<option></option>').append(item.name).attr('value', item.id));
                });
            }
        );
    }

    /**
     * 添加员工的提交按钮
     */
    $('#emp-add-submit-btn').click(function () {
        //检验用户名是否存在
        if ($('#emp-add-submit-btn').attr('ajax-va') === 'error') {
            return false;
        }

        // 检验表单信息是否合法
        // 如果不合法
        let eles = ['#empName-input', '#email-input'];
        if (!validateAddForm(eles)) {
            return false;
        }

        $.post(
            '${pageScope.APP_PATH}/emp',
            $('#emp-add-modal form').serialize(),//序列化表单
            function (data) {
                //如果添加失败
                if (data.code == 2) {
                    alert('出错了，添加用户失败，非常抱歉');
                    console.log(data.extend.errorMsg);
                    if (data.extend.errorMsg.name != null) {//如果用户名字段出错了
                        showValidateMsg('#empName-input', 'error', '用户名不合法');
                    }
                    if (data.extend.errorMsg.email != null) {//如果邮箱字段出错了
                        showValidateMsg('#email-input', 'error', '邮箱不合法');
                    }
                    return false;
                }
                $('#emp-add-modal').modal('hide');//隐藏模态框
                toPage(16777216);//跳转到最后一页
                $('#emp-add-submit-btn').attr('ajax-va', 'error');
            },
            'json'
        );
    });

    /**
     * 检验表单信息是否合法
     * @param eles 要检验信息的元素，第一个是姓名输入框，第二个是邮箱输入框
     * @return 返回一个布尔值
     */
    function validateAddForm(eles) {
        //检验用户名是否合法
        let namePattern = /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/;
        if (!namePattern.test($(eles[0]).val())) {//如果用户名不合法
            showValidateMsg(eles[0], 'error', '用户名不合法');
            return false;
        } else {
            showValidateMsg(eles[0], 'success', '');
        }

        //检验邮箱
        let emailPattern = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
        if (!emailPattern.test($(eles[1]).val())) {//如果邮箱不合法
            showValidateMsg(eles[1], 'error', '邮箱不合法');
            return false;
        } else {
            showValidateMsg(eles[1], 'success', '');
        }

        return true;
    }

    /**
     * 显示校验信息
     * @param ele 要显示校验信息的元素
     * @param status 要显示的状态
     * @param msg 要显示的信息
     */
    function showValidateMsg(ele, status, msg) {
        $(ele).parent().removeClass('has-error has-success');//移出样式
        //如果校验成功
        if ('error' === status) {
            $(ele).parent().addClass('has-error');//添加样式
        } else if ('success' === status) {
            $(ele).parent().addClass('has-success');//添加样式
        }
        $(ele).next().text(msg);//添加提示信息
    }

    /**
     * 给添加员工信息的姓名输入框绑定改变事件
     */
    $('#empName-input').change(function () {
        existEmpName('#empName-input', '#emp-add-submit-btn');//检验用户名是否存在
    });

    /**
     * 检验用户名是否存在
     * @param nameInput 姓名的input
     * @param submitBtn 提交按钮
     */
    function existEmpName(nameInput, submitBtn) {
        $.getJSON(
            '${pageScope.APP_PATH}/checkUserExist',
            'empName=' + $(nameInput).val(),
            function (data) {
                if (data.code == 2) {//如果失败
                    showValidateMsg(nameInput, 'error', '用户名已存在');
                    //给提交按钮添加属性，标记用户名是否存在
                    $(submitBtn).attr('ajax-va', 'error');
                    return false;
                } else if (data.code == 1) {//如果成功
                    showValidateMsg(nameInput, 'success', '');
                    //给提交按钮添加属性，标记用户名是否存在
                    $(submitBtn).attr('ajax-va', 'success');
                }
            }
        );
    }

    /**
     * 给编辑按钮添加单击事件
     */
    $(document).on('click', 'button.emp-edit-btn', function () {
        getDepartments('#department-edit-list');//填充部门信息
        getEmployee($(this).attr('empId'));//填充员工信息
        $('#emp-edit-submit-btn').attr('empId', $(this).attr('empId'));//把员工id传给提交按钮
        //弹出模态框
        $('#emp-edit-modal').modal({
            backdrop: 'static'
        });
    });

    /**
     * 获取员工信息
     * @param 要获取的员工信息id
     */
    function getEmployee(id) {
        let empNameEdit = $('#empName-edit');//员工姓名编辑输入框
        let emailEdit = $('#email-edit');//邮箱编辑输入框

        $.getJSON(
            '${pageScope.APP_PATH}/emp/' + id,
            '',
            function (data) {
                let employee = data.extend.employee;
                empNameEdit.empty();//清空用户名
                empNameEdit.val(employee.name);//填充用户名
                empNameEdit.attr('oldName', employee.name);//记录更改前的用户名
                $('#emp-edit-modal input[name=sex]').val([employee.sex]);//选定性别
                emailEdit.empty();//清空邮箱
                emailEdit.val(employee.email);//填充邮箱
                $('#department-edit-list').val([employee.deptId]);//填充部门
            }
        );
    }

    /**
     * 给修改员工信息的姓名输入框绑定改变事件
     */
    $('#empName-edit').change(function () {
        existEmpName('#empName-edit', '#emp-edit-submit-btn');//检验用户名是否存在
    });

    /**
     * 给修改员工信息的姓名输入框绑定失去焦点事件
     */
    $('#empName-edit').blur(function () {
        let empNameEdit = $('#empName-edit');//员工姓名编辑输入框

        //如果用户名和修改前的一样，就不用显示错误信息
        if (empNameEdit.val() === empNameEdit.attr('oldName')) {
            showValidateMsg('#empName-edit', 'success', '');
            $('#emp-edit-submit-btn').attr('ajax-va', 'success');
        }
    });

    /**
     * 给修改员工信息的提交按钮绑定单击事件
     */
    $('#emp-edit-submit-btn').click(function () {
        let empNameEdit = $('#empName-edit');//用户名输入框
        let empEditSubmitBtn = $('#emp-edit-submit-btn');//提交按钮

        //如果用户名和修改前的一样，就不用显示错误信息
        if (empNameEdit.val() === empNameEdit.attr('oldName')) {
            showValidateMsg('#empName-edit', 'success', '');
            empEditSubmitBtn.attr('ajax-va', 'success');
        }

        //如果用户名和以前的不一样，并且用户名已存在
        if (empNameEdit.val() !== empNameEdit.attr('oldName') && empEditSubmitBtn.attr('ajax-va') === 'error') {
            return false;
        }

        // 检验表单信息是否合法
        // 如果不合法
        let eles = ['#empName-edit', '#email-edit'];
        if (!validateAddForm(eles)) {
            return false;
        }

        $.post(
            '${pageScope.APP_PATH}/emp/' + empEditSubmitBtn.attr('empId'),
            $('#emp-edit-modal form').serialize() + '&_method=PUT',//序列化表单
            function (data) {
                //如果添加失败
                if (data.code == 2) {
                    alert('出错了，修改用户信息失败，非常抱歉');
                }
                $('#emp-edit-modal').modal('hide');//隐藏模态框
                toPage($('#page-nav-area li.active').text());//跳转回修改时的页码
                empEditSubmitBtn.attr('ajax-va', 'error');
            },
            'json'
        );
    });

    /**
     * 给单个删除按钮绑定单击事件
     */
    $(document).on('click', 'button.emp-del-btn', function () {
        let empId = $(this).parent().parent().find('td:eq(1)').text();
        let empName = $(this).parent().parent().find('td:eq(2)').text();
        if (confirm('确定要删除[id=' + empId + ',name=' + empName + ']吗')) {
            $.post(
                '${pageScope.APP_PATH}/emp/' + empId,
                '_method=DELETE',
                function (data) {
                    //如果删除失败
                    if (data.code == 2) {
                        alert('出错了，删除用户失败，非常抱歉');
                        return false;
                    }
                    toPage($('#page-nav-area li.active').text());//跳转回删除时的页码
                },
                'json'
            );
        }
    });

    /**
     * 给全选按钮绑定单击事件
     */
    $('#emp-del-check-all').click(function () {
        $('input.emp-del-check').prop('checked', $('#emp-del-check-all').prop('checked'));
    });

    /**
     * 给单选按钮绑定单击事件
     */
    $(document).on('click', 'input.emp-del-check', function () {
        let isCheckAll = $('input.emp-del-check:checked').length === $('input.emp-del-check').length
        $('#emp-del-check-all').prop('checked', isCheckAll);
    });

    /**
     * 给批量删除按钮绑定单击事件
     */
    $(document).on('click', '#emps-del-btn', function () {
        let empIds = ''//保存要删除的id
        let notice = '';//删除的提示信息
        $.each($('input.emp-del-check:checked'), function () {
            empIds = empIds + $(this).parent().parent().find('td:eq(1)').text() + '-';
            notice = notice + $(this).parent().parent().find('td:eq(2)').text() + ' ';
        });
        empIds = empIds.substring(0, empIds.length - 1);

        if (confirm('确定要删除[' + notice + ']吗')) {
            $.post(
                '${pageScope.APP_PATH}/emp/' + empIds,
                '_method=DELETE',
                function (data) {
                    //如果删除失败
                    if (data.code == 2) {
                        alert('出错了，没有全部删除成功，非常抱歉');
                        return false;
                    }
                    toPage($('#page-nav-area li.active').text());//跳转回删除时的页码
                },
                'json'
            );
        }
    });

</script>
</body>
</html>
