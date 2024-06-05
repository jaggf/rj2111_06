
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybean.kaoqin" %>
<jsp:useBean id="kq" class="mybean.kaoqin" scope="request"/>
<%@ include file="../../inc/title.jsp" %>
<%@ include file="../../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=titleStr%></title>
    <script language="JavaScript">
        function check_input(theForm) {
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cheye2.css">
<body>
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="${pageContext.request.contextPath}/renshi/msjh/manage.jsp">管理面试信息</a>
    <a href="${pageContext.request.contextPath}/renshi/msjh/rsaddms.jsp">添加面试信息</a>
    <a href="${pageContext.request.contextPath}/renshi/zpxq/managexq.jsp">管理招聘信息</a>
    <a href="${pageContext.request.contextPath}/renshi/zpxq/addxq.jsp">添加招聘信息</a>
    <a class="badge badge-light" href="${pageContext.request.contextPath}/renshi/kq/managekaoqin.jsp">管理考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/kq/addkaoqin.jsp">添加考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/managejx.jsp">管理员工绩效信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/addjx.jsp">添加员工绩效信息</a>
</div>
<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
</div>
<div>
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="850">
                <form id="theForm" name="theForm" method="post" onSubmit="return check_input(this)"
                      action="${pageContext.request.contextPath}/rs_modkq2" >
                    <table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c5d7ed">
                        <tr valign="middle" bgcolor="#f1f7fc" height="30">
                            <td colspan="2">
                                <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;修改员工考勤信息</span></strong></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td width="149" >员 工 编 号：</td>
                            <td width="528" align="left">&nbsp;&nbsp;
                                <input name="eid" type="text" id="eid" value="<%=kq.getEid() %>" readonly />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>姓 名：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="ename" type="text" id="ename" value="<%=kq.getEname() %>" />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>上班打卡：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="uptime" type="text" id="uptime" value="<%=kq.getUptime() %>" />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>下班打卡：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="downtime" type="text" id="downtime" value="<%=kq.getDowntime() %>" />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>出生日期：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="date" type="text" id="date" value="<%=kq.getDate() %>" />
                                <span class="STYLE10">*<span class="STYLE9"></span>*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>就职情况：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="incu" id="incu">
                                    <option value="<%=kq.getIncu()%>" selected><%=kq.getIncu() %></option>
                                    <option value="在职">在职</option>
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
<script src="${pageContext.request.contextPath}/static/js/cheye2.js"></script>
</html>


