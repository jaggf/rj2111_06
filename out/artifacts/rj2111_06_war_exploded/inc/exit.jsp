<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/27
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>退出系统</title>
</head>
<body>
<%
    session.invalidate();
    out.print("<script language='JavaScript'>window.alert('确认退出')</script>");
    out.print("<script language='JavaScript'>window.open('../login5.jsp')</script>");
    out.print("<script language='JavaScript'>window.parent.opener=null </script>");
    out.print("<script language='JavaScript'>window.parent.close() </script>");

%>
</body>
</html>
