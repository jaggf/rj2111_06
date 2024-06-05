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
        if (theForm.employeeid.value.length != 6) {
            alert("员工编号必须为6位。");
            theForm.employeeid.focus();
            return (false);
        }

        if (theForm.username.value == "") {
            alert("请输入姓名。");
            theForm.username.focus();
            return (false);
        }
        if (theForm.birthday.value == "") {
            alert("请输入出生日期。");
            theForm.birthday.focus();
            return (false);
        }
        if (theForm.nativeplace.value == "") {
            alert(" 请 输 入 籍 贯 。 ");
            theForm.nativeplace.focus();
            return (false);
        }
        if (theForm.identityid.value == "") {
            alert("请输入身份证号。");
            theForm.identityid.focus();
            return (false);
        }
        if (theForm.folk.value == "") {
            alert("请输入民族。");
            theForm.folk.focus();
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
                <a href="../firstone.jsp"><span class="STYLE1 badge bg-warning text-light">&nbsp;Web人事管理平台</span></a>
                <span class="STYLE1">&nbsp;|&nbsp; </span>
                <a href="mailto:2460958118@qq.com">
                    <span class="STYLE1 badge bg-secondary text-light">与版主交流</span></a>
                <span class="STYLE1">&nbsp;|&nbsp; &nbsp; </span>
                <a href="../inc/exit.jsp">
                    <span class="STYLE1 badge bg-warning text-light">退出系统管理</span></a>
            </td>
        </tr>
    </table>
</div>
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a class="badge badge-light" href="addEmployee.jsp">当前添加信息页面</a>
    <a href="manageEmployee.jsp">管理员工档案信息</a>
<%--    <a href="serchEmployee.jsp">查询员工档案信息</a>--%>
</div>
<div id="main">
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>
<div>
        <table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="300"></td>
            <td width="850">
                <form id="theForm" name="theForm" method="post" action="${pageContext.request.contextPath}/AddEmployee" onSubmit="return check_input(this)">
                    <table class="table table-hover table-bordered" width="750" border="0" align="center" cellpadding="0" cellspacing="1"
                           bgcolor="#c5d7ed">
                        <tr valign="middle" bgcolor="#f1f7fc" colspan="2" height="30">
                            <td colspan="2">
                                <span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;添加员工档案信息</span></strong></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td width="149">员 工 编 号：</td>
                            <td width="528" align="left">&nbsp;&nbsp;
                                <input name="employeeid" type="text" id="employeeid"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>姓 名：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="username" type="text" id="username"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>性 别：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="sex" id="sex">
                                    <option value="男" selected>男</option>
                                    <option value="女">女</option>
                                </select><span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>所属部门：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="branch" id="branch">
                                    <option value=" "></option>
                                        <option value="总经理室" selected>总经理室</option>
                                    <option value="副总经理室">副总经理室</option>
                                    <option value="销售部">销售部</option>
                                    <option value="生产部">生产部</option>
                                    <option value="研发部">研发部</option>
                                    <option value="采购部">采购部</option>
                                    <option value="财务部">财务部</option>
                                    <option value="人事部">人事部</option>
                                </select><span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>出生日期：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="birthday" type="text" id="birthday"/>
                                <span class="STYLE10">*<span class="STYLE9">(如2010年5月15日则输入2010-05-15)</span></span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>籍 贯：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="nativeplace" type="text" id="nativeplace"/>
                                <span class="STYLE10">*</span>
                            </td>

                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>婚姻状况：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="marriage" id="marriage">
                                    <option value="未婚" selected>未婚</option>
                                    <option value="已婚">已婚</option>
                                    <option value="丧偶">丧偶</option>
                                    <option value="离异">离异</option>
                                </select><span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>身份证号：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="identityid" type="text" id="identityid"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>政治面貌：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="politics" id="politics">
                                    <option value="党员" selected>党员</option>
                                    <option value="团员">团员</option>
                                    <option value="群众">群众</option>
                                    <option value="其他">其他</option>
                                </select><span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>民 族：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="folk" type="text" id="folk" size="8" maxlength="4"/>
                                <span class="STYLE10">*</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>学 历：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="education" id="education">
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
                            <td>专 业：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="department" type="text" id="department" size="20" maxlength="20"/>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>毕业日期：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="graduatedate" type="text" id="graduatedate"/>
                                <span class="STYLE9">(如2010年5月15日则输入2010-05-15)</span>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>毕业院校：</td>
                            <td align="left">&nbsp;&nbsp;
                                <input name="university" type="text" id="university" size="30" maxlength="30"/>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>职 称：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="positions" id="positions">
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
                            <td>在职情况：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="incumbency" id="incumbency">
                                    <option value="在职" selected>在职</option>
                                    <option value="离职">离职</option>
                                    <option value="退休">退休</option>
                                    <option value="待聘">待聘</option>
                                    <option value="其他">其他</option>
                                </select>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>用工形式：</td>
                            <td align="left">&nbsp;&nbsp;
                                <select name="incumbencytype" id="incumbencytype">
                                    <option value="正式工" selected>正式工</option>
                                    <option value="合同工">合同工</option>
                                    <option value="临时工">临时工</option>
                                    <option value="见习生">见习生</option>
                                    <option value="其他">其他</option>
                                </select>
                            </td>
                        </tr>
                        <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                            <td>个人简历：</td>
                            <td align="left">&nbsp;&nbsp;
                                <textarea name="resume" cols="60" rows="4" id="resume"></textarea>
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
