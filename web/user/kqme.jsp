<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/1/2
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page"/>
<%@ page import="mybean.BaseDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>考勤信息</title>
</head>
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js" type="text/javascript"
        charset="utf-8"></script>
<style type="text/css">
</style>
<body>
<div>
    <table align="center" width="1500">
        <tr class="table">
            <% try {
                String strSql = "SELECT num,eid,ename,uptime,downtime,date,incu FROM kaoqin WHERE eid='" + session.getAttribute("userNames") + "' order by num desc";
                ResultSet rs = bd.getRs(strSql);
                if (rs.next()) {
            %>
            <td height="50">
                <form action="${pageContext.request.contextPath}/daka1" method="post">
                    <input class="text text-success text-center" name="eid" type="text" title="员工编号"
                           value="<%=rs.getString(2)%>">
                    <input class="text text-dark text-center" name="ename" type="text" title="员工姓名"
                           value="<%=rs.getString(3)%>">
                    <button class="btn btn-outline-primary border-success" type="submit">上班打卡</button>
                </form>
            </td>
            <td height="50">
                <form action="${pageContext.request.contextPath}/daka2" method="post">
                    <input name="num" type="text" placeholder="打卡编号" title="打卡编号">
                    <input name="ename" type="text" value="<%=rs.getString(3)%>" title="员工姓名">
                    <button class="btn btn-outline-success border-primary" type="submit">下班打卡</button>
                </form>
            </td>
        </tr>
    </table>
</div>
<div class="">
    <table class="table" align="center" width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="850">
                <center>
                    <h2><%=rs.getString(3)%>的考勤信息</h2>
                </center>
                <table style="text-align: center" class="table table-hover" border="1" align="center" border="0"
                       cellpadding="2" cellspacing="1">
                    <tr class="bg-info" height="30">
                        <th>打卡编号</th>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>上班打卡</th>
                        <th>下班打卡</th>
                        <th>工作日期</th>
                        <th>就职情况</th>
                    </tr>
                    <%
                        }
                        int p;
                        int pagecount = 3;
                        int p2 = 1;
                        int rowcount;
                        int intpagecount;
                        String page1 = request.getParameter("page");
                        if (page1 == null) {
                            p = 1;
                        } else if (page1 == "") {
                            p = 1;
                        } else {
                            p = Integer.parseInt(page1);
                        }
                        rs.last();
                        rowcount = rs.getRow();
                        intpagecount = (rowcount + pagecount - 1) / pagecount;
                        if (p > intpagecount) p = intpagecount;
                        if (p < 1) p = 1;
                        rs.beforeFirst();
                        while (rs.next()) {
                            if (p2 > (p - 1) * pagecount && p2 <= p * pagecount) {
                    %>
                    <tr height="30" bgcolor="#ffffff" align="center">
                        <td><%=rs.getString(1) %>
                        </td>
                        <td><%=rs.getString(2) %>
                        </td>
                        <td><%=rs.getString(3) %>
                        </td>
                        <td><%=rs.getString(4) %>
                        </td>
                        <td><%=rs.getString(5) %>
                        </td>
                        <td><%=rs.getString(6) %>
                        </td>
                        <td><%=rs.getString(7) %>
                        </td>
                    </tr>
                    <%
                            }
                            p2++;
                        }
                    %>
                </table>
            </td>
        </tr>
    </table>
</div>
<div class="text-center">
    <div class="pagination">
        <ul class="pagination justify-content-center">
            <% if (intpagecount > 1) { %>
            <li class="page-item <% if (p == 1) { %>disabled <% } %>">
                <a class="page-link" href="kqme.jsp?page=<%= p - 1 %>">上一页</a>
            </li>
            <% }
                for (int i = 1; i <= intpagecount; i++) {
            %>
            <li class="page-item <% if (p == i) { %>active <% } %>">
                <a class="page-link" href="kqme.jsp?page=<%= i %>"><%= i %></a>
            </li>
            <% }
                if (intpagecount > 1) { %>
            <li class="page-item <% if (p == intpagecount) { %>disabled <% } %>">
                <a class="page-link" href="kqme.jsp?page=<%= p + 1 %>">下一页</a>
            </li>
            <% } %>
        </ul>
    </div>
</div>
    <%
        rs.close();
        bd.closeConn();
    } catch (ClassNotFoundException e) {
        out.println(e.getMessage());
    } catch (SQLException e) {
        out.println(e.getMessage());
    }
    %>
</html>
