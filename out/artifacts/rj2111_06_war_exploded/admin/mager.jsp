<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理系统</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="../fa/css/all.min.css">
</head>
<style>
    .STYLE1 {
        color: #dddddd;
    }

    .STYLE1:hover {
        color: rgb(158, 255, 227);
    }

    .parent-element {
        width: 100%;
        height: 100px;
        background-color: rgb(6, 78, 137);
        text-align: center;
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
            <div class="head-top" style="background-color: rgb(6, 78, 137);">
                <div class="title">
                    <span class="text"><span
                            class="tagging" style="color:rgb(245,245,220);"><%= session.getAttribute("userName")%>,欢迎您</span></span>
                </div>
                <div class="text-dark p-1" id="time" style="margin-left: 300px;color: #dddddd"></div>
                <div class="search-ipt">
                    <table width="600" height="20" border="0" align="center" cellpadding="0" cellspacing="0"
                           background="">
                        <tr>
                            <td align="right">
                                <a href="#"><span class="STYLE1 ">&nbsp;Web人事管理平台</span></a>
                                <span class="STYLE2">&nbsp;&nbsp; </span>
                                <a href="mailto:2460958118@qq.com">
                                    <span class="STYLE1 ">与版主交流</span></a>
                                <span class="STYLE2">&nbsp;&nbsp; &nbsp; </span>
                                <a href="../inc/exit.jsp">
                                    <span class="STYLE1">退出系统管理</span></a>
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
                        <span class="text">信息管理</span>
                        <i class="fas fa-caret-left"></i>
                    </div>
                    <div class="mini-menu">
                        <ul class="menu-ul">
                            <li class="link">
                                <a href="../megmager.jsp" target="main_ifram">公告列表</a>
                            </li>
                            <li class="link">
                                <a href="../seachMegs.jsp" target="main_ifram">公告查询</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div slide="false" class="dried menu-line">
                    <div class="title">
                        <span class="text">考勤管理</span>
                        <i class="fas fa-caret-left"></i>
                    </div>
                    <div class="mini-menu">
                        <ul class="menu-ul">
                            <li class="link">
                                <a href="../kaoqin/managekaoqin.jsp" target="main_ifram">考勤信息</a>
                            </li>
                            <li class="link">
                                <a href="../kaoqin/kaoqinCheck.jsp" target="main_ifram">查询考勤</a>
                            </li>
                            <%--                            <li class="link">--%>
                            <%--                                <a href="#">菜单3</a>--%>
                            <%--                            </li>--%>
                        </ul>
                    </div>
                </div>
                <div slide="false" class="dried menu-line">
                    <div class="title">
                        <span class="text">绩效管理</span>
                        <i class="fas fa-caret-left"></i>
                    </div>
                    <div class="mini-menu">
                        <ul class="menu-ul">
                            <li class="link">
                                <a href="../jx/managejx.jsp" target="main_ifram">绩效信息</a>
                            </li>
                            <%--                            <li class="link">--%>
                            <%--                                <a href="../jx/" target="main_ifram">查询绩效</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li class="link">--%>
                            <%--                                <a href="#">菜单3</a>--%>
                            <%--                            </li>--%>
                        </ul>
                    </div>
                </div>
                <div slide="false" class="dried menu-line">
                    <div class="title">
                        <span class="text">面试管理</span>
                        <i class="fas fa-caret-left"></i>
                    </div>
                    <div class="mini-menu">
                        <ul class="menu-ul">
                            <li class="link">
                                <a href="../ms/managems.jsp" target="main_ifram">面试信息</a>
                            </li>
                            <%--                            <li class="link">--%>
                            <%--                                <a href="../jx/" target="main_ifram">查询面试</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li class="link">--%>
                            <%--                                <a href="#">菜单3</a>--%>
                            <%--                            </li>--%>
                        </ul>
                    </div>
                </div>
                <div slide="false" class="dried menu-line">
                    <div class="title">
                        <span class="text">招聘管理</span>
                        <i class="fas fa-caret-left"></i>
                    </div>
                    <div class="mini-menu">
                        <ul class="menu-ul">
                            <li class="link">
                                <a href="../xq/managexq.jsp" target="main_ifram">招聘信息</a>
                            </li>
                            <%--                            <li class="link">--%>
                            <%--                                <a href="../jx/" target="main_ifram">查询招聘</a>--%>
                            <%--                            </li>--%>
                            <%--                            <li class="link">--%>
                            <%--                                <a href="#">菜单3</a>--%>
                            <%--                            </li>--%>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="right-iframe">
                <iframe class="iframe-main" src="../megs.jsp" frameborder="no" scrolling="yes"
                        name="main_ifram"></iframe>
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