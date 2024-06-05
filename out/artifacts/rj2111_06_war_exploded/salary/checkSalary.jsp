<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/10/24
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/inc/title.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    .one {
        margin: 10px auto;
    }
</style>
<body>
<div class="one">
    <div class="container">
        <form action="${pageContext.request.contextPath}/SalaryCollection?method=search" method="post" class="mb-3">
            <div class="row">
                <div class="col-md-2">
                    <input type="text" name="eid" placeholder="员工ID" class="form-control">
                </div>
                <div class="col-md-2">
                    <input type="text" name="eusername" placeholder="姓名" class="form-control">
                </div>
                <div class="col-md-2">
                    <input type="text" name="month" placeholder="月份" class="form-control">
                </div>
                <div class="col-md-2">
                    <input type="text" name="year" placeholder="年份" class="form-control">
                </div>
                <%--            <div class="col-md-2">--%>
                <%--                <input type="text" name="education" placeholder="学历" class="form-control">--%>
                <%--            </div>--%>
                <%--            <div class="col-md-2">--%>
                <%--                <input type="text" name="incumbencytype" placeholder="任职形式" class="form-control">--%>
                <%--            </div>--%>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary" style="height: 38px"><i class="fa fa-search" aria-hidden="true"/></i> </button>
                </div>
            </div>
        </form>
        <form action="${pageContext.request.contextPath}/SalaryCollection?method=moreDelete" method="post">
            <table class="table">
                <thead>
                <tr>
                    <td><input type="checkbox" id="selectAll"></td>
                    <td>编&nbsp;&nbsp;&nbsp;&nbsp;号</td>
                    <td>员工id</td>
                    <td>姓&nbsp;&nbsp;&nbsp;&nbsp;名</td>
                    <td>基础工资</td>
                    <td>满勤奖金</td>
                    <td>年&nbsp;&nbsp;&nbsp;&nbsp;份</td>
                    <td>月&nbsp;&nbsp;&nbsp;&nbsp;份</td>
                    <td>五&nbsp;&nbsp;&nbsp;&nbsp;险</td>
                    <td>个&nbsp;&nbsp;&nbsp;&nbsp;税</td>
                    <td>实际工资</td>
                    <td>在职情况</td>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("sa") != null) {
                        ResultSet rs = (ResultSet) request.getAttribute("sa");
                        while (rs.next()) {
                            String eid = rs.getString("eid");
                            String num = rs.getString("num");
                            String eusername = rs.getString("eusername");
                            String basesalary = rs.getString("basesalary");
                            String fullwork = rs.getString("fullwork");
                            String year = rs.getString("year");
                            String month = rs.getString("month");
                            String fivetax = rs.getString("fivetax");
                            String persontax = rs.getString("persontax");
                            String totalsalary = rs.getString("totalsalary");
                            String incumbency = rs.getString("incumbency");
                %>
                <tr>
                    <td><input type="checkbox" name="ids" value="<%=num%>"></td>
                    <td><%=num%>
                    </td>
                    <td><%=eid%>
                    </td>
                    <td><%=eusername%>
                    </td>
                    <td><%=basesalary%>
                    </td>
                    <td><%=fullwork%>
                    </td>
                    <td><%=year%>
                    </td>
                    <td><%=month%>
                    </td>
                    <td><%=fivetax%>
                    </td>
                    <td><%=persontax%>
                    </td>
                    <td><%=totalsalary%>
                    </td>
                    <td><%=incumbency%>
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
            <button  type="submit" class="btn btn-danger" title="<%=pschu%>">
                <i class="fa fa-list" aria-hidden="true"/></i>
                <i class="fa fa-remove" aria-hidden="true"/></i>
            </button>
        </form>
    </div>
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
