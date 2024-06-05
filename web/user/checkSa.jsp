<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/11/1
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
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
    <title>用户列表</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    .one{
        margin: 10px auto;
    }
</style>
<body>
<div class="one">
    <div class="container">
        <form action="${pageContext.request.contextPath}/MegsCollection?method=search" method="post" class="mb-3">
            <div class="row">
                <div class="col-md-2">
                    <input type="number" name="id" placeholder="公告ID" class="form-control">
                </div>
                <div class="col-md-2">
                    <input type="text" name="title" placeholder="标题" class="form-control">
                </div>
                <div class="col-md-2">
                    <input type="text" name="publishtime" placeholder="发布日期" class="form-control">
                </div>
                <%--            <div class="col-md-2">--%>
                <%--                <input type="text" name="education" placeholder="学历" class="form-control">--%>
                <%--            </div>--%>
                <%--            <div class="col-md-2">--%>
                <%--                <input type="text" name="incumbencytype" placeholder="任职形式" class="form-control">--%>
                <%--            </div>--%>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary">查询</button>
                </div>
            </div>
        </form>
        <form action="${pageContext.request.contextPath}/MegsCollection?method=moreDelete" method="post">
            <table class="table">
                <thead>
                <tr>
                    <td><input type="checkbox" id="selectAll"></td>
                    <td>ID</td>
                    <td>标题</td>
                    <td>发布日期</td>
                    <td>序号</td>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("no") != null) {
                        ResultSet rs = (ResultSet) request.getAttribute("no");
                        while (rs.next()) {
                            String id = rs.getString("id");
                            String title = rs.getString("title");
                            String publishtime = rs.getString("publish_time");
                            String ordernum = rs.getString("order_num");

                %>
                <tr>
                    <td><input type="checkbox" name="ids" value="<%=id%>"></td>
                    <td><%=id%></td>
                    <td><%=title%></td>
                    <td><%=publishtime%></td>
                    <td><%=ordernum%></td>
                </tr>
                <%
                        }
                        rs.close();
                    }else {
                    }
                %>
                </tbody>
            </table>
            <button type="submit" class="btn btn-danger">删除选中</button>
        </form>
    </div>
</div>

<script>
    // 全选/取消全选
    document.getElementById("selectAll").addEventListener("change", function() {
        var checkboxes = document.getElementsByName("ids");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
</script>
</body>
</html>
