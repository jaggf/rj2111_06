<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/10/24
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查询列表</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div style="height: 5px"></div>
<div class="container">
    <%--    <h1>用户列表</h1>--%>
    <form action="${pageContext.request.contextPath}/search2" method="get" class="mb-3">
        <div class="row">
            <div class="col-md-2">
                <input type="text" name="username" placeholder="用户名" class="form-control">
            </div>
            <div class="col-md-2">
                <input type="text" name="branch" placeholder="部门" class="form-control">
            </div>
            <div class="col-md-2">
                <input type="text" name="politics" placeholder="政治面貌" class="form-control">
            </div>
            <div class="col-md-2">
                <input type="text" name="education" placeholder="学历" class="form-control">
            </div>
            <div class="col-md-2">
                <input type="text" name="incumbencytype" placeholder="任职形式" class="form-control">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary">查询</button>
            </div>
        </div>
    </form>
    <form action="${pageContext.request.contextPath}/delete" method="post">
        <table class="table">
            <thead>
            <tr>
                <th><input type="checkbox" id="selectAll"></th>
                <th>用户名</th>
                <th>部门</th>
                <th>政治面貌</th>
                <th>学历</th>
                <th>任职类型</th>
            </tr>
            </thead>
            <tbody>
            <%
                if (request.getAttribute("employee") != null) {
                    ResultSet rs = (ResultSet) request.getAttribute("employee");
                    while (rs.next()) {
                        String employeeid = rs.getString("EmployeeID");
                        String username = rs.getString("username");
                        String branch = rs.getString("branch");
                        String politics = rs.getString("politics");
                        String education = rs.getString("education");
                        String incumbencytype = rs.getString("incumbencytype");

            %>
            <tr>
                <td><input type="checkbox" name="ids" value="<%=employeeid%>"></td>
                <td><%=username%>
                </td>
                <td><%=branch%>
                </td>
                <td><%=politics%>
                </td>
                <td><%=education%>
                </td>
                <td><%=incumbencytype%>
                </td>
            </tr>
            <%
                    }
                    rs.close();
                } else {
                }
            %>
            </tbody>
        </table>
        <button type="submit" class="btn btn-danger">删除选中</button>
    </form>
</div>
<script>
    // 全选/取消全选
    document.getElementById("selectAll").addEventListener("change", function () {
        var checkboxes = document.getElementsByName("ids");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
</script>
</body>
</html>
