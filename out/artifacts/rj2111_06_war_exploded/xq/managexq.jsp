<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/30
  Time: 14:14
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
    <title><%=titleStr%>
    </title>
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
                    try {
                        String strSql = "SELECT num,rss,gw,xq,xl,yea,fzr,zt FROM xq order by num DESC;";
                        ResultSet rs = bd.getRs(strSql);
                %>
                <center><h2>管理招聘信息</h2></center>
                <form action="${pageContext.request.contextPath}/XqCollection?method=moreDelete" method="post">
                    <div class="btn-group">
                        <a href="addxq.jsp" class="btn btn-primary">新增</a>
                        <button type="submit" class="btn btn-danger">删除</button>
                    </div>

                    <table class="table table-hover">
                        <tr class="table-info text-center">
                            <th><input type="checkbox" id="selectAll"></th>
                            <th>文件号</th>
                            <th>人数</th>
                            <th>岗位</th>
                            <th>需求</th>
                            <th>学历</th>
                            <th>年限</th>
                            <th>负责人</th>
                            <th>状态</th>
                            <th>操作</th>
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
                            <td><span class="badge bg-success text-light"><%=rs.getString(8) %></span></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/modxq?id=<%=rs.getString(1) %>"
                                   class="btn btn-primary">修改</a>
                                <%--                            <a href="${pageContext.request.contextPath}/Employeedel?id=<%=rs.getString(1) %>">删除</a>--%>
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
                <form name="form1" method="post" action="managexq.jsp">
                    <div class="text-center">
                        第<%=p %>页 共<%=intpagecount %>页&nbsp;&nbsp;
                        <%
                            if (p > 1) {
                        %>
                        <a href="managexq.jsp?page=1" class="btn btn-secondary">第一页</a>
                        <a href="managexq.jsp?page=<%=p-1 %>" class="btn btn-secondary">上一页</a>&nbsp;&nbsp;
                        <%
                            }
                            if (p < intpagecount) {
                        %>
                        <a href="managexq.jsp?page=<%=p+1 %>" class="btn btn-secondary">下一页</a>
                        <a href="managexq.jsp?page=<%=intpagecount %>" class="btn btn-secondary">最后一页</a>&nbsp;&nbsp;
                        <%
                            }
                        %>
                        转到第<input type="text" name="page" size="4" class="">页
                        <input name="Submit" type="submit" value="G O" class="btn btn-primary"/>
                    </div>
                </form>
                </p>
                <%
                        bd.closeConn();
                    } catch (ClassNotFoundException e) {
                        out.println(e.getMessage());
                    } catch (SQLException e) {
                        out.println(e.getMessage());
                    }
                %>
            </td>
        </tr>
    </table>
</div>

</body>
<script>
    // 全选/取消全选
    document.getElementById("selectAll").addEventListener("change", function () {
        var checkboxes = document.getElementsByName("ids");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
</script>
</html>