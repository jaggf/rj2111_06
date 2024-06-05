<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/1/2
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybean.BaseDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page"/>
<html>
<head>
    <title>工资信息</title>
</head>
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cheye2.css">
<style type="text/css">
</style>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-10">
            <%
                try{
                    String emsa="SELECT eid,eusername,basesalary,fullwork,month,fivetax,persontax,totalsalary,incumbency,year FROM salary WHERE eid='"+session.getAttribute("userNames")+"' order by CAST(month AS SIGNED) DESC,year DESC;";
                    ResultSet rs= bd.getRs(emsa);//员工档案数据库读取
                    while (rs.next()){
            %>
            <table class="table table-hover table-light">
                <tr class="table-primary">
                    <hr>
                        <h4 style="text-align: center"><%=rs.getString(10)%>年<%=rs.getString(5)%>月份工资</h4>
                </tr>
                <tr class="table-success">
                    <td>员工编号：</td>
                    <td><%=rs.getString(1)%></td>
                </tr>
                <tr class="table-danger">
                    <td>姓名：</td>
                    <td><%=rs.getString(2) %></td>
                </tr>
                <tr class="table-info">
                    <td>基本工资：</td>
                    <td><%=rs.getString(3) %></td>
                </tr>
                <tr class="table-warning">
                    <td>全勤工资：</td>
                    <td><%=rs.getString(4) %></td>
                </tr>
                <tr class="table-light">
                    <td>月份：</td>
                    <td><%=rs.getString(5) %></td>
                </tr>
                <tr class="table-success">
                    <td>五险扣款：</td>
                    <td><%=rs.getString(6) %></td>
                </tr>
                <tr class="table-warning">
                    <td>个税扣款：</td>
                    <td><%=rs.getString(7) %></td>
                </tr>
                <tr class="table-info">
                    <td>实发工资：</td>
                    <td><%=rs.getString(8) %></td>
                </tr>
                <tr class="table-danger">
                    <td>就职情况：</td>
                    <td><%=rs.getString(9) %></td>
                </tr>
            </table>
            <%
                    }
                    bd.closeConn();
                }
                catch(ClassNotFoundException e) {
                    out.println(e.getMessage());
                }
                catch(SQLException e) {
                    out.println(e.getMessage());
                }
            %>
        </div>
    </div>
</div>
</body><script src="${pageContext.request.contextPath}/static/js/cheye2.js"></script>

</html>
