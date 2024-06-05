<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/27
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="mybean.Employee" %>
<%@ page import="mybean.users" %>
<%@ page import="mybean.emuser" %>
<%@ page import="mybean.renshi" %>
<%--<%@ include file="../inc/check.jsp" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>信息板</title>
</head>
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<script src="../static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
</style>
<body>
<%--主页导航栏--%>
<div>
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="500"></td>
            <td width="850">
                <table class="table table-hover table-bordered" width="750" border="0" align="center" cellpadding="0" cellspacing="1"
                       bgcolor="#c5d7ed">
                    <tr valign="middle" bgcolor="#f1f7fc" colspan="2" height="30">
                        <td colspan="2">
                            <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;处理结果</span></strong></span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td width="149">结果一：</td>
                        <td width="528" align="left">&nbsp;&nbsp;
                            <jsp:useBean id="kq" class="mybean.kaoqin" scope="request"/>
                            <jsp:getProperty name="kq" property="backNews" />
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>结果二：</td>
                        <td align="left">&nbsp;&nbsp;
                            <jsp:useBean id="em" class="mybean.Employee" scope="request"/>
                            <jsp:getProperty name="em" property="backNews"/>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>结果三：</td>
                        <td align="left">&nbsp;&nbsp;
                            <jsp:useBean id="ren" class="mybean.renshi" scope="request"/>
                            <jsp:getProperty name="ren" property="backNews"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>

</body>
</html>

