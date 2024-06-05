<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: s2460
  Date: 2023/10/24
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    .one {
        margin: 10px auto;
    }
</style>
<body>
<div class="one">
    <div class="container">
        <form action="${pageContext.request.contextPath}/MegsCollection?method=search" method="post" class="mb-3">
            <div class="row">
                <div class="col-md-2">
                    <div class="btn-group">
                        <a class="btn btn-primary" href="#"> <i class="fa fa-id-card" aria-hidden="true"/></i>  </a>
                        <input type="number" name="id" placeholder="公告ID" class="form-control">
                    </div>

                </div>
                <div class="col-md-2">
                    <input type="text" name="title" placeholder="标题" class="form-control">
                </div>
                <div class="col-md-2">
                    <input type="text" name="publishtime" placeholder="发布日期" class="form-control">
                </div>
                <%--            <div class="col-md-2">--%>
                <%--                <input type="text" name="education" placeholder="学历" class="form-control">--%>
                <%--            </div>--%>
                <%--            <div class="col-md-2">--%>
                <%--                <input type="text" name="incumbencytype" placeholder="任职形式" class="form-control">--%>
                <%--            </div>--%>
                <div class="col-md-2">
<%--                    搜索按钮--%>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-search" aria-hidden="true"/></i>
                    </button>
                </div>
            </div>
        </form>
        <form action="${pageContext.request.contextPath}/MegsCollection?method=moreDelete" method="post">
            <table class="table" style="
 box-shadow: 2px 1px 8px 1px rgb(228, 232, 235);
">
                <thead>
                <tr>
                    <td><input type="checkbox" id="selectAll"></td>
                    <td>ID</td>
                    <td>标题</td>
                    <td>发布日期</td>
                    <td>序号</td>
                </tr>
                </thead>
                <tbody>
                <%
                    if (request.getAttribute("no") != null) {
                        ResultSet rs = (ResultSet) request.getAttribute("no");
                        while (rs.next()) {
                            String id = rs.getString("id");
                            String title = rs.getString("title");
                            String publishtime = rs.getString("publish_time");
                            String ordernum = rs.getString("order_num");

                %>
                <tr>
                    <td><input type="checkbox" name="ids" value="<%=id%>"></td>
                    <td><%=id%>
                    </td>
                    <td><%=title%>
                    </td>
                    <td><%=publishtime%>
                    </td>
                    <td><%=ordernum%>
                    </td>
                </tr>
                <%
                        }
                        rs.close();
                    } else {
                    }
                %>
                </tbody>
            </table>
            <button type="submit" class="btn btn-danger">删除选中</button>
        </form>
    </div>
</div>

<script>
    // 全选/取消全选
    document.getElementById("selectAll").addEventListener("change", function () {
        var checkboxes = document.getElementsByName("ids");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
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
</body>
</html>
