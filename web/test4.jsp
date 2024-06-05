<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/10/28
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,mybean.BaseDAO" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page"/>
<%@ include file="/inc/title.jsp" %>
<%--<%@ include file="inc/check.jsp" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息管理</title>
</head>
<!-- CSS文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<!-- JavaScript文件，需要先引入jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
    body {
        /*background-attachment: fixed;*/
        /*height: 100%;*/
        /*background-image: linear-gradient(#06f8dc, #ffffff);*/
    }
</style>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <form action="${pageContext.request.contextPath}/EmployeeCollection?method=upload" method="post" enctype="multipart/form-data">
                <div class="input-group mb-3">
                    <input type="file" title="导入员工数据" name="file" class="form-control" id="file">
                    <button type="submit" class="btn btn-primary">上传</button>
                </div>
            </form>
        </div>
        <div class="col-md-6">
            <form action="EmployeeDownload" method="post">
                <button type="submit" class="btn btn-primary">导出数据</button>
            </form>
        </div>
    </div>
</div>
</body>
<script>
</script>
</html>