<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/29
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="mybean.Salary" %>
<jsp:useBean id="sa" class="mybean.Salary" scope="request"/>
<%@ include file="../inc/title.jsp" %>
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改工资信息</title>
    <script language="JavaScript">
        function check_input(theForm) {
            if (theForm.eid.value.length != 6) {
                alert("员工编号必须为6位。");
                theForm.eid.focus();
                return (false);
            }
            if (theForm.eusername.value == "") {
                alert("请输入姓名。");
                theForm.eusername.focus();
                return (false);
            }
        }
    </script>
</head>
<body>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="750">
        </td>
        <td width="850">
            <form id="theForm" name="theForm" method="post" onSubmit="return check_input(this)"
                  action="${pageContext.request.contextPath}/Modem_salary2">
                <table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c5d7ed">
                    <tr valign="middle" bgcolor="#f1f7fc" height="30">
                        <td colspan="2">
                            <span class="STYLE1"><strong>&nbsp;<span
                                    class="STYLE6">&nbsp;修改员工档案信息</span></strong></span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td width="149">编&nbsp;&nbsp;号：</td>
                        <td width="528" align="left">&nbsp;&nbsp;
                            <input name="num" type="text" id="num" value="<%=sa.getNum()%>" readonly/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td width="149">员 工 编 号：</td>
                        <td width="528" align="left">&nbsp;&nbsp;
                            <input name="eid" type="text" id="eid" value="<%=sa.getEid()%>" readonly/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>姓&nbsp;&nbsp;名：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="eusername" type="text" id="eusername" value="<%=sa.getEusername() %>"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>基 本 工 资：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="basesalary" type="text" id="basesalary" value="<%=sa.getBasesalary() %>"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>全 勤 工 资：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="fullwork" type="text" id="fullwork" value="<%=sa.getFullwork() %>"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>月&nbsp;&nbsp;份：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="month" type="text" id="month" value="<%=sa.getMonth() %>"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>年&nbsp;&nbsp;份：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="year" type="text" id="year" value="<%=sa.getYear() %>"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>五 险 扣 款：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="fivetax" type="text" id="fivetax" value="<%=sa.getFivetax() %>"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>个 税 扣 款：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="persontax" type="text" id="persontax" value="<%=sa.getPersontax() %>"/>
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>实 发 工 资：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="totalsalaty" type="text" id="totalsalaty"
                                   value="<%=sa.getTotalSalary()%>(自动更新)" readonly/>
                            <span class="STYLE10">*</span>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>就 职 情 况：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="incumbency" type="text" id="incumbency" value="<%=sa.getIncumbency() %>"/>
                            <span class="STYLE10">*</span></td>
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
</body>
</html>



