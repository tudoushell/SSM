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
</head>
<body>
<div class="container">
    <!-- 弹出框 -->
    <div class="modal fade" tabindex="-1" role="dialog" id="add_emp_info">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="emp-name">姓名</label>
                            <input type="text" class="form-control" id="emp-name" name="empName" placeholder="姓名">
                        </div>
                        <div class="form-group">
                            <label for="input-email">Email</label>
                            <input type="email" class="form-control" id="input-email" name="email" placeholder="Email">
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
                                    <select class="form-control" name="dId">
                                        <option value="1">1</option>
                                    </select>
                                </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">添加</button>
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
        $('tbody').children().empty()
        var emps = result.resultMap.pageInfo.list
        var htmlStr = ""
        $.each(emps, function (index,emp) {
           htmlStr += "<tr>";
           htmlStr += "<td>" + emp.empId + "</td>"
           htmlStr += "<td>" + emp.empName + "</td>"
           htmlStr += "<td>" + emp.gender + "</td>"
           htmlStr += "<td>" + emp.email + "</td>"
           htmlStr += "<td>" + emp.dept.deptName + "</td>"
           htmlStr += "<td>"
           htmlStr += "<button class=\"btn btn-success btn-sm\">"
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
            pagination += "<a href='javascript:pagination(1)' aria-label='Previous'>"
        }else {
            pagination += "<li>"
            pagination += "<a href=\"javascript:pagination('"+ (pageInfo.pageNum - 1)  +"')\"  aria-label='Previous'>"
        }
        pagination += "<span aria-hidden='true'>&laquo;</span>"
        pagination += "</a>"
        pagination += "</li>"
        $.each(pageInfo.navigatepageNums, function (index, pageNum) {
            if (pageNum === pageInfo.pageNum){ //当前页码为蓝色
                pagination += "<li class=\"active\"><a href='javascript: pagination(" + pageNum + ")' >" + pageNum + "</a></li>"
            }else { //否则不是
                pagination += "<li><a href=\"javascript:pagination('" + pageNum + "')\">" + pageNum + "</a></li>"
            }
        })
        if (pageInfo.isLastPage){ //是最后一页
            pagination += "<li class=\"disabled\">"
            pagination += " <a href=\"javascript:pagination('" + pageInfo.pages + "')\" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span></a>"
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
        $('#add_emp_info').modal({
            backdrop: 'static',
        })
    })

</script>
</body>
</html>
