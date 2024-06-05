
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybean.jx" %>
<jsp:useBean id="jx" class="mybean.jx" scope="request"/>
<%@ include file="../../inc/title.jsp" %>
<%@ include file="../../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改员工绩效信息</title>
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
    <a href="${pageContext.request.contextPath}/renshi/kq/managekaoqin.jsp">管理考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/kq/addkaoqin.jsp">添加考勤信息</a>
    <a class="badge badge-light" href="${pageContext.request.contextPath}/renshi/jxkh/managejx.jsp">管理员工绩效信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/addjx.jsp">添加员工绩效信息</a>
</div>
<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>
<div>
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="850">
                <form id="theForm" name="theForm" method="post" onSubmit="return check_input(this)" action="${pageContext.request.contextPath}/rs_modjx2" >
                    <table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c5d7ed">
                        <tr valign="middle" bgcolor="#f1f7fc" height="30">
                            <td colspan="2">
                                <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;修改员工档案信息</span></strong></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td width="149" >员 工 编 号：</td>
                            <td width="528" align="left">&nbsp;&nbsp;
                                <input name="eid" type="text" id="eid" value="<%=jx.getEid() %>" readonly />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>姓 名：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="ename" type="text" id="ename" value="<%=jx.getEname()%>" />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>周考核量：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="wk" type="text" id="wk" value="<%=jx.getWk()%>" />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>月考核量：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="mon" type="text" id="mon" value="<%=jx.getMon()%>" />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>月份：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="date" type="text" id="date" value="<%=jx.getDate()%>" />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>状态：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="zt" type="text" id="zt" value="<%=jx.getZt()%>" />
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


