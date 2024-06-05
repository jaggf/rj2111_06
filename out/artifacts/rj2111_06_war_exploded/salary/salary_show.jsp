<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybean.Salary" %>
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息板</title>
</head>
<body>
<jsp:useBean id="sa" class="mybean.Salary" scope="request"/>
<jsp:getProperty name="sa" property="backNews" />
</body>
</html>