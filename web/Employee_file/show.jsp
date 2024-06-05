<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybean.Employee" %>
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>信息板</title>
</head>
<body>
<jsp:useBean id="em" class="mybean.Employee" scope="request"/>
<jsp:getProperty name="em" property="backNews" />
</body>
</html>
