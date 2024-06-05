<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/28
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,mybean.BaseDAO" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page"/>
<%@ include file="../inc/title.jsp" %>
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员工工资</title>
</head>
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<script src="../static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="../static/css/cheye.css">
<style type="text/css">
</style>
<body>
<%--<div class="">--%>
<%--    <table width="1024" height="30" border="0" align="center" cellpadding="0" cellspacing="0" background="">--%>
<%--        <tr>--%>
<%--            <td style="text-align: left"><font color="blue"><strong><%=session.getAttribute("userName") %></strong></font>，欢迎您使用人事管理平台！</td>--%>
<%--            <td align="right">--%>
<%--                <a href="../firstone.jsp"><span class="STYLE1 badge bg-warning text-light">&nbsp;Web人事管理平台</span></a>--%>
<%--                <span class="STYLE1">&nbsp;|&nbsp; </span>--%>
<%--                <a href="mailto:2460958118@qq.com">--%>
<%--                    <span class="STYLE1 badge bg-secondary text-light">与版主交流</span></a>--%>
<%--                <span class="STYLE1">&nbsp;|&nbsp; &nbsp; </span>--%>
<%--                <a href="../inc/exit.jsp">--%>
<%--                    <span class="STYLE1 badge bg-warning text-light">退出系统管理</span></a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</div>--%>
<%--<div id="mySidenav" class="sidenav">--%>
<%--    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>--%>
<%--    <a class="badge badge-light" href="manage_salary.jsp">当前管理信息页面</a>--%>
<%--    <a href="addEm_salary.jsp">添加员工工资信息</a>--%>
<%--</div>--%>
<%--<div id="main">--%>
<%--    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>--%>
<%--</div>--%>
<div class="container">
    <table class="table" width="1000">
        <tr>
            <td width="850">
                <%
                    try {
                        String strSql = "SELECT num,eid,eusername,basesalary,fullwork,month,year,fivetax,persontax,totalsalary,incumbency FROM salary ORDER BY CAST(month AS SIGNED) DESC;";
                        ResultSet rs = bd.getRs(strSql);
                %>
                <%--                <center><h2 class="text-center">管理员工工资信息</h2></center>--%>
                <form action="${pageContext.request.contextPath}/SalaryCollection?method=moreDelete" method="post">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="height: 38px;" title="<%=xz%>">
                        <i class="fa fa-plus" aria-hidden="true" /></i>
                    </button>
                    <button type="submit" class="btn btn-danger" title="<%=pschu%>">
                        <i class="fa fa-list" aria-hidden="true"/></i>
                        <i class="fa fa-remove" aria-hidden="true"/></i>
                    </button>&nbsp;

                    <table class="table table-hover table-bordered" height="40">
                        <tr class="bg-info text-center">
                            <th><input type="checkbox" id="selectAll"></th>
                            <th class="text-light">工资编号</th>
                            <th class="text-light">员工编号</th>
                            <th class="text-light">员工姓名</th>
                            <th class="text-light">基本工资</th>
                            <th class="text-light">全勤工资</th>
                            <th class="text-light">月&nbsp;&nbsp;份</th>
                            <th class="text-light">年&nbsp;&nbsp;份</th>
                            <th class="text-light">五险扣款</th>
                            <th class="text-light">个税扣款</th>
                            <th class="text-light">实发工资</th>
                            <th class="text-light">就职情况</th>
                            <th class="text-light">数据操作</th>
                        </tr>
                        <%
                            int p;
                            int pagecount = 5;
                            int p2 = 1;
                            int rowcount;
                            int intpagecount;
                            String page1 = request.getParameter("page");
                            if (page1 == null) {
                                p = 1;
                            } else if (page1 == "") {
                                p = 1;
                            } else {
                                p = Integer.parseInt(page1);
                            }
                            rs.last();
                            rowcount = rs.getRow();
                            intpagecount = (rowcount + pagecount - 1) / pagecount;
                            if (p > intpagecount) p = intpagecount;
                            if (p < 1) p = 1;
                            rs.beforeFirst();
                            while (rs.next()) {
                                if (p2 > (p - 1) * pagecount && p2 <= p * pagecount) {
                        %>
                        <tr class="text-center">
                            <td>
                                <input type="checkbox" name="ids" value="<%=rs.getString(1) %>"></td>
                            <td><%=rs.getString(1) %>
                            </td>
                            <td><%=rs.getString(2) %>
                            </td>
                            <td><%=rs.getString(3) %>
                            </td>
                            <td><%=rs.getString(4) %>
                            </td>
                            <td><%=rs.getString(5) %>
                            </td>
                            <td><%=rs.getString(6) %>
                            </td>
                            <td><%=rs.getString(7) %>
                            </td>
                            <td><%=rs.getString(8) %>
                            </td>
                            <td><%=rs.getString(9) %>
                            </td>
                            <td><%=rs.getString(10) %>
                            </td>
                            <td><%=rs.getString(11) %>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/Modem_salary1?id=<%=rs.getString(1) %>"
                                   class="btn btn-primary" title="<%=xg%>"> <i class="fa fa-edit" aria-hidden="true"/></i>  </a>
                            </td>
                        </tr>
                        <%
                                }
                                p2++;
                            }
                        %>
                    </table>
                </form>
                <p>
                <form name="form1" method="post" action="manage_salary.jsp">
                    <div class="text-center">
                        第<%=p %>页 共<%=intpagecount %>页&nbsp;&nbsp;
                        <%
                            if (p > 1) {
                        %>
                        <a href="manage_salary.jsp?page=1" class="btn btn-secondary">第一页</a>
                        <a href="manage_salary.jsp?page=<%=p-1 %>" class="btn btn-secondary">上一页</a>&nbsp;&nbsp;
                        <%
                            }
                            if (p < intpagecount) {
                        %>
                        <a href="manage_salary.jsp?page=<%=p+1 %>" class="btn btn-secondary">下一页</a>
                        <a href="manage_salary.jsp?page=<%=intpagecount %>" class="btn btn-secondary">最后一页</a>&nbsp;&nbsp;
                        <%
                            }
                        %>
                        转到第<input type="text" name="page" class="form-control-sm" size="4">页
                        <input name="Submit" type="submit" value="G O" class="btn btn-primary"/>
                    </div>
                </form>
                </p>
            </td>
        </tr>
    </table>
</div>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/addEmsalary">
                    <div class="row">
                        <div class="col-md-6">
<%--                            <div class="mb-3">--%>
<%--                                <label for="num" class="form-label">Num</label>--%>
<%--                                <input type="text" class="form-control" id="num">--%>
<%--                            </div>--%>
                            <div class="mb-3">
                                <label for="eid" class="form-label">员工编号</label><br>
                                <select class="form-select" name="eid" id="eid">
                                    <%
                                        String sql2 = "SELECT *FROM employee";
                                        ResultSet eid = bd.getRs(sql2);
                                        while (eid.next()){
                                    %>
                                    <option value="<%=eid.getString(1)%>" ><%=eid.getString(1)%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="eusername" class="form-label">员工姓名</label><br>
                                <select class="form-select" name="eusername" id="eusername">
                                    <%
                                        ResultSet eids = bd.getRs(sql2);
                                        while (eids.next()){
                                    %>
                                    <option value="<%=eids.getString(2)%>" ><%=eids.getString(2)%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="basesalary" class="form-label">基本工资</label>
                                <input type="text" class="form-control" name="basesalary" id="basesalary">
                            </div>
                            <div class="mb-3">
                                <label for="persontax" class="form-label">个&nbsp;&nbsp;&nbsp;&nbsp;税</label>
                                <input type="text" class="form-control" name="persontax" id="persontax">
                            </div>
                            <div class="mb-3">
                                <label for="totalsalary" class="form-label">实发工资</label>
                                <input type="text" class="form-control" id="totalsalary" placeholder="自动结算" readonly>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="fullwork" class="form-label">满勤奖金</label>
                                <input type="text" class="form-control" name="fullwork" id="fullwork">
                            </div>
                            <div class="mb-3">
                                <label for="month" class="form-label">月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份</label>
                                <input type="text" class="form-control" name="month" id="month">
                            </div>
                            <div class="mb-3">
                                <label for="year" class="form-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份</label>
                                <input type="text" class="form-control" name="year" id="year">
                            </div>
                            <div class="mb-3">
                                <label for="fivetax" class="form-label">五&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;险</label>
                                <input type="text" class="form-control" name="fivetax" id="fivetax">
                            </div>
                            <div class="mb-3">
                                <label for="incumbency" class="form-label">在职情况</label>
                                <input type="text" class="form-control" name="incumbency" placeholder="在职" id="incumbency">
                            </div>
                            <button type="reset" class="btn btn-primary">清空</button>
                            <button type="submit" class="btn btn-primary">保存</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<%
        bd.closeConn();
    } catch (ClassNotFoundException e) {
        out.println(e.getMessage());
    } catch (SQLException e) {
        out.println(e.getMessage());
    }
%>
</body>
<%--<script src="../static/js/cheye.js"></script>--%>
<script>
    window.onload = function () {
        var message = "${meg}";
        if (message) {
            alert(message);
        }
    }
    // 全选/取消全选
    document.getElementById("selectAll").addEventListener("change", function () {
        var checkboxes = document.getElementsByName("ids");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
</script>
</html>