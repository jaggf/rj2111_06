
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybean.Employee" %>
<jsp:useBean id="em" class="mybean.Employee" scope="request"/>
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改员工档案</title>
    <script language="JavaScript">
        function check_input(theForm) {
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
            // if (theForm.birthday.value == "") {
            //     alert("请输入出生日期。");
            //     theForm.birthday.focus();
            //     return (false);
            // }
            // if (theForm.nativeplace.value == "") {
            //     alert("请输入籍贯。");
            //     theForm.nativeplace.focus();
            //     return (false);
            // }
            // if (theForm.identityid.value == "") {
            //     alert("请输入身份证号。");
            //     theForm.identityid.focus();
            //     return (false);
            // }
            // if (theForm.folk.value == "") {
            //     alert("请输入民族。");
            //     theForm.folk.focus();
            //     return (false);
            // }
        }
    </script>
</head>
<body>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td width="750"></td>
        <td width="850">
            <form id="theForm" name="theForm" method="post" onSubmit="return check_input(this)"
                  action="${pageContext.request.contextPath}/ModEmployee2" >
                <table width="750" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c5d7ed">
                    <tr valign="middle" bgcolor="#f1f7fc" height="30">
                        <td colspan="2">
<span class="STYLE1"><strong>&nbsp;<span class="STYLE6">&nbsp;
修改员工档案信息</span></strong></span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td width="149" >员 工 编 号：</td>
                        <td width="528" align="left">&nbsp;&nbsp;
                            <input name="employeeid" type="text" id="employeeid"
                                   value="<%=em.getEmployeeID() %>" readonly />
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>姓 名：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="username" type="text" id="username" value="<%=em.getUsername() %>" />
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>性 别：</td>
                        <td align="left">&nbsp;&nbsp;
                            <select name="sex" id="sex">
                                <option value="<%=em.getSex() %>" selected><%=em.getSex() %></option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select><span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>所属部门：</td>
                        <td align="left">&nbsp;&nbsp;
                            <select name="branch" id="branch">
                                <option value="<%=em.getBranch() %>" selected><%=em.getBranch() %></option>
                                <option value="总经理室">总经理室</option>
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
                            <input name="birthday" type="text" id="birthday" value="<%=em.getBirthday() %>" />
                            <span class="STYLE10">*<span class="STYLE9">
 (请按YYYY-MM-DD格式输入，如2010年5月15日则输入2010-05-15)</span></span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>籍 贯：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="nativeplace" type="text" id="nativeplace" value="<%=em.getNativeplace() %>" />
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>婚姻状况：</td>
                        <td align="left">&nbsp;&nbsp;
                            <select name="marriage" id="marriage">
                                <option value="<%=em.getMarriage() %>" selected><%=em.getMarriage() %></option>
                                <option value="未婚">未婚</option>
                                <option value="已婚">已婚</option>
                                <option value="丧偶">丧偶</option>
                                <option value="离异">离异</option>
                            </select><span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>身份证号：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="identityid" type="number" id="identityid" value="<%=em.getIdentityID() %>" />
                            <span class="STYLE10">*</span></td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>政治面貌：</td>
                        <td align="left">&nbsp;&nbsp;
                            <select name="politics" id="politics">
                                <option value="<%=em.getPolitics() %>" selected><%=em.getPolitics() %></option>
                                <option value="党员">党员</option>
                                <option value="团员">团员</option>
                                <option value="群众">群众</option>
                                <option value="其他">其他</option>
                            </select><span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>民 族：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="folk" type="text" id="folk" size="8" maxlength="4" value="<%=em.getFolk() %>" />
                            <span class="STYLE10">*</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>学 历：</td>
                        <td align="left">&nbsp;&nbsp;
                            <select name="education" id="education">
                                <option value="<%=em.getEducation() %>" selected><%=em.getEducation() %></option>
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
                        <td>专 业：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="department" type="text" id="department" size="20" maxlength="20"
                                   value="<%=em.getDepartment() %>" />
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>毕业日期：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="graduatedate" type="text" id="graduatedate"
                                   value="<%=em.getGraduateDate() %>" />
                            <span class="STYLE9">(请按YYYY-MM-DD格式输入，如2010年5月15
日则输入2010-05-15)</span>
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>毕业院校：</td>
                        <td align="left">&nbsp;&nbsp;
                            <input name="university" type="text" id="university" size="30" maxlength="30"
                                   value="<%=em.getUniversity() %>" />
                        </td>
                    </tr>
                    <tr bgcolor="#ffffff" height="25" align="center" valign="middle" class="STYLE1">
                        <td>职 称：</td>
                        <td align="left">&nbsp;&nbsp;
                            <select name="position" id="position">
                                <option value="<%=em.getPosition() %>" selected><%=em.getPosition() %></option>
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
                        <td>在职情况：</td>
                        <td align="left">&nbsp;&nbsp;
                            <select name="incumbency" id="incumbency">
                                <option value="<%=em.getIncumbency() %>" selected><%=em.getIncumbency() %></option>
                                <option value="在职">在职</option>
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
                                <option value="<%=em.getIncumbencyType() %>" selected>
                                    <%=em.getIncumbencyType() %></option>
                                <option value="正式工">正式工</option>
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
                            <textarea name="resume" cols="60" rows="4" id="resume">
<%=em.getResume() %></textarea>
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
<script>
    window.onload = function() {
        var message = "${meg}";
        if (message) {
            alert(message);
        }
    }
</script>
</html>


