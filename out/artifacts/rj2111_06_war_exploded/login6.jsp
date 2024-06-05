<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/1/1
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>员工登陆</title>
</head>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="static/css/iofrm-style.css">
<link rel="stylesheet" type="text/css" href="static/css/iofrm-theme8.css">
<link rel="stylesheet" type="text/css" href="static/css/cheye.css">
<body>
<div class="form-body">
    <div class="website-logo">
        <div class="logo">
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a href="login5.jsp">管理员登陆</a>
                <a href="login7.jsp">人事登陆</a>
            </div>

            <div id="main">
                <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
            </div>
        </div>
        </a>
    </div>
    <div class="row">
        <div class="img-holder">
            <div class="bg"></div>
            <div class="info-holder">
                <img src="static/picture/graphic6.svg" alt="">
            </div>
        </div>
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <h3><span class="badge rounded-pill bg-success">亲爱的用户欢迎你</span></h3>
                    <p>After login, you can check your file, attendance, and salary.</p>
                    <div class="page-links">
                        <a href="" class="active">用户</a>
                        <a href="login5.jsp">管理员</a>
                        <a href="login7.jsp">人事</a>
                    </div>
                    <form method="post" action="${pageContext.request.contextPath}/em_logins">
                        <input class="form-control" type="text" name="username" placeholder="工号（6位）" required="">
                        <input class="form-control" type="password" name="password" placeholder="密码" required="">
                        <div class="form-button">
                            <button id="submit" type="submit" class="ibtn">Login</button> <!-- <a href="forget6.html">Forget password?</a> -->
                        </div>
                    </form>
                    <div class="other-links">
                        <span>For Help</span><a href="mailto:2460958118@qq.com">管理员邮箱</a><!-- <a href="#">Google</a><a href="#">Linkedin</a> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/main.js"></script>
<script src="static/js/cheye.js"></script>
</body>
</html>
