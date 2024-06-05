<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/1/2
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page"/>
<%@ page import="mybean.BaseDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="../inc/check.jsp"%>
<%@ include file="../inc/title.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人档案信息</title>
</head>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
</style>
</style>
<body>
<%
    try {
        String emfile = "SELECT EmployeeID,UserName,Sex,Branch,Birthday,NativePlace,Marriage,IdentityID,Politics,Folk,Education,Department,GraduateDate,University,Positions,Incumbency,IncumbencyType,Resume FROM employee WHERE EmployeeID='" + session.getAttribute("userNames") + "'";
        ResultSet rs = bd.getRs(emfile);//员工档案数据库读取
        while (rs.next()) {
%>
<div class="container">
            <table class="table" style="position: relative;left: -65px;top: 0px">
                <tr>
                    <td width="100"><a href="${pageContext.request.contextPath}/modfile1?id=<%=rs.getString(1) %>" class="btn btn-primary" title="<%=xg%>"> <i class="fa fa-edit" aria-hidden="true"/></i> </a></td>
                    <td> <table class="table table-bordered table-hover">
                        <tr class="table-primary">
                            <td colspan="2">
                                <h4><%=rs.getString(2)%>的档案信息</h4>
                            </td>
                        </tr>
                        <tr class="table-success">
                            <td>员工编号：</td>
                            <td><%=rs.getString(1) %>
                            </td>
                        </tr>
                        <tr class="table-danger">
                            <td>姓名：</td>
                            <td><%=rs.getString(2) %>
                            </td>
                        </tr>
                        <tr class="table-info">
                            <td>性别：</td>
                            <td><%=rs.getString(3) %>
                            </td>
                        </tr>
                        <tr class="table-warning">
                            <td>所属部门：</td>
                            <td><%=rs.getString(4) %>
                            </td>
                        </tr>
                        <tr class="table-light">
                            <td>出生日期：</td>
                            <td><%=rs.getString(5) %>
                            </td>
                        </tr>
                        <tr class="table-success">
                            <td>籍贯：</td>
                            <td><%=rs.getString(6) %>
                            </td>
                        </tr>
                        <tr class="table-warning">
                            <td>婚姻状况：</td>
                            <td><%=rs.getString(7) %>
                            </td>
                        </tr>
                        <tr class="table-info">
                            <td>身份证号：</td>
                            <td><%=rs.getString(8) %>
                            </td>
                        </tr>
                        <tr class="table-danger">
                            <td>政治面貌：</td>
                            <td><%=rs.getString(9) %>
                            </td>
                        </tr>
                        <tr class="table-success">
                            <td>民族：</td>
                            <td><%=rs.getString(10) %>
                            </td>
                        </tr>
                        <tr class="table-primary">
                            <td>学历：</td>
                            <td><%=rs.getString(11)%>
                            </td>
                        </tr>
                        <tr class="table-success">
                            <td>专业：</td>
                            <td><%=rs.getString(12) %>
                            </td>
                        </tr>
                        <tr class="table-info">
                            <td>毕业日期：</td>
                            <td><%=rs.getString(13) %>
                            </td>
                        </tr>
                        <tr class="table-danger">
                            <td>毕业院校：</td>
                            <td><%=rs.getString(14) %>
                            </td>
                        </tr>
                        <tr class="table-info">
                            <td>职称：</td>
                            <td><%=rs.getString(15) %>
                            </td>
                        </tr>
                        <tr class="table-warning">
                            <td>在职情况：</td>
                            <td><%=rs.getString(16) %>
                            </td>
                        </tr>
                        <tr class="table-primary">
                            <td>用工形式：</td>
                            <td><%=rs.getString(17) %>
                            </td>
                        </tr>
                        <tr class="table-light">
                            <td>个人简历：</td>
                            <td><%=rs.getString(18) %>
                            </td>
                        </tr>
                    </table></td>
                </tr>
            </table>
</div>
<%
        }
        bd.closeConn();
    } catch (ClassNotFoundException e) {
        out.println(e.getMessage());
    } catch (SQLException e) {
        out.println(e.getMessage());
    }
%>
</body>
<%--<script src="${pageContext.request.contextPath}/static/js/cheye2.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/static/js/showtime.js"></script>--%>
</html>
