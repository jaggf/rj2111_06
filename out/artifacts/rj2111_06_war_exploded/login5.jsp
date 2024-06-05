<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/27
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员登陆</title>
</head>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="static/css/iofrm-style.css">
<link rel="stylesheet" type="text/css" href="static/css/iofrm-theme5.css">
<style type="text/css">
    /* body {
        font-family: "Lato", sans-serif;
    }
     */
    .sidenav {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        background-color: #111;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
    }

    .sidenav a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 25px;
        color: #818181;
        display: block;
        transition: 0.3s;
    }

    .sidenav a:hover, .offcanvas a:focus{
        color: #f1f1f1;
    }

    .sidenav .closebtn {
        position: absolute;
        top: 0;
        right: 25px;
        font-size: 36px;
        margin-left: 50px;
    }

    #main {
        transition: margin-left .5s;
        padding: 16px;
    }

    @media screen and (max-height: 450px) {
        .sidenav {padding-top: 15px;}
        .sidenav a {font-size: 18px;}
    }
</style>
<body>
<div class="form-body">
    <div class="website-logo">
        <div class="logo">
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <a class="badge badge-light" href="">管理员登录</a>
                <a href="login6.jsp">用户登录</a>
                <a href="login7.jsp">人事登陆</a>
            </div>

            <div id="main">
                <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="img-holder">
            <div class="bg"></div>
            <div class="info-holder">
                <img src="static/picture/graphic1.svg" alt="">
            </div>
        </div>
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <h3> <span class="badge bg-primary">欢迎使用web员工管理系统</span><span class="badge badge-warning">Lv.6</span></h3>
                    <p>Access to the most powerfull tool in the entire design and web industry.</p>
                    <div class="page-links">
                        <a href="" class="active">管理员</a>
                        <a href="login6.jsp">用户</a>
                        <a href="login7.jsp">人事</a>
                    </div>
                    <form method="post" action="${pageContext.request.contextPath}/emlgin">
                        <input class="form-control" type="text" name="username" placeholder="username">
                        <input class="form-control" type="password" name="password" placeholder="password">
                        <div class="form-button">
                            <button id="submit" type="submit" class="ibtn">Login</button> <a href="mailto:2460958118@qq.com">Forget password?</a>
                        </div>
                    </form>

                    <div class="other-links">
                        <span>For Help</span><a href="mailto:2460958118@qq.com">管理员邮箱</a><!-- <a href="#">Google</a><a href="#">Linkedin</a> -->
<%--
 <span>Or login with</span><a href="#">Facebook</a><a href="#">Google</a><a href="#">Linkedin</a>--%>
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
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "300px";
        document.getElementById("main").style.marginLeft = "300px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginLeft= "0";
    }
</script>
</body>
</html>
