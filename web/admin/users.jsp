<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="../fa/css/all.min.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<style>
    .STYLE1 {
        color: #dddddd;
    }

    .STYLE1:hover {
        color: rgb(13, 110, 253);
    }

    .parent-element {
        width: 100%;
        height: 100px;
        background-color:rgb(68,201,125);
        text-align: center;
    }

    .tabs {
        position: relative;
        top: 0px;
        left: 400px;
    }

    .username {
        width: 220px;
    }

    #time {
        position: relative;
        top: 0px;
        left: 270px;
        width: 270px;
        color: #dddddd
    }

    p {
        color: #dddddd;
    }

    .child-element {
        padding-top: 20px;
        display: table;
        margin: 20px auto;
    }
</style>
<script src="../js/jQuery-3.6.0.min.js"></script>
<body>
<div id="app">
    <div class="header">
        <div class="content">
            <div class="head-top" style="background-color: rgb(68,201,125)">
                <div class="title">
                    <span class="text username"><span
                            class="tagging" style="color: rgb(255,223,197)"><i class="fa fa-user-circle" aria-hidden="true" /></i> <%= session.getAttribute("userNames")%>,欢迎您</span></span>
                </div>
                <div class="text-dark p-1" id="time" style="color: #dddddd"></div>
                <div class="search-ipt">
                    <table class="tabs" width="100%" height="20" border="0" align="center" cellpadding="0"
                           cellspacing="0"
                           background="">
                        <tr>
                            <td align="right">
                                <a href="#"><span class="STYLE1 ">&nbsp;Web人事管理平台</span></a>
                                <span class="STYLE2">&nbsp;&nbsp; </span>
                                <a href="mailto:2460958118@qq.com">
                                    <span class="STYLE1 "><i style="color: #ffffff" class="fa fa-envelope-o" aria-hidden="true" /></i> 与版主交流</span></a>
                                <span class="STYLE2">&nbsp;&nbsp; </span>
                                <a href="../inc/exit.jsp">
                                    <span class="STYLE1"><i style="color: #ffffff" class="fa fa-power-off" aria-hidden="true" /></i> 退出系统管理</span></a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <%--                <div class="head-bottom">--%>
            <%--                    <div class="nav">--%>
            <%--                        <ul class="nav-ul" id="J_headNav">--%>
            <%--                            <li class="nav-link link-current">--%>
            <%--                                <a href="#">--%>
            <%--                                    <i class="fas fa-home"></i>--%>
            <%--                                    <span class="text">首页</span>--%>
            <%--                                </a>--%>
            <%--                            </li>--%>
            <%--                            <li class="nav-link">--%>
            <%--                                <a href="#">--%>
            <%--                                    <i class="fas fa-book"></i>--%>
            <%--                                    <span class="text">精品课程</span>--%>
            <%--                                </a>--%>
            <%--                            </li>--%>
            <%--                            <li class="nav-link">--%>
            <%--                                <a href="#">--%>
            <%--                                    <i class="fas fa-award"></i>--%>
            <%--                                    <span class="text">优秀作品</span>--%>
            <%--                                </a>--%>
            <%--                            </li>--%>
            <%--                        </ul>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
        </div>
    </div>
    <div class="content">
        <div class="container">
            <div class="left-menu" id="J_contain_left_menu">
                <div slide="false" class="user menu-line">
                    <div class="title">
                        <i class="fas fa-home"></i>
                        <span class="text">首页</span>
                        <%--                        <i class="fas fa-caret-left"></i>--%>
                    </div>
                    <div class="mini-menu">
                        <ul class="menu-ul">
                            <li class="link">
                                <a href="../MegUser.jsp" target="main_ifram">公告列表</a>
                            </li>
                            <li class="link">
                                <a href="../checkUsermegs.jsp" target="main_ifram">公告查询</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div slide="false" class="course menu-line">
                    <div class="title">
                        <span class="text"><a href="../user/user_file.jsp" target="main_ifram">个人信息</a></span>
                        <i class="fas fa-user"></i>
<%--                        <i class="fas fa-caret-left"></i>--%>
                    </div>
<%--                    <div class="mini-menu">--%>
<%--                        <ul class="menu-ul">--%>
<%--                            <li class="link">--%>
<%--                                <a href="../user/user_file.jsp" target="main_ifram">档案信息</a>--%>
<%--                            </li>--%>
<%--                            &lt;%&ndash;                            <li class="link">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <a href="">员工查询</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </li>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            <li class="link">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <a href="#">菜单3</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </li>&ndash;%&gt;--%>
<%--                        </ul>--%>
<%--                    </div>--%>
                </div>
                <div slide="false" class="works menu-line">
                    <div class="title">
                        <span class="text"><a href="../user/same.jsp" target="main_ifram">工资信息</a></span>
                        <i class="fas fa-hand-holding-usd"></i>
                    </div>
<%--                    <div class="mini-menu">--%>
<%--                        <ul class="menu-ul">--%>
<%--                            <li class="link">--%>
<%--                                <a href="../user/same.jsp" target="main_ifram">工资信息</a>--%>
<%--                            </li>--%>
<%--                            &lt;%&ndash;                            <li class="link">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <a href="#">菜单2</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </li>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            <li class="link">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <a href="#">菜单3</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </li>&ndash;%&gt;--%>
<%--                        </ul>--%>
<%--                    </div>--%>
                </div>
                <div slide="false" class="dried menu-line">
                    <div class="title">
                        <span class="text"><a href="../user/kqme.jsp" target="main_ifram">考勤信息</a></span>
                        <i class="fas fa-user-clock"></i>
<%--                        <i class="fas fa-caret-left"></i>--%>
                    </div>
<%--                    <div class="mini-menu">--%>
<%--                        <ul class="menu-ul">--%>
<%--                            <li class="link">--%>
<%--                                <a href="../user/kqme.jsp" target="main_ifram">考勤打卡</a>--%>
<%--                            </li>--%>
<%--                            &lt;%&ndash;                            <li class="link">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <a href="#">菜单2</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </li>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            <li class="link">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <a href="#">菜单3</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </li>&ndash;%&gt;--%>
<%--                        </ul>--%>
<%--                    </div>--%>
                </div>
                <div slide="false" class="dried menu-line">
                    <div class="title">
                        <span class="text"><a href="../user/jxme.jsp" target="main_ifram">绩效信息</a></span>
                        <i class="fas fa-flag"></i>
<%--                        <i class="fas fa-caret-left"></i>--%>
                    </div>
<%--                    <div class="mini-menu">--%>
<%--                        <ul class="menu-ul">--%>
<%--                            <li class="link">--%>
<%--                                <a href="../user/jxme.jsp" target="main_ifram">每月绩效</a>--%>
<%--                            </li>--%>
<%--                            &lt;%&ndash;                            <li class="link">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <a href="#">菜单2</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </li>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            <li class="link">&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <a href="#">菜单3</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </li>&ndash;%&gt;--%>
<%--                        </ul>--%>
<%--                    </div>--%>
                </div>
            </div>
            <div class="right-iframe">
                <iframe class="iframe-main" src="../userMegs.jsp" frameborder="no" scrolling="yes"
                        name="main_ifram">
                </iframe>
            </div>
        </div>
    </div>
</div>
<div class="parent-element">
    <div class="child-element">
        <p class="h_space">通信地址：福建信息软件技术2111-06</p>
        <p class="h_space">邮编：350110 电话：134005388369</p>
        <p class="h_space">邮箱：s2460958118@163.com 京ICP证123456号</p>
    </div>
</div>
</body>
<script src="./js/admin.js"></script>
<script src="js/showtime.js">

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