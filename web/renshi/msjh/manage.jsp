<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/30
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,mybean.BaseDAO" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page"/>
<%@ include file="../../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cheye.css">
<script src="${pageContext.request.contextPath}/static/js/cheye.js"></script>
<style type="text/css">
    body {
        background-attachment: fixed;
        height: 100%;
        background-image: linear-gradient(#ffd7df, #ffffff);
    }
</style>
<body>
<div class="">
    <table width="1024" height="30" border="0" align="center" cellpadding="0" cellspacing="0" background="">
        <tr>
            <td style="text-align: left"><font color="blue"><strong><%=session.getAttribute("userName") %>
            </strong></font>，欢迎您使用人事管理平台！</td>
            <td align="right">
                <a href="${pageContext.request.contextPath}/renshi/msjh/manage.jsp"><span class="STYLE1 badge bg-warning text-light">&nbsp;Web人事管理平台</span></a>
                <span class="STYLE1">&nbsp;|&nbsp; </span>
                <a href="mailto:2460958118@qq.com">
                    <span class="STYLE1 badge bg-secondary text-light">与版主交流</span></a>
                <span class="STYLE1">&nbsp;|&nbsp; &nbsp; </span>
                <a href="../../inc/exit.jsp">
                    <span class="STYLE1 badge bg-warning text-light">退出系统管理</span></a>
            </td>
        </tr>
    </table>
</div>

<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a class="badge badge-light" href="${pageContext.request.contextPath}/renshi/msjh/manage.jsp">管理面试信息</a>
    <a href="${pageContext.request.contextPath}/renshi/msjh/rsaddms.jsp">添加面试信息</a>
    <a href="${pageContext.request.contextPath}/renshi/zpxq/managexq.jsp">管理招聘信息</a>
    <a href="${pageContext.request.contextPath}/renshi/zpxq/addxq.jsp">添加招聘信息</a>
    <a href="${pageContext.request.contextPath}/renshi/kq/managekaoqin.jsp">管理考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/kq/addkaoqin.jsp">添加考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/managejx.jsp">管理员工绩效信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/addjx.jsp">添加员工绩效信息</a>
</div>
<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>

<div class="">
    <table class="table" width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="850">
                <%
                    try {
                        String strSql = "SELECT num,em,tel,time,msg,zt,jg FROM ms WHERE zt='已结束'";
                        ResultSet rs = bd.getRs(strSql);
                %>
                <center><h2>管理面试信息</h2></center>
                <table class="table table-hover" border="1" align="center" border="0" cellpadding="2"
                       cellspacing="1">
                    <tr class="bg-info" height="30">
                        <th>面试号</th>
                        <th>候选人姓名</th>
                        <th>候选人电话</th>
                        <th>面试时间</th>
                        <th>面试官</th>
                        <th>状态</th>
                        <th>面试结果</th>
                        <th>操&nbsp;&nbsp;&nbsp;&nbsp;作</th>
                    </tr>
                    <%
                        int p;
                        int pagecount = 3;
                        int p2 = 1;
                        int rowcount;
                        int intpagecount;
                        String page1 = request.getParameter("page");
                        if (page1 == null) {
                            p = 1;
                        } else if (page1.equals("")) {
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
                        <td>
                            <a class="badge badge-success"
                               href="${pageContext.request.contextPath}/rs_modms?id=<%=rs.getString(1) %>">修改</a>
                            <%--                            <a href="${pageContext.request.contextPath}/?id=<%=rs.getString(1) %>">删除</a>--%>
                        </td>
                    </tr>
                    <%
                            }
                            p2++;
                        }
                    %>
                </table>
                <p>
                <form name="form1" method="post" action="manage.jsp">
                    <center>
                        第<%=p %>页 共<%=intpagecount %>页&nbsp;&nbsp;
                        <%
                            if (p > 1) {
                        %>
                        <a href="manage.jsp?page=1">第一页</a>
                        <a href="manage.jsp?page=<%=p-1 %>">上一页</a>&nbsp;&nbsp;
                        <%
                            }
                            if (p < intpagecount) {
                        %>
                        <a href="manage.jsp?page=<%=p+1 %>">下一页</a>
                        <a href="manage.jsp?page=<%=intpagecount %>">最后一页
                        </a>&nbsp;&nbsp;
                        <%
                            }
                        %>
                        转到第<input type="text" name="page" size="4">页
                        <input name="Submit" type="submit" value="G O"/>
                    </center>
                </form>
                </p>
                <%
                        bd.closeConn();
                    } catch (ClassNotFoundException | SQLException e) {
                        out.println(e.getMessage());
                    }
                %>
            </td>
        </tr>
    </table>
</div>
</body>
</html>