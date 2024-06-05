<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/29
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/title.jsp" %>
<%@ include file="../inc/check.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<script src="../static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="../static/css/cheye.css">
<style type="text/css">
    body{
        background-attachment: fixed;
        height: 100%;
        background-image: linear-gradient(#06c0f8, #ffffff);
    }
</style>
<body>
<div class="">
    <table width="1024" height="30" border="0" align="center" cellpadding="0" cellspacing="0" background="">
        <tr>
            <td style="text-align: left"><font color="blue"><strong><%=session.getAttribute("userName") %></strong></font>，欢迎您使用人事管理平台！</td>
            <td align="right">
                <a href="../firstone.jsp"><span class="STYLE1 badge bg-warning text-light">&nbsp;Web人事管理平台</span></a>
                <span class="STYLE1">&nbsp;|&nbsp; </span>
                <a href="mailto:2460958118@qq.com">
                    <span class="STYLE1 badge bg-secondary text-light">与版主交流</span></a>
                <span class="STYLE1">&nbsp;|&nbsp; &nbsp; </span>
                <a href="../inc/exit.jsp">
                    <span class="STYLE1 badge bg-warning text-light">退出系统管理</span></a>
            </td>
        </tr>
    </table>
</div>

<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a class="badge badge-light" href="addEm_salary.jsp">当前添加信息页面</a>
    <a href="manage_salary.jsp">管理员工工资信息</a>
</div>
<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>
<div class="">
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <form id="theForm" name="theForm" method="post" action="${pageContext.request.contextPath}/addEmsalary" onSubmit="return check_input(this)">
                <table class="table table-hover table-bordered" width="750" border="0" align="center" cellpadding="0" cellspacing="1">
                    <tr valign="middle" bgcolor="#f1f7fc" colspan="2" height="30">
                        <td colspan="2">
                            <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;添加员工工资信息</span></strong></span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td width="149">员 工 编 号：</td>
                        <td width="528" align="left">&nbsp;&nbsp;
                            <input name="eid" type="" id="eid"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>姓 名：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="eusername" type="text" id="eusername"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>基本工资:</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="basesalary" type="text" id="basesalary"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>全勤工资:</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="fullwork" type="text" id="fullwork"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>月&nbsp;&nbsp;份：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="month" type="text" id="month"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>五险金扣款：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="fivetax" type="text" id="fivetax"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>个人税扣款：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="persontax" type="text" id="persontax"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>实发工资：</td>
                        <td align="left">&nbsp;&nbsp;
                            自动结算￥/$
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>就 职 情 况:</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="incumbency" type="text" id="incumbency"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td align="right">
                            <input name="Submit" type="reset" value="清 除"/>&nbsp;&nbsp;
                        </td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="Submit" type="submit" value="提 交"/>
                        </td>
                    </tr>
                </table>
            </form>
        </tr>
    </table>
</div>
</body>
<script src="../static/js/cheye.js"></script>
</html>
