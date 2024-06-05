<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/11/6
  Time: 19:36
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
        <form action="${pageContext.request.contextPath}/KaoqinCollection?method=search" method="post" class="mb-3">
            <div class="row">
                <div class="col-md-2">
                    <input type="text" name="date" placeholder="日期" class="form-control">
                </div>
                <div class="col-md-2">
                    <input type="text" name="eid" placeholder="id" class="form-control">
                </div>
                <div class="col-md-2">
                    <input type="text" name="ename" placeholder="姓名" class="form-control">
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
        <form action="${pageContext.request.contextPath}/KaoqinCollection?method=moreDelete" method="post">
            <table class="table">
                <thead>
                <tr>
                    <td><input type="checkbox" id="selectAll"></td>
                    <td>员工编号</td>
                    <td>员工姓名</td>
                    <td>日&nbsp;&nbsp;&nbsp;&nbsp;期</td>
                    <td>上班打卡</td>
                    <td>下班打卡</td>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("no") != null) {
                        ResultSet rs = (ResultSet) request.getAttribute("no");
                        while (rs.next()) {
                            String num = rs.getString("num");
                            String date = rs.getString("date");
                            String eid = rs.getString("eid");
                            String ename = rs.getString("ename");
                            String uptime = rs.getString("uptime");
                            String downtime = rs.getString("downtime");

                %>
                <tr>
                    <td><input type="checkbox" name="ids" value="<%=num%>"></td>
                    <td><%=eid%></td>
                    <td><%=ename%></td>
                    <td><%=date%></td>
                    <td><%=uptime%></td>
                    <td><%=downtime%></td>
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
