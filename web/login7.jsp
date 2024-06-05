<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/30
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="static/css/iofrm-style.css">
<link rel="stylesheet" type="text/css" href="static/css/iofrm-theme9.css">
<link rel="stylesheet" href="static/css/cheye.css">
<body>
<div class="form-body">
    <div class="website-logo">
            <div class="logo">
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <a class="badge badge-light" href="">人事登陆</a>
                    <a href="login5.jsp">管理员登陆</a>
                    <a href="login6.jsp">用户登录</a>
                </div>

                <div id="main">
                    <span class="" style="font-size:25px;cursor:pointer" onclick="openNav()">&#9776;</span>
                </div>
            </div>
        </a>
    </div>
    <div class="row">
        <div class="img-holder">
            <div class="bg"></div>
            <div class="info-holder">
                <img src="static/picture/graphic3.svg" alt="">
            </div>
        </div>
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <h3><span class="badge bg-success text-warning">欢迎使用人事管理系统</span></h3>
                    <p>After the login, you can handle the personnel-related business.</p>
                    <div class="page-links">
                        <a href="" class="active">人事</a>
                        <a href="login5.jsp">管理员</a>
                        <a href="login6.jsp">用户</a>
                    </div>
                    <form method="post" action="${pageContext.request.contextPath}/login">
                        <input class="form-control" type="text" name="username" placeholder="Username" required="">
                        <input class="form-control" type="password" name="password" placeholder="Password" required="">
                        <div class="form-button">
                            <button id="submit" type="submit" class="ibtn">Login</button>
<%--                            <a href="forget7.html">Forget password?</a>--%>
                        </div>
                    </form>
                    <div class="other-links">
                        <span>For Help</span><a href="mailto:2460958118@qq.com">管理员邮箱</a><!-- <a href="#">Google</a><a href="#">Linkedin</a> -->
<%--                        <span>Or login with</span><a href="#">Facebook</a><a href="#">Google</a><a href="#">Linkedin</a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/main.js"></script>
<script src="static/js/cheye.js"></script>
</html>
