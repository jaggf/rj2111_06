<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybean.kaoqin" %>
<%@ include file="../../inc/title.jsp" %>
<%@ include file="../../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=titleStr%></title>
</head>
<body>
<jsp:useBean id="kq" class="mybean.kaoqin" scope="request"/>
<jsp:getProperty name="kq" property="backNews" />
</body>
</html>
