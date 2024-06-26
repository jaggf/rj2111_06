<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/30
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../inc/title.jsp" %>
<%@ include file="../../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=titleStr%>
    </title>
    <script language="JavaScript"> function check_input(theForm) {
        if (theForm.eid.value.length != 6) {
            alert("员工编号必须为6位。");
            theForm.eid.focus();
            return (false);
        }

        if (theForm.ename.value == "") {
            alert("请输入姓名。");
            theForm.ename.focus();
            return (false);
        }
    }
    </script>
</head>
<link rel="stylesheet" href="../../static/css/bootstrap.min.css">
<script src="../../static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="../../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="../../static/css/cheye2.css">
<style type="text/css">
    body{
        background-attachment: fixed;
        height: 100%;
        background-image: linear-gradient(#06c0f8, #ffffff);
    }
</style>
<body>
<%--主页导航栏--%>
<div class="">
    <table width="1024" height="30" border="0" align="center" cellpadding="0" cellspacing="0" background="">
        <tr>
            <td style="text-align: left"><font color="blue"><strong><%=session.getAttribute("userName") %></strong></font>，欢迎您使用人事管理平台！</td>
            <td align="right">
                <a href="/renshi/msjh/manage.jsp"><span class="STYLE1 badge bg-warning text-light">&nbsp;Web人事管理平台</span></a>
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
    <a href="${pageContext.request.contextPath}/renshi/msjh/manage.jsp">管理面试信息</a>
    <a class="badge badge-light" href="${pageContext.request.contextPath}/renshi/msjh/rsaddms.jsp">添加面试信息</a>
    <a href="${pageContext.request.contextPath}/renshi/zpxq/managexq.jsp">管理招聘信息</a>
    <a href="${pageContext.request.contextPath}/renshi/zpxq/addxq.jsp">添加招聘信息</a>
    <a href="${pageContext.request.contextPath}/renshi/kq/managekaoqin.jsp">管理考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/kq/addkaoqin.jsp">添加考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/managejx.jsp">管理绩效信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/addjx.jsp">添加绩效信息</a>
</div>
<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>
<div>
    <table style="text-align: center" align="center" width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="200"></td>
            <td width="850">
                <form id="theForm" name="theForm" method="post" action="${pageContext.request.contextPath}/rs_addms" onSubmit="return check_input(this)">
                    <table class="table table-hover table-bordered" width="750" border="0" align="center" cellpadding="0" cellspacing="1"
                           bgcolor="#c5d7ed">
                        <tr valign="middle" bgcolor="#f1f7fc" colspan="2" height="30">
                            <td colspan="2">
                                <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">添加面试信息</span></strong></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td width="149">面 试 编 号：</td>
                            <td width="528" align="left">&nbsp;&nbsp;
                                <input name="num" type="text" id="num"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>候 选 人姓 名：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="em" type="text" id="em"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>候 选 人 电 话：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="tel" type="text" id="tel"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>面试时间：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="time" type="text" id="time"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>面试官：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="msg" type="text" id="msg"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>状态：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="zt" type="text" id="zt"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>面试结果：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="jg" type="text" id="jg"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" valign="middle" class="STYLE1">
                            <td align="right">
                                <input name="Submit" type="reset" value="清 除" />&nbsp;&nbsp;
                            </td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="Submit" type="submit" value="提 交" />
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</div>

</body>
<script src="../../static/js/cheye2.js"></script>
</html>
