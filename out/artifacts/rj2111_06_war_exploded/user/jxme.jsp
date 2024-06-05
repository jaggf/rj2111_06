<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/1/2
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope = "page" />
<%@ page import="mybean.BaseDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>绩效信息</title>
</head>
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cheye2.css">
<style type="text/css">
    /*body{*/
    /*    background-attachment: fixed;*/
    /*    height: 100%;*/
    /*    background-image: linear-gradient(#efc0c2, #ffffff);*/
    /*}*/
</style>
<body>

<%--<div id="mySidenav" class="sidenav">--%>
<%--    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>--%>
<%--    <a href="${pageContext.request.contextPath}/user/user_file.jsp">个人信息</a>--%>
<%--    <a href="${pageContext.request.contextPath}/user/kqme.jsp">考勤打卡</a>--%>
<%--    <a class="badge badge-light" href="${pageContext.request.contextPath}/user/jxme.jsp">绩效考核</a>--%>
<%--    <a href="${pageContext.request.contextPath}/user/same.jsp">工资详情</a>--%>
<%--</div>--%>
<%--<div id="main">--%>
<%--    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>--%>
<%--</div>--%>
<div class="container">
    <table class="table" width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="850">
                <%
                    try{
                        String strSql="SELECT eid,ename,wk,mon,date,zt FROM jx WHERE eid='"+session.getAttribute("userNames")+"'";
                        ResultSet rs=bd.getRs(strSql);
                        if (rs.next()){
                %>
                <h3 class="text-center"><%=rs.getString(2)%>的绩效信息</h3>
                <table class="table table-hover" border="1" align="center" border="0" cellpadding="2"
                       cellspacing="1">
                    <tr class="table-info">
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>周考核量</th>
                        <th>月考和量</th>
                        <th>月&nbsp;&nbsp;&nbsp;&nbsp;份</th>
                        <th>状   态</th>
                    </tr>
                    <%
                        }
                        int p;
                        int pagecount=3;
                        int p2=1;
                        int rowcount;
                        int intpagecount;
                        String page1=request.getParameter("page");
                        if(page1==null){
                            p=1;
                        }else if (page1==""){
                            p=1;
                        }
                        else{
                            p=Integer.parseInt(page1);
                        }
                        rs.last();
                        rowcount=rs.getRow();
                        intpagecount=(rowcount+pagecount-1)/pagecount;
                        if(p>intpagecount) p=intpagecount;
                        if(p<1) p=1;
                        rs.beforeFirst();
                        while(rs.next()){
                            if(p2>(p-1)*pagecount&&p2<=p*pagecount){
                    %>
                    <tr class="table-light">
                        <td><%=rs.getString(1) %></td>
                        <td><%=rs.getString(2) %></td>
                        <td><%=rs.getString(3) %></td>
                        <td><%=rs.getString(4) %></td>
                        <td><%=rs.getString(5) %></td>
                        <td><span class="badge bg-success"><%=rs.getString(6) %></span></td>
                    </tr>
                    <%
                            }
                            p2++;
                        }
                    %>
                </table>
                <p>
                <form name="form1" method="post" action="jxme.jsp">
                    <div class="text-center">
                        第<%=p %>页 共<%=intpagecount %>页&nbsp;&nbsp;
                        <%
                            if(p>1) {
                        %>
                        <a href="jxme.jsp?page=1" class="btn btn-primary">第一页</a>
                        <a href="jxme.jsp?page=<%=p-1 %>" class="btn btn-primary">上一页</a>&nbsp;&nbsp;
                        <%
                            }
                            if(p<intpagecount) {
                        %>
                        <a href="jxme.jsp?page=<%=p+1 %>" class="btn btn-primary">下一页</a>
                        <a href="jxme.jsp?page=<%=intpagecount %>" class="btn btn-primary">最后一页</a>&nbsp;&nbsp;
                        <%
                            }
                        %>
                        转到第<input type="text" name="page" size="2">页
                        <input name="Submit" type="submit" value="G O" class="btn btn-primary" />
                    </div>
                </form>
                </p>
                <%
                        bd.closeConn();
                    }
                    catch(ClassNotFoundException e) {
                        out.println(e.getMessage());
                    }
                    catch(SQLException e) {
                        out.println(e.getMessage());
                    }
                %>
            </td>
        </tr>
    </table>
</div>
</body>
<script src="${pageContext.request.contextPath}/static/js/cheye2.js"></script>
</html>
