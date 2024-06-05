<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/29
  Time: 20:33
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
<link rel="stylesheet" href="../../static/css/cheye.css">
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
                <a href="managekaoqin.jsp"><span class="STYLE1 badge bg-warning text-light">&nbsp;Web人事管理平台</span></a>
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
    <a href="${pageContext.request.contextPath}/renshi/msjh/rsaddms.jsp">添加面试信息</a>
    <a href="${pageContext.request.contextPath}/renshi/zpxq/managexq.jsp">管理招聘信息</a>
    <a href="${pageContext.request.contextPath}/renshi/zpxq/addxq.jsp">添加招聘信息</a>
    <a href="${pageContext.request.contextPath}/renshi/kq/managekaoqin.jsp">管理考勤信息</a>
    <a class="badge badge-light" href="${pageContext.request.contextPath}/renshi/kq/addkaoqin.jsp">添加考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/managejx.jsp">管理员工绩效信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/addjx.jsp">添加员工绩效信息</a>
</div>
<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>
<div>
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="300"></td>
            <td width="850">
                <form id="theForm" name="theForm" method="post" action="${pageContext.request.contextPath}/rs_addkq" onSubmit="return check_input(this)">
                    <table class="table table-hover table-bordered" width="750" border="0" align="center" cellpadding="0" cellspacing="1"
                           bgcolor="#c5d7ed">
                        <tr valign="middle" bgcolor="#f1f7fc" colspan="2" height="30">
                            <td colspan="2">
                                <span class="STYLE1 m-auto"><strong>&nbsp;<span class="STYLE">添加员工考勤信息</span></strong></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td width="149">员 工 编 号：</td>
                            <td width="528" align="left">&nbsp;&nbsp;
                                <input name="eid" type="text" id="eid"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>姓 名：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="ename" type="text" id="ename"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>上 班 时 间：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="uptime" type="text" id="uptime"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>下班时间：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="downtime" type="text" id="downtime"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>工作时间：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="date" type="text" id="date"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>就职情况：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="incu" id="incu">
                                    <option value="在职" selected>在职</option>
                                    <option value="离职">离职</option>
                                    <option value="退休">退休</option>
                                    <option value="待聘">待聘</option>
                                    <option value="其他">其他</option>
                                </select>
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
<script src="../../static/js/cheye.js"></script>
</html>
