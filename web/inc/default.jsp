<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理首页</title>
</head>
<body>
	<table width="600" border="0" cellspacing="2" cellpadding="10">
		<tr>
			<td colspan="2" align="left" valign="middle">
				<font color="blue"><strong><%=session.getAttribute("userName") %></strong></font>，欢迎您使用人事管理平台！
				<br />该平台可实现以下功能：
			</td>
		</tr>
		<tr>
			<td width="40" align="right" valign="middle"><img height="13" src="images/134.gif" width="12" /></td>
			<td align="left" valign="middle">员工档案管理：添加、管理、查询员工档案信息</td>
		</tr>
		<tr>
			<td width="40" align="right" valign="middle"><img height="13" src="images/134.gif" width="12" /></td>
			<td align="left" valign="middle">员工培训管理：添加、管理、查询员工培训记录</td>
		</tr>
		<tr>
			<td width="40" align="right" valign="middle"><img height="13" src="images/134.gif" width="12" /></td>
			<td align="left" valign="middle">员工职称管理：添加、管理、查询员工职称信息</td>
		</tr>
		<tr>
			<td width="40" align="right" valign="middle"><img height="13" src="images/134.gif" width="12" /></td>
			<td align="left" valign="middle">员工奖惩管理：添加、管理、查询员工奖惩记录</td>
		</tr>
		<tr>
			<td width="40" align="right" valign="middle"><img height="13" src="images/134.gif" width="12" /></td>
			<td align="left" valign="middle">员工调动管理：添加、管理、查询员工调动情况</td>
		</tr>
	</table>
</body>
</html>