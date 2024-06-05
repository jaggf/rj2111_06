<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="mybean.jx" %>
<jsp:useBean id="jx" class="mybean.jx" scope="request"/>
<%@ include file="../inc/title.jsp" %>
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=titleStr%>
    </title>
    <link href="css/admin.css" type="text/css" rel="stylesheet"/>
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
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<script src="../static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
</style>
<body>

<div>
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="600"></td>
            <td width="850">
                <form id="theForm" name="theForm" method="post" onSubmit="return check_input(this)"
                      action="${pageContext.request.contextPath}/modjx2">
                    <table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c5d7ed">
                        <tr valign="middle" bgcolor="#f1f7fc" height="35">
                            <td colspan="2">
                                <span class="STYLE1"><strong>&nbsp;<span
                                        class="STYLE6">&nbsp;修改员工档案信息</span></strong></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td width="149">员 工 编 号：</td>
                            <td width="528" align="left">&nbsp;&nbsp;
                                <input name="eid" type="text" id="eid" value="<%=jx.getEid() %>" readonly/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>姓 名：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="ename" type="text" id="ename" value="<%=jx.getEname()%>"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>周考核量：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="wk" type="text" id="wk" value="<%=jx.getWk()%>"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>月考核量：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="mon" type="text" id="mon" value="<%=jx.getMon()%>"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>月份：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="date" type="text" id="date" value="<%=jx.getDate()%>"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>状态：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="zt" id="zt">
                                    <option value="<%=jx.getZt() %>" selected><%=jx.getZt() %>
                                    </option>
                                    <option value="正常">正常</option>
                                    <option value="异常">异常</option>
                                </select>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" valign="middle" class="STYLE1">
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
</html>


