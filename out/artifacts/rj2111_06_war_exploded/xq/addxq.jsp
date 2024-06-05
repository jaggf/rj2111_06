<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/30
  Time: 14:13
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
        if (theForm.num.value.length >=1) {
            alert("文件编号不为空。");
            theForm.employeeid.focus();
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
</div>
<div>
    <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="500"></td>
            <td width="850">
                <form id="theForm" name="theForm" method="post" action="${pageContext.request.contextPath}/Addxq" onSubmit="return check_input(this)">
                    <table class="table table-hover table-bordered" width="750" border="0" align="center" cellpadding="0" cellspacing="1"
                           bgcolor="#c5d7ed">
                        <tr valign="middle" bgcolor="#f1f7fc" colspan="2" height="30">
                            <td colspan="2">
                                <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;添加招聘信息信息</span></strong></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td width="149"> 文件号：</td>
                            <td width="528" align="left">&nbsp;&nbsp;
                                <input name="num" type="text" id="num"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>人数：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="rss" type="text" id="rss"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>岗位：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="gw" id="gw">
                                    <option value="助理工程师" selected>助理工程师</option>
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
                                <input name="xq" type="text" id="xq"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>

                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>学 历：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="xl" id="xl">
                                    <option value="初中">初中</option>
                                    <option value="高中">高中</option>
                                    <option value="中专">中专</option>
                                    <option value="专科">专科</option>
                                    <option value="本科" selected>本科</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                </select>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>年限：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="yea" type="text" id="yea"/>
                                <span class="STYLE9">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>负责人：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="fzr" type="text" id="fzr" size="30" maxlength="30"/>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>状态：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="zt" type="text" id="zt" size="30" maxlength="30"/>
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
</html>
