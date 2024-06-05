<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/21
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>跳转登陆界面</title>
</head>
<body>
<%
    if (session.getAttribute("userName") == null && session.getAttribute("userNames") == null){ response.sendRedirect("../login5.jsp");
    }
%>


</body>
</html>
