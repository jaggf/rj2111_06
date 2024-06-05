<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/30
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybean.ms" %>
<jsp:useBean id="ms" class="mybean.ms" scope="request"/>
<%@ include file="../inc/title.jsp" %>
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=titleStr%></title>
    <script language="JavaScript">
        function check_input(theForm) {
            if (theForm.num.value.length != 2) {
                alert("面试号必须为2位。");
                theForm.num.focus();
                return (false);
            }
            if (theForm.em.value == "") {
                alert("请输入姓名。");
                theForm.em.focus();
                return (false);
            }

        }
    </script>
</head>
<body>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="850">
            <form id="theForm" name="theForm" method="post" onSubmit="return check_input(this)"
                  action="${pageContext.request.contextPath}/modms2" >
                <table class="table table-hover" width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c5d7ed">
                    <tr valign="middle" bgcolor="#f1f7fc" height="30">
                        <td colspan="2">
                            <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;修改面试信息</span></strong></span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td width="149" >面试号：</td>
                        <td width="528" align="left">&nbsp;&nbsp;
                            <input name="num" type="text" id="num" value="<%=ms.getNum() %>" readonly />
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>候选人姓 名：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="em" type="text" id="em" value="<%=ms.getEm() %>" />
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>候选人电话：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="tel" type="text" id="tel" value="<%=ms.getTel() %>" />
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>面试时间：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="time" type="text" id="time" value="<%=ms.getTime() %>" />
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>面试官：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="msg" type="text" id="msg" value="<%=ms.getMsg() %>" />
                            <span class="STYLE10">*<span class="STYLE9"></span>*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>状态：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="zt" type="text" id="zt" value="<%=ms.getZt() %>" />
                            <span class="STYLE10">*<span class="STYLE9"></span>*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>面试结果：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="jg" type="text" id="jg" value="<%=ms.getJg() %>" />
                            <span class="STYLE10">*<span class="STYLE9"></span>*</span>
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
</body>
</html>


