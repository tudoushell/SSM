<%--
  Created by IntelliJ IDEA.
  User: happy
  Date: 2019-07-15
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <meta charset="UTF-8">
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <style>
        #message-info,#edit-info{
            display: none;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- 员工修改 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="edit_emp_info">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="alert alert-success" id="edit-info" role="alert" >修改成功</div>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form>
<%--                        <div class="form-group">--%>
<%--                            <label class="col-sm-2 control-label">姓名</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <p class="form-control-static">email@example.com</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="form-group">
                            <label for="emp-name">姓名</label>
                            <p type="text" id="edit-emp-name" name="empName">asdfas</p>
                        </div>
                        <div class="form-group">
                            <label for="input-email">Email</label>
                            <input type="email" class="form-control"  name="email" placeholder="Email">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-2">
                                    <label>性别</label>
                                </div>
                                <div class="col-xs-8">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" checked  id="inlineRadio1" value="0"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="inlineRadio2" value="1"> 女
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="list-dept">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary"  id="update-emp">更新</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 新增员工弹出框 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="add_emp_info">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="alert alert-success" id="message-info" role="alert" >添加成功</div>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="emp-name">姓名</label>
                            <input type="text" class="form-control" id="emp-name" name="empName" placeholder="姓名">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <label for="input-email">Email</label>
                            <input type="email" class="form-control" id="input-email" name="email" placeholder="Email">
                            <span class="help-block"></span>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-2">
                                    <label>性别</label>
                                </div>
                                <div class="col-xs-8">
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" checked   value="0"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender"  value="1"> 女
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                               <label class="col-sm-2 control-label">部门</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="dId" id="choose-dept">
                                    </select>
                                </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary"  id="add-emp">添加</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12 col-xs-12">
            <h2>部门管理</h2>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-6 col-xs-6 col-md-offset-10">
            <button class="btn btn-success" id="add_emp" data-toggle="modal">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <!-- 员工信息 -->
    <div class="row">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>姓名</th>
                <th>性别</th>
                <th>邮箱</th>
                <th>部门名</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <!-- 分页 -->
    <div class="row">
        <div class="col-md-6 col-xs-6" id="pageInfo">
        </div>
        <div class="col-md-6 col-xs-6" id="navigation">
        </div>
    </div>
</div>
<script src="static/js/jquery-3.3.1.js"></script>
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
<script>
    pagination(1)
    //分页
    function pagination(pageNo){
        $.ajax({
            type: "GET",
            url: "/emps?pageNo=" + pageNo,
            dataType: "json",
            success: function (result) {
                //列出员工信息
                listEmp(result)
                //页面信息
                listPage(result)
            }
        })
    }

    function listEmp(result){
        $('tbody').children().remove()
        var emps = result.resultMap.pageInfo.list
        var htmlStr = ""
        $.each(emps, function (index,emp) {
           htmlStr += "<tr>";
           htmlStr += "<td>" + emp.empId + "</td>"
           htmlStr += "<td>" + emp.empName + "</td>"
            if (emp.gender === "0"){
                htmlStr += "<td>男</td>"
            }else {
                htmlStr += "<td>女</td>"
            }
           htmlStr += "<td>" + emp.email + "</td>"
           htmlStr += "<td>" + emp.dept.deptName + "</td>"
           htmlStr += "<td>"
           htmlStr += "<button class=\"btn btn-success btn-sm editor-btn\">"
           htmlStr += "<span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span>"
           htmlStr +=  " 修改</button> "
           htmlStr += "<button class=\"btn btn-danger btn-sm\">"
           htmlStr += "<span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span>"
           htmlStr +=  " 删除</button>"
           htmlStr += "</td>"
           htmlStr += "</tr>"
        });
        $('tbody').append(htmlStr);
    }
    
    function listPage(result) {
        $('#pageInfo').children().empty()
        $('#navigation').children().empty()
        var pageInfo = result.resultMap.pageInfo;
        var htmlStr = ""
        htmlStr += "<div>"
        htmlStr += "当前第<span class=\"label label-default\">" + pageInfo.pageNum + "</span>页,"
        htmlStr += "共有<span class=\"label label-default\">" + pageInfo.pages + "</span>页,"
        htmlStr += "总共<span class=\"label label-default\">" + pageInfo.total + "</span>条记录"
        htmlStr += "</div>"
        $('#pageInfo').append(htmlStr);

        //分页页码
        var pagination = "<nav aria-label=\"Page navigation\" >"
        pagination += "<ul class='pagination'>"
        pagination += "<li><a href='javascript:pagination(1)'>首页</a></li>"
        if (pageInfo.isFirstPage){ //是第一页
            pagination += "<li class='disabled'>"
            pagination += "<a href='javascript:;' aria-label='Previous'>"
        }else {
            pagination += "<li>"
            pagination += "<a href=\"javascript:pagination('"+ (pageInfo.pageNum - 1)  +"')\"  aria-label='Previous'>"
        }
        pagination += "<span aria-hidden='true'>&laquo;</span>"
        pagination += "</a>"
        pagination += "</li>"
        $.each(pageInfo.navigatepageNums, function (index, pageNum) {
            if (pageNum === pageInfo.pageNum){ //当前页码为活动页码
                pagination += "<li class=\"active\"><a href='javascript: pagination(" + pageNum + ")' >" + pageNum + "</a></li>"
            }else {
                pagination += "<li><a href=\"javascript:pagination('" + pageNum + "')\">" + pageNum + "</a></li>"
            }
        })
        if (pageInfo.isLastPage){ //是最后一页
            pagination += "<li class=\"disabled\">"
            pagination += " <a href=\"javascript:;\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a>"
        }else{
            pagination += "<li>"
            pagination += " <a href=\"javascript:pagination('"+ (pageInfo.pageNum + 1)  +"')\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a>"
        }
        pagination += "</li>"
        pagination += "<li><a href=\"javascript:pagination('" + pageInfo.pages + "')\">尾页</a></li>"
        pagination += "</ul>"
        pagination += "</nav>"
        $('#navigation').append(pagination)
    }

    //弹出添加员工框
    $('#add_emp').click(function () {
        clearStyle("#add_emp_info")
        //列出部门
        listDept("#choose-dept")
        //设置弹窗属性
        $('#add_emp_info').modal({
            backdrop: 'static',
        })
    })

    //添加员工信息
    $('#add-emp').click(function () {
        //用户输入校验
        if(! validateEmpInfo()){
            return ;
        }
        //获取用户输入的数据
        let data = $('#add_emp_info form').serialize()
        //发送ajax 请求 添加员工信息
        $.ajax({
            type: "POST",
            url: "/saveEmp",
            data: data,
            success: function (result) {
                if (result.code === "200"){ //添加成功
                    $('#message-info').fadeIn(700,function () {
                        $('#message-info').fadeOut(700,function () {
                            $('#add_emp_info').modal('hide')
                            pagination(999)
                        })
                    })
                }else { //添加失败
                        validateMsg("#input-email", "error", result.resultMap.error.email)
                }
            }
        })

    })

    //用于校验用户输入的信息
    $('#emp-name').change(function () {
        var empName = $(this).val()
        $.ajax({
            type: "Get",
            url: "/checkEmp?empName=" + empName,
            dataType: "json",
            success: function (result) {
                if (result.code === "500"){
                    validateMsg("#emp-name", "error", result.resultMap.info)
                    $('#add-emp').attr("disabled", true)
                }else{
                    validateMsg("#emp-name", "success", "")
                    $('#add-emp').attr("disabled", false)
                }
            }
        })
    })


    //用户输入的数据校验
    function validateEmpInfo(){
        //用户名校验
        var empName = $('#emp-name').val()
        var reg = /(^[a-z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/
        if(reg.test(empName)){
            validateMsg("#emp-name", "success", "")
        }else{
            validateMsg("#emp-name", "error", "姓名格式不正确")
            return false
        }

        //邮箱校验
        var email = $('#input-email').val()
        reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if (reg.test(email)){
            validateMsg("#input-email", "success", "")
            return true
        }else {
            validateMsg("#input-email", "error", "邮箱格式不正确")
            return false
        }
    }

    //校验返回信息
    function validateMsg(elem, status, msg){
        $(elem).parent().removeClass("has-success has-error")
        if (status === "success"){
            $(elem).parent().addClass("has-success")
            $(elem).parent().find("span").text(msg)
        }else{
            $(elem).parent().addClass("has-error")
            $(elem).parent().find("span").text(msg)
        }
    }

    //清除样式
    function clearStyle(elem) {
        //清空输入框的内容
        $(elem).find("form")[0].reset()
        $(elem).find("*").removeClass("has-success has-error")
        $(elem).find("span").text("")
    }

    //列出部门
    function listDept(elem){
        $.ajax({
            type: "Get",
            url: "/dept/listDept",
            dataType: "json",
            success: function (result) {
                var child = $(elem).children().remove()
                $(elem).append("<option>请选择</option>")
                var depts = result.resultMap.listDept
                $.each(depts, function (index, dept) {
                    var option = $("<option></option>").attr("value", dept.deptId).append(dept.deptName)
                    $(elem).append(option)
                })
            }
        })
    }
    //修改员工信息部分
    $(document).on("click", ".editor-btn", function () {
        listDept("#list-dept")
        var deptId = $(this).parent().parent().children(":first").text()
        //获取员工信息
        $.ajax({
            type: "GET",
            url: "/emp/" + deptId,
            dataType: "json",
            success: function (result) {
                
            }
        })
        //设置弹窗属性
        $('#edit_emp_info').modal({
            backdrop: 'static'
        })
    })
</script>
</body>
</html>
