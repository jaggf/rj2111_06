<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/28
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,mybean.BaseDAO" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope = "page" />
<%@ include file="../inc/title.jsp" %>
<%--<%@ include file="../inc/check.jsp" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=titleStr%></title>
</head>
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<script src="../static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="../static/css/cheye.css">
<style type="text/css">
</style>
<body>
<div class="container">
    <table class="table" width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="850">
                <%
                    try{
                        String strSql="SELECT eid,ename,wk,mon,date,zt,num FROM jx ORDER BY date DESC";
                        ResultSet rs=bd.getRs(strSql);
                %>
                <center><h2>管理员工绩效信息</h2></center>
                <form action="${pageContext.request.contextPath}/JxCollection?method=moreDelete" method="post">
                    <a class="btn btn-primary" href="addjx.jsp">新增</a>&nbsp;
                    <button type="submit" class="btn btn-danger">删除选中</button>
                <table class="table table-hover table-bordered" align="center">
                    <tr class="table-info text-center">
                        <th><input type="checkbox" id="selectAll"></th>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>周考核量</th>
                        <th>月考核量</th>
                        <th>月&nbsp;&nbsp;份</th>
                        <th>状&nbsp;&nbsp;态</th>
                        <th>操作</th>
                    </tr>
                    <%
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
                    <tr class="text-center">
                        <td>
                            <input type="checkbox" name="ids" value="<%=rs.getString(7) %>"></td>
                        <td><%=rs.getString(1) %></td>
                        <td><%=rs.getString(2) %></td>
                        <td><%=rs.getString(3) %></td>
                        <td><%=rs.getString(4) %></td>
                        <td><%=rs.getString(5) %></td>
                        <td><span class="btn bg-success text-white"><%=rs.getString(6) %></span></td>
                        <td>
                            <a class="btn btn-primary text-white" href="${pageContext.request.contextPath}/modjx?id=<%=rs.getString(1) %>">修改</a>
                            <%--                            <a class="badge bg-danger" href="${pageContext.request.contextPath}/?id=<%=rs.getString(1) %>">删除</a>--%>
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
                <form name="form1" method="post" action="managejx.jsp">
                    <div class="text-center">
                        第<%=p %>页 共<%=intpagecount %>页&nbsp;&nbsp;
                        <%
                            if(p>1) {
                        %>
                        <a href="managejx.jsp?page=1" class="btn btn-secondary">第一页</a>
                        <a href="managejx.jsp?page=<%=p-1 %>" class="btn btn-secondary">上一页</a>&nbsp;&nbsp;
                        <%
                            }
                            if(p<intpagecount) {
                        %>
                        <a href="managejx.jsp?page=<%=p+1 %>" class="btn btn-secondary">下一页</a>
                        <a href="managejx.jsp?page=<%=intpagecount %>" class="btn btn-secondary">最后一页</a>&nbsp;&nbsp;
                        <%
                            }
                        %>
                        转到第<input type="text" name="page" size="4" class="">页
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
<script>
    window.onload = function() {
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