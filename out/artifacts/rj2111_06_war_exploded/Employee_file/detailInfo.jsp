<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/28
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,mybean.BaseDAO,java.util.ArrayList" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page"/>
<%@ include file="../inc/title.jsp" %>
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=session.getAttribute("userName") %>的详细信息</title>
</head>
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<script src="../static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="../static/css/cheye.css">
<style type="text/css">
</style>
<body>
<div class="">
    <table width="1000" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="500"></td>
            <td width="850">
                <table width="100%" border="0" cellspacing="0" cellpadding="1">
                    <tr>
                        <td>
                                <%
        ResultSet rs=null;
        String sql = null;
        String id = request.getParameter("id");
        ArrayList<String> paras = new ArrayList<String>();
paras.add(id);

try{
sql = "SELECT * FROM employee WHERE EmployeeID=?";
rs = bd.exeQuery(sql, paras);
while(rs.next()){
String username = rs.getString(2);
String sex = rs.getString(3);
String branch = rs.getString(4);
String birthday = rs.getString(5);
String nativeplace = rs.getString(6);
String marriage = rs.getString(7);
String identityid = rs.getString(8);
String politics = rs.getString(9);
String folk = rs.getString(10);
String education = rs.getString(11);
String department = rs.getString(12);
String graduatedate = rs.getString(13);
String university = rs.getString(14);
String position = rs.getString(15);
String incumbency = rs.getString(16);
String incumbencytype = rs.getString(17);
String resume = rs.getString(18);
%>
                            <table width="750" border="0" align="center" cellpadding="0" cellspacing="1"
                                   bgcolor="#c5d7ed">
                                <tr>
                                    <td valign="middle" bgcolor="#f1f7fc" colspan="2" height="30">
                                        <span class="STYLE1"><strong>&nbsp;<span
                                                class="STYLE6">&nbsp;员工档案信息</span></strong></span>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">员工编号：</td>
                                    <td align="left">&nbsp;&nbsp;<%=id %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">姓名：</td>
                                    <td align="left">&nbsp;&nbsp;<%=username %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">性别：</td>
                                    <td align="left">&nbsp;&nbsp;<%=sex %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">所属部门：</td>
                                    <td align="left">&nbsp;&nbsp;<%=branch %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">出生日期：</td>
                                    <td align="left">&nbsp;&nbsp;<%=birthday %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">籍贯：</td>
                                    <td align="left">&nbsp;&nbsp;<%=nativeplace %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">婚姻状况：</td>
                                    <td align="left">&nbsp;&nbsp;<%=marriage %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">身份证号：</td>
                                    <td align="left">&nbsp;&nbsp;<%=identityid %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">政治面貌：</td>
                                    <td align="left">&nbsp;&nbsp;<%=politics %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">民族：</td>
                                    <td align="left">&nbsp;&nbsp;<%=folk %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">学历：</td>
                                    <td align="left">&nbsp;&nbsp;<%=education %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">专业：</td>
                                    <td align="left">&nbsp;&nbsp;<%=department %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">毕业日期：</td>
                                    <td align="left">&nbsp;&nbsp;<%=graduatedate %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">毕业院校：</td>
                                    <td align="left">&nbsp;&nbsp;<%=university %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">职称：</td>
                                    <td align="left">&nbsp;&nbsp;<%=position %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">在职情况：</td>
                                    <td align="left">&nbsp;&nbsp;<%=incumbency %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">用工形式：</td>
                                    <td align="left">&nbsp;&nbsp;<%=incumbencytype %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td width="180">个人简历：</td>
                                    <td align="left">&nbsp;&nbsp;<%=resume %>
                                    </td>
                                </tr>
                                <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                                    <td colspan="2">
                                        <hr size=1/>
                                    </td>
                                </tr>
                            </table>
                                <%
                            }
                            bd.closeConn();
                            }
                            catch(ClassNotFoundException e) {
                                out.println(e.getMessage());
                            }
                            catch(SQLException e) {
                                out.println(e.getMessage());
                            }
                        %>
</div>
</body>
<script src="../static/js/cheye.js"></script>
</html>
