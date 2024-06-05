<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/29
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
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
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=titleStr%></title>
</head>
<!-- 新 Bootstrap5 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css">
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!--  popper.min.js 用于弹窗、提示、下拉菜单 -->
<script src="https://cdn.staticfile.org/popper.js/2.9.3/umd/popper.min.js"></script>

<!-- 最新的 Bootstrap5 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.min.js"></script>
<body>
<div class="container">
    <table class="table" width="1000" cellspacing="0" cellpadding="0">
                <%
                    try{
                        String strSql="SELECT num,eid,ename,uptime,downtime,date,incu FROM kaoqin ORDER BY date DESC";
                        ResultSet rs=bd.getRs(strSql);
                %>
                <div class="text-center"><h2>管理员工考勤信息</h2></div>
                <form action="${pageContext.request.contextPath}/KaoqinCollection?method=moreDelete" method="post">
                    <button type="submit" class="btn text-white bg-danger" title="<%=pschu%>" >
                        <i class="fa fa-list" aria-hidden="true"/></i>
                        <i class="fa fa-remove" aria-hidden="true"/></i>
                    </button>&nbsp;
               <table class="table table-hover table-bordered">
                    <tr class="table-info text-center">
                        <th><input type="checkbox" id="selectAll"></th>
                        <th>打卡编号</th>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>上班打卡</th>
                        <th>下班打卡</th>
                        <th>工作日期</th>
                        <th>就职情况</th>
                        <th>操作</th>
                    </tr>
                    <%
                        int p;
                        int pagecount=5;
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
                    <tr height="30" class="text-center">
                        <td><input type="checkbox" name="ids" value="<%=rs.getString(1) %>"></td>
                        <td><%=rs.getString(1) %></td>
                        <td><%=rs.getString(2) %></td>
                        <td><%=rs.getString(3) %></td>
                        <td><%=rs.getString(4) %></td>
                        <td><%=rs.getString(5) %></td>
                        <td><%=rs.getString(6) %></td>
                        <td><%=rs.getString(7) %></td>
                        <td>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/modkaoqin?id=<%=rs.getString(1) %>">
                                <i class="fa fa-edit" aria-hidden="true"/></i> </a>
                            <%--                            <a href="${pageContext.request.contextPath}/?id=<%=rs.getString(1) %>">删除</a>--%>
                        </td>
                    </tr>
                    <%
                            }
                            p2++;
                        }
                    %>
                </table>
    </form>
                <form name="form1" method="post" action="managekaoqin.jsp">
                    <div class="text-center">
                        第<%=p %>页 共<%=intpagecount %>页&nbsp;&nbsp;
                        <%
                            if(p>1) {
                        %>
                        <a href="managekaoqin.jsp?page=1" class="btn bg-secondary text-light">第一页</a>
                        <a href="managekaoqin.jsp?page=<%=p-1 %>" class="btn bg-secondary text-light">上一页</a>&nbsp;&nbsp;
                        <%
                            }
                            if(p<intpagecount) {
                        %>
                        <a href="managekaoqin.jsp?page=<%=p+1 %>" class="btn bg-secondary text-light">下一页</a>
                        <a href="managekaoqin.jsp?page=<%=intpagecount %>" class="btn bg-secondary text-light">最后一页
                        </a>&nbsp;&nbsp;
                        <%
                            }
                        %>
                        转到第<input type="text" name="page" class=" form-control-sm" size="4">页
                        <input name="Submit" type="submit" class="btn btn-primary" value="GO" />
                    </div>
                </form>
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
    </table>
</div>
</body>
<script>
    // 信息弹出框
    window.onload = function() {
        var message = "${meg}";
        if (message) {
            alert(message);
        }
    }
    // 全选/取消全选
    document.getElementById("selectAll").addEventListener("change", function() {
        var checkboxes = document.getElementsByName("ids");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });

</script>
</html>