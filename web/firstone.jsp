<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2022/12/27
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="inc/check.jsp" %>
<html>
<head>
    <title>管理员首页</title>
</head>
<link rel="stylesheet" href="static/css/shouye.css">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<script src="static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
    #time{
        float: right;
        width:245px;
        height:40px;
    }
</style>
<body>
<div>
    <div class="text-dark p-1" id="time"></div>
    <div class="">
        <table width="920" height="30" border="0" align="center" cellpadding="0" cellspacing="0" background="">
            <tr>
                <td style="text-align: left"><font color="blue"><strong><%=session.getAttribute("userName") %></strong></font>，欢迎您使用人事管理平台！</td>
                <td align="right">
                    <a href="#"><span class="STYLE1 badge bg-info text-light">&nbsp;Web人事管理平台</span></a>
                    <span class="STYLE1">&nbsp;|&nbsp; </span>
                    <a href="mailto:2460958118@qq.com">
                        <span class="STYLE1 badge bg-secondary text-light">与版主交流</span></a>
                    <span class="STYLE1">&nbsp;|&nbsp; &nbsp; </span>
                    <a href="inc/exit.jsp">
                        <span class="STYLE1 badge bg-warning text-light">退出系统管理</span></a>
                </td>
            </tr>
        </table>
    </div>


<%--**********档案管理************ --%>
    <div id="banner">
        <div class="content_left bg-info">
            <button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown">员工档案管理</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="Employee_file/addEmployee.jsp">添加员工档案信息</a></li>
                <li><a class="dropdown-item" href="Employee_file/manageEmployee.jsp">管理员工档案信息</a></li>
                <li><a class="dropdown-item" href="Employee_file/serchEmployee.jsp">查询员工档案信息</a></li>
            </ul>
        </div>


        <div class="content_middlee bg-secondary">

            <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown">工资管理</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="salary/addEm_salary.jsp">添加基本工资信息</a></li>
                <li><a class="dropdown-item" href="salary/manage_salary.jsp">管理基本工资信息</a></li>
            </ul>
        </div>

        <div class="content_right bg-success">
            <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown">考勤管理</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="kaoqin/managekaoqin.jsp">管理员工考勤信息</a></li>
                <li><a class="dropdown-item" href="kaoqin/addkaoqin.jsp">添加员工考勤信息</a></li>
            </ul>
        </div>
    </div>

    <div id="content">
        <div class="content_left bg-danger">
            <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown">绩效管理</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="jx/managejx.jsp">管理员工绩效信息</a></li>
                <li><a class="dropdown-item" href="jx/addjx.jsp">添加员工绩效信息</a></li>

            </ul>
        </div>
        <div class="content_middlee bg-warning">
            <button type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown">面试管理</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="ms/managems.jsp">管理面试信息</a></li>
                <li><a class="dropdown-item" href="ms/addms.jsp">添加面试信息</a></li>
            </ul>
        </div>
        <div class="content_right bg-primary">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">招聘管理</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="xq/managexq.jsp">管理招聘信息</a></li>
                <li><a class="dropdown-item" href="xq/addxq.jsp">添加招聘信息</a></li>
            </ul>
        </div>
    </div>
    <br>
    <div class="imgbox" id="imgbox">
			<span>
				<a href="#"><img src="static/image/3.jpg" ></a>
				<a href="#"><img src="static/image/6.jpg" ></a>
				<a href="#"><img src="static/image/7.jpg" ></a>
				<a href="#"><img src="static/image/8.jpg" ></a>
				<a href="#"><img src="static/image/2.jpg" ></a>
				<a href="#"><img src="static/image/4.jpg" ></a>
				<a href="#"><img src="static/image/9.jpg" ></a>
				<a href="#"><img src="static/image/10.jpg" ></a>
			</span>
    </div>
</div>
<%--<div align="center">--%>
<%--<iframe width="1024" height="700" src="inc/default.jsp" name="content" frameborder="0" scrolling="auto"></iframe>--%>
<%--</div>--%>
<div align="center">
<hr width="1024" />
<span class="STYLE3">Copyright @ 2021~2023 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
<a href="mailto: 2460958118@qq.com">
<span class="STYLE3">2460958118@qq.com</span></a></span>
</div>

</body>
<script type="text/javascript">
    //定义滚动速度速度
    var speed=0.1;
    //获取id=‘imgbox’
    var imgbox=document.getElementById('imgbox')
    //做无缝滚动，要复制一个span
    imgbox.innerHTML += imgbox.innerHTML
    //获取两个span元素
    var span= imgbox.getElementsByTagName('span')
    //启动定时器，调用滚动函数(封装)
    var timer = setInterval(marquee,speed);
    //当鼠标移动上去的时候，停止滚动 移除计时器
    imgbox.onmouseover= function(){
        clearInterval(timer);
    }
    imgbox.onmouseout = function(){
        timer = setInterval(marquee,speed);
    }



    function time(){
        var vWeek, vWeek_s, vDay;
        vWeek = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
        var date =  new Date();
        year = date.getFullYear();
        month = date.getMonth() + 1;
        day = date.getDate();
        hours = date.getHours();
        minutes = date.getMinutes();
        seconds = date.getSeconds();
        vWeek_s = date.getDay();
        document.getElementById("time").innerHTML = year + "年" + month + "月" + day + "日" + "\t" + hours + ":" + minutes + ":" + seconds + "\t" + vWeek[vWeek_s];
    };
    setInterval("time()", 1000);

    function marquee(){
        //当第一个span被完全卷出
        if (imgbox.scrollLeft>span[0].offsetWidth) {
            //被卷起的内容归零
            imgbox.scrollLeft=0;
        } else{
            //继续滚动
            imgbox.scrollLeft++
            console.log(imgbox.scrollLeft);
        }
    }
</script>
</html>
