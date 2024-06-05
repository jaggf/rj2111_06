<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/30
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybean.xq" %>
<jsp:useBean id="xq" class="mybean.xq" scope="request"/>
<%@ include file="../../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改招聘需求</title>
    <script language="JavaScript">
        function check_input(theForm) {
            if (theForm.num.value.length != 2) {
                alert("员工编号必须为2位。");
                theForm.num.focus();
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
<style type="text/css">
    body{
        background-attachment: fixed;
        height: 100%;
        background-image: linear-gradient(#cdbffc, #ffffff);
    }
</style>
<body>
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="${pageContext.request.contextPath}/renshi/msjh/manage.jsp">管理面试信息</a>
    <a href="${pageContext.request.contextPath}/renshi/msjh/rsaddms.jsp">添加面试信息</a>
    <a class="badge badge-light" href="${pageContext.request.contextPath}/renshi/zpxq/managexq.jsp">管理招聘信息</a>
    <a href="${pageContext.request.contextPath}/renshi/zpxq/addxq.jsp">添加招聘信息</a>
    <a href="${pageContext.request.contextPath}/renshi/kq/managekaoqin.jsp">管理考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/kq/addkaoqin.jsp">添加考勤信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/managejx.jsp">管理绩效信息</a>
    <a href="${pageContext.request.contextPath}/renshi/jxkh/addjx.jsp">添加绩效信息</a>
</div>
<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
</div>
<div>
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="850">
                <form id="theForm" name="theForm" method="post" onSubmit="return check_input(this)"
                      action="${pageContext.request.contextPath}/rs_modxq2" >
                    <table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c5d7ed">
                        <tr valign="middle" bgcolor="#f1f7fc" height="30">
                            <td colspan="2">
                                <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;修改招聘需求信息</span></strong></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td width="149" >文件号：</td>
                            <td width="528" align="left">&nbsp;&nbsp;
                                <input name="num" type="text" id="num"
                                       value="<%=xq.getNum() %>" readonly />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>人数：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="rss" type="text" id="rss" value="<%=xq.getRss() %>" />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>岗位：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="gw" id="gw">
                                    <option value="<%=xq.getGw() %>" selected><%=xq.getGw() %></option>
                                    <option value="助理工程师">助理工程师</option>
                                    <option value="工程师">工程师</option>
                                    <option value="高级工程师">高级工程师</option>
                                    <option value="助理会计师">助理会计师</option>
                                    <option value="会计师">会计师</option>
                                    <option value="注册会计师">注册会计师</option>
                                    <option value="助理经济师">助理经济师</option>
                                    <option value="经济师">经济师</option>
                                    <option value="高级经济师">高级经济师</option>
                                    <option value="其他">其他</option>
                                </select>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>需求：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="xq" type="text" id="birthday" value="<%=xq.getXq() %>" />
                                <span class="STYLE10">*<span class="STYLE9"></span>*</span>
                            </td>
                        </tr>


                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>学 历：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="xl" id="xl">
                                    <option value="<%=xq.getXl() %>" selected><%=xq.getXq() %></option>
                                    <option value="初中">初中</option>
                                    <option value="高中">高中</option>
                                    <option value="中专">中专</option>
                                    <option value="专科">专科</option>
                                    <option value="本科">本科</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                </select>
                            </td>
                        </tr>

                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>年限：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="yea" type="text" id="nativeplace" value="<%=xq.getYea() %>" />
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>

                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>负责人：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="fzr" type="text" id="fzr"
                                       value="<%=xq.getFzr() %>" />
                                <span class="STYLE9">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>状态：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="zt" type="text" id="zt" size="30" maxlength="30" value="<%=xq.getZt() %>" />
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


