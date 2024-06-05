<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page"/>
<%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/10/27
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        body {
            color: #000;
            /*background: url("https://www.cnblogs.com/skins/coffee/images/bg_body.gif") left top;*/
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 9pt;
            min-height: 101%;
            line-height: 1.5;
        }
        /* .container{
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            height: 80vh;
        } */
        .menu {
            width: 660px;
            height: 430px;
            border: 1px solid #ccc;
            margin: 100px auto;
            padding-left: 60px;
            list-style: none;
            box-shadow: 2px 1px 8px 1px rgb(228, 232, 235);
            border-radius: 8px;
            background-color: #fff;
        }

        .menu .new_list {
            width: 560px;
            height: 50px;
        }

        .menu .news_list .news {
            /*float: left;*/
            font-size: 40px;
            font-weight: 700;
            font-family: "Microsoft YaHei";
            line-height: 50px;
            /*background-color: red;*/
            border-bottom: 1px solid #ff0000;
            display: inline-block;
        }

        .menu .news_list a {
            color: #000;
        }

        .menu .news_list .more {
            display: block;
            float: right;
            line-height: 50px;
            margin-right: 50px;
            color: #ccc;
            /*border-bottom: 1px solid #ccc;*/
            /*background-color: cyan;*/
        }

        .menu .news_list .line {
            /*background-color: gold;*/
            border-bottom: 1px solid #ccc;
            width: 610px;
        }

        ul li div a {
            text-decoration: none;
        }

        ul .list {
            font-size: 20px;
            font-family: "Microsoft YaHei";
            width: 610px;
            margin: 25px 0;
            border-bottom: 1px dotted;
        }

        ul .list a {
            color: #000;
        }

        ul .list .date {
            float: right;
        }

        ul .list .point {
            display: inline-block;
            /*border: 1px solid red;*/
            position: relative;
            top: -7px;
        }

        ul .list .icon {
            display: inline-block;
        }
    </style>

</head>

<body>
<% try {
    String strSql = "SELECT id, title, content, publish_time, order_num FROM notice ORDER BY publish_time DESC LIMIT 6;";
    ResultSet rs = bd.getRs(strSql);
%>
<div class="container">
    <ul class="menu">
        <li class="news_list">
            <div class="news"><a href="#"><i class="fa fa-newspaper-o" aria-hidden="true" /></i> 公告列表</a></div>
            <div class="more"><a href="megmager.jsp">更多&gt&gt</a></div>
            <div class="line"></div>
        </li>
        <%
            while (rs.next()) {%>
        <li class="list">
            <div>
                <%--                <span class="point"><img src="point.gif" alt=""></span>--%>
                <%--                <span class="icon"><img src="icon.jpg" alt=""></span>--%>
                <a href="#"><i class="fa fa-circle" aria-hidden="true" /></i> <%=rs.getString(2)%>
                </a>
                <span class="date"><i class="fa fa-calendar-o" aria-hidden="true" /></i> <%=rs.getString(4)%></span>
            </div>
        </li>
        <%}%>
    </ul>
</div>
<%
        bd.closeConn();
    } catch (ClassNotFoundException e) {
        out.println(e.getMessage());
    } catch (SQLException e) {
        out.println(e.getMessage());
    }
%>
</body>
<script>
    !function () {

        function n(n, e, t) {

            return n.getAttribute(e) || t

        }

        function e(n) {

            return document.getElementsByTagName(n)

        }

        // console.log(e("body"))
        function t() {

            var t = e("script"),
                o = t.length,
                i = t[o - 1];

            return {

                l: o,
                z: n(i, "zIndex", -1),
                o: n(i, "opacity", .5),
                c: n(i, "color", "0,0,0"),
                n: n(i, "count", 99)

            }

        }

        function o() {

            a = m.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,

                c = m.height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight

        }

        function i() {

            r.clearRect(0, 0, a, c);

            var n, e, t, o, m, l;

            s.forEach(function (i, x) {

                for (i.x += i.xa, i.y += i.ya, i.xa *= i.x > a || i.x < 0 ? -1 : 1, i.ya *= i.y > c || i.y < 0 ? -1 : 1, r.fillRect(i.x - .5, i.y - .5, 1, 1), e = x + 1; e < u.length; e++) n = u[e],

                null !== n.x && null !== n.y && (o = i.x - n.x, m = i.y - n.y,

                    l = o * o + m * m, l < n.max && (n === y && l >= n.max / 2 && (i.x -= .03 * o, i.y -= .03 * m),

                    t = (n.max - l) / n.max, r.beginPath(), r.lineWidth = t / 2, r.strokeStyle = "rgba(" + d.c + "," + (t + .2) + ")", r.moveTo(i.x, i.y), r.lineTo(n.x, n.y), r.stroke()))

            }),

                x(i)

        }

        var a, c, u, m = document.createElement("canvas"),

            d = t(),
            l = "c_n" + d.l,
            r = m.getContext("2d"),

            x = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame ||


                function (n) {

                    window.setTimeout(n, 1e3 / 45)

                },

            w = Math.random,
            y = {
                x: null,
                y: null,
                max: 2e4
            };
        m.id = l, m.style.cssText = "position:fixed;top:0;left:0;z-index:" + d.z + ";opacity:" + d.o, e("body")[0].appendChild(m), o(), window.onresize = o,

            window.onmousemove = function (n) {

                n = n || window.event, y.x = n.clientX, y.y = n.clientY

            },

            window.onmouseout = function () {

                y.x = null, y.y = null

            };

        for (var s = [], f = 0; d.n > f; f++) {

            var h = w() * a,
                g = w() * c,
                v = 2 * w() - 1,
                p = 2 * w() - 1;
            s.push({
                x: h,
                y: g,
                xa: v,
                ya: p,
                max: 6e3
            })

        }

        u = s.concat([y]),

            setTimeout(function () {
                i()
            }, 100)

    }();
</script>

</html>