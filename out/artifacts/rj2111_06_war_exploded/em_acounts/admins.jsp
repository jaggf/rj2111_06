<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/10/28
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,mybean.BaseDAO" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope = "page" />
<%@ include file="/inc/title.jsp" %>
<%--<%@ include file="inc/check.jsp" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>信息管理</title>
</head>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<%--<link rel="stylesheet" href="../static/css/bootstrap.min.css">--%>
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.min.js"></script>
<script src="../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<%--<script src="../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>--%>
<style type="text/css">
  body{
    /*background-attachment: fixed;*/
    /*height: 100%;*/
    /*background-image: linear-gradient(#06f8dc, #ffffff);*/
  }
</style>
<body>
<%--<%@ include file="seachMegs.jsp" %>--%>
<%--nav--%>
<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col">--%>
<%--            <div class="d-flex justify-content-between align-items-center">--%>
<%--                <div>--%>
<%--                    <span class="text-primary fw-bold"><%=session.getAttribute("userName") %></span>，欢迎您使用人事管理平台！--%>
<%--                </div>--%>
<%--                <div>--%>
<%--                    <a href="firstone.jsp" class="badge bg-info text-light">Web人事管理平台</a>--%>
<%--                    <span class="text-muted">|</span>--%>
<%--                    <a href="mailto:2460958118@qq.com" class="badge bg-secondary text-light">与版主交流</a>--%>
<%--                    <span class="text-muted">|</span>--%>
<%--                    <a href="inc/exit.jsp" class="badge bg-warning text-light">退出系统管理</a>--%>
<%--                </div>--%>
<%--                <div class="p-1" id="time"></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--侧边栏--%>
<%--<div id="mySidenav" class="sidenav">--%>
<%--    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>--%>
<%--    <a class="badge badge-light" href="megmager.jsp">当前管理信息页面</a>--%>
<%--    <a href="addEmployee.jsp">添加员工档案信息</a>--%>
<%--    <a href="serchEmployee.jsp">查询员工档案信息</a>--%>
<%--</div>--%>
<%--<div id="main">--%>
<%--    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>--%>
<%--</div>--%>

<div class="container">
  <%--    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">--%>
  <%--        新增公告--%>
  <%--    </button>--%>
  <div style="height: 5px"></div>
<%--  <div class="row">--%>
<%--    <div class="col-md-3">--%>
<%--      <form action="${pageContext.request.contextPath}/MegsCollection?method=upload" method="post" enctype="multipart/form-data">--%>
<%--        <div class="input-group mb-3">--%>
<%--          <input type="file" title="批量导入公告信息" name="file" class="form-control" id="file">--%>
<%--          <button type="submit" class="btn btn-primary">上传</button>--%>
<%--        </div>--%>
<%--      </form>--%>
<%--    </div>--%>
<%--    <div class="col-md-6">--%>
<%--      <form action="MegDownLoad" method="post">--%>
<%--        <button type="submit" class="btn btn-primary">导出Excel</button>--%>
<%--      </form>--%>
<%--    </div>--%>
<%--  </div>--%>
  <div class="row">
    <div class="col">
      <%
        try{
          String strSql="SELECT UserName, Password FROM users;";
          ResultSet rss=bd.getRs(strSql);
      %>
      <form action="${pageContext.request.contextPath}/acount?method=moreDelete" method="post">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
          新增
        </button>&nbsp;&nbsp;<button type="submit" class="btn btn-danger">删除选中</button>
        <table class="table table-striped">
          <thead>
          <tr>
            <th style="text-align: left" style="text-align: center"><input type="checkbox" id="selectAll"></th>
            <th style="text-align: left">账号ID</th>
            <th style="text-align: left">密码</th>
            <%--                        <th style="text-align: left">公示内容</th>--%>
            <%--                        <th style="text-align: left">发布日期</th>--%>
            <%--                        <th style="text-align: left">发布时间</th>--%>
            <%--                        <th style="text-align: left">排序号</th>--%>
                                    <th style="text-align: left">操作</th>
          </tr>
          </thead>
          <tbody>
          <% int p;
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
            rss.last();
            rowcount=rss.getRow();
            intpagecount=(rowcount+pagecount-1)/pagecount;
            if(p>intpagecount) p=intpagecount;
            if(p<1) p=1;
            rss.beforeFirst();
            while(rss.next()){
              if(p2>(p-1)*pagecount&&p2<=p*pagecount){%>
          <tr>
            <td>
              <input type="checkbox" name="ids" value="<%=rss.getString(1) %>"></td>
            <td><%=rss.getString(1) %></td>
            <td><%=rss.getString(2) %></td>
            <%--                        <td><%=rs.getString(3) %></td>--%>
            <%--                        <td><%=rss.getString(4) %></td>--%>
            <%--                        <td><%=rss.getString(6) %></td>--%>
            <%--                        <td><%=rss.getString(5) %></td>--%>
            <%--                        <td><%=rs.getString(6) %></td>--%>
            <%--                        <td><%=rs.getString(7) %></td>--%>
            <%--                        <td><%=rs.getString(8) %></td>--%>
            <td>
                <button type="button" class="btn btn-primary"
                        data-UserName="<%=rss.getString(1) %>"
                        data-Password="<%=rss.getString(2) %>"
                <%--                                        data-content="<%=rss.getString(3) %>"--%>
                <%--                                        data-publish_time="<%=rss.getString(4) %>"--%>
                <%--                                        data-order_num="<%=rss.getString(5) %>"--%>
                <%--                                        data-time="<%=rss.getString(6) %>"--%>
                        data-bs-toggle="modal" data-bs-target="#updateNoticeModal">
                  修改
                </button>
            </td>
          </tr> <% } p2++; } %>
          </tbody>
        </table>
      </form>

      <p>
      <form name="form1" method="post" action="admins.jsp">
        <div class="text-center">
          第<%=p %>页 共<%=intpagecount %>页&nbsp;&nbsp;
          <%
            if(p>1) {
          %>
          <a href="admins.jsp?page=1" class="btn btn-secondary">第一页</a>
          <a href="admins.jsp?page=<%=p-1 %>" class="btn btn-secondary">上一页</a>&nbsp;&nbsp;
          <%
            }
            if(p<intpagecount) {
          %>
          <a href="admins.jsp?page=<%=p+1 %>" class="btn btn-secondary">下一页</a>
          <a href="admins.jsp?page=<%=intpagecount %>" class="btn btn-secondary">最后一页</a>&nbsp;&nbsp;
          <%
            }
          %>
          转到第<input type="text" name="page" size="4" class="">页
          <input name="Submit" type="submit" value="GO" class="btn btn-primary" />
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
    </div>
  </div>
</div>

<!-- 新增公告 模态框 -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- 模态框头部 -->
      <div class="modal-header">
        <h4 class="modal-title">新增公告</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- 模态框内容 -->
      <div class="modal-body">
        <div class="form-container">
          <form action="${pageContext.request.contextPath}/acount?method=adminsave" method="post">
            <%--                        <div class="mb-3">--%>
            <%--                            <label for="id" class="form-label">ID</label>--%>
            <%--                            <input type="text" name="title" class="form-control" id="id">--%>
            <%--                        </div>--%>

            <div class="mb-3">
              <label for="UserNames" class="form-label">账号</label>
              <input type="text" name="UserName" class="form-control" id="UserNames">
            </div>
            <div class="mb-3">
              <label for="Password" class="form-label">密码</label>
              <input type="text" name="Password" class="form-control" id="Password">
            </div>
            <button type="submit" class="btn btn-primary">提交</button>
          </form>
        </div>
      </div>

      <!-- 模态框底部 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>

<!-- 更新模态框示例（Modal） -->
<div class="modal fade" id="updateNoticeModal" tabindex="-1" aria-labelledby="updateNoticeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateNoticeModalLabel">修改密码</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <form action="${pageContext.request.contextPath}/acount?method=adminupdate" method="post">
        <div class="modal-body">

          <div class="mb-3">
            <label for="UserName" class="form-label">ID</label>
            <input type="text"  name="UserName" class="form-control" id="UserName" readonly>
          </div>
          <div class="mb-3">
            <label for="Passwords" class="form-label">密码</label>
            <input type="text" name="Password" class="form-control" id="Passwords">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">提交</button>
        </div>
      </form>

    </div>
  </div>
</div>
</body>

<script>
  window.onload = function() {
    var message = "${meg}";
    if (message) {
      alert(message);
    }
  }

  var updateNoticeModal = document.getElementById('updateNoticeModal');
  updateNoticeModal.addEventListener('show.bs.modal', function(event) {
    var button = event.relatedTarget;
    var UserName = button.getAttribute('data-UserName');
    var Password = button.getAttribute('data-Password');

    var modal = updateNoticeModal.querySelector('.modal-content');
    var UserNames = modal.querySelector('#UserName');
    var Passwords = modal.querySelector('#Passwords');

    UserNames.value = UserName;
    Passwords.value = Password;
  });

  // 全选/取消全选
  document.getElementById("selectAll").addEventListener("change", function() {
    var checkboxes = document.getElementsByName("ids");
    for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = this.checked;
    }
  });
  // function time(){
  //     var vWeek, vWeek_s, vDay;
  //     vWeek = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
  //     var date =  new Date();
  //     year = date.getFullYear();
  //     month = date.getMonth() + 1;
  //     day = date.getDate();
  //     hours = date.getHours();
  //     minutes = date.getMinutes();
  //     seconds = date.getSeconds();
  //     vWeek_s = date.getDay();
  //     document.getElementById("time").innerHTML = year + "年" + month + "月" + day + "日" + "\t" + hours + ":" + minutes + ":" + seconds + "\t" + vWeek[vWeek_s];
  // };
  // setInterval("time()", 1000);
</script>
</html>