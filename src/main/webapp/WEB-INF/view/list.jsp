<%--
  Created by IntelliJ IDEA.
  User: happy
  Date: 2019-07-21
  Time: 09:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <meta charset="UTF-8">
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <!-- 标题 -->
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <h2>部门管理</h2>
            </div>
        </div>
        <!-- 按钮 -->
        <div class="row">
            <div class="col-md-6 col-xs-6 col-md-offset-10">
                <button class="btn btn-success">新增</button>
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
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <td>${emp.empId}</td>
                            <td>${emp.empName}</td>
                            <td>${emp.gender == "0" ? "男": "女"}</td>
                            <td>${emp.email}</td>
                            <td>${emp.dept.deptName}</td>
                            <td>
                                <button class="btn btn-success btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    修改
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- 分页 -->
        <div class="row">
            <div class="col-md-6 col-xs-6">
                    当前第<span class="label label-default">${pageInfo.pageNum}</span>页，
                    共有<span class="label label-default">${pageInfo.pages}</span>页，
                    总共<span class="label label-default">${pageInfo.total}</span>条记录
            </div>
            <div class="col-md-6 col-xs-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination ">
                        <li><a href="/emps?pageNo=1">首页</a></li>
                        <c:choose>
                            <c:when test="${pageInfo.isFirstPage}">
                                <li class="disabled">
                                    <a href="/emps?pageNo=1" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="/emps?pageNo=${pageInfo.pageNum - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:choose>
                                <c:when test="${page_Num == pageInfo.pageNum}">
                                    <li class="active"><a href="/emps?pageNo=${page_Num}" >${page_Num}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="/emps?pageNo=${page_Num}">${page_Num}</a></li>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                        <c:choose>
                            <c:when test="${pageInfo.isLastPage}">
                                <li class="disabled">
                                    <a href="/emps?pageNo=${pageInfo.pages}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="/emps?pageNo=${pageInfo.pageNum + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <li><a href="/emps?pageNo=${pageInfo.pages}">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
<script src="static/js/jquery-3.3.1.js"/>
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.js"/>
</body>
</html>
