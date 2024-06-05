<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/11/1
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if (session.getAttribute("userType") != "admin" || session.getAttribute("userType") == null) {
        response.sendRedirect("../login5.jsp");
    }
%>
</body>
</html>
