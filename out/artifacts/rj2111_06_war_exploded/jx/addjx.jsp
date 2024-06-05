<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/27
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../inc/title.jsp" %>
<%@ include file="../inc/check.jsp" %>
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
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<script src="../static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="../static/css/cheye.css">
<style type="text/css">
</style>
<body>
<%--主页导航栏--%>
<div>
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="500"></td>
            <td width="850">
                <form id="theForm" name="theForm" method="post" action="${pageContext.request.contextPath}/Addjx" onSubmit="return check_input(this)">
                    <table class="table table-hover table-bordered" width="750" border="0" align="center" cellpadding="0" cellspacing="1"
                           bgcolor="#c5d7ed">
                        <tr valign="middle" bgcolor="#f1f7fc" colspan="2" height="30">
                            <td colspan="2">
                                <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;添加员工绩效信息</span></strong></span>
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
                            <td>周考核：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="wk" type="text" id="wk"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>月考核：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="mon" type="text" id="mon"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>月份：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="date" type="text" id="date"/>
                                <span class="STYLE10">*<span class="STYLE9"></span></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>状态：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="zt" id="zt">
                                    <option value="正常">正常</option>
                                    <option value="异常">异常</option>
                                </select><span class="STYLE10">*</span>
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
            </td>
        </tr>
    </table>
</div>

</body>
<script src="../static/js/cheye.js"></script>
</html>
