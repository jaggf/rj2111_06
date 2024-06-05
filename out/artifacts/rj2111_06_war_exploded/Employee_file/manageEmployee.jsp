<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,mybean.BaseDAO" %>
<jsp:useBean id="bd" class="mybean.BaseDAO" scope="page"/>
<%--<%@ include file="../inc/title.jsp" %>--%>
<%@ include file="../inc/check.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员工档案</title>
</head>
<%--<link rel="stylesheet" href="../static/css/bootstrap.min.css">--%>
<link href="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
<%--<script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.min.js"></script>--%>
<script src="../static/js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<%--<script src="../static/js/bootstrap.bundle.min.js" type="text/javascript" charset="utf-8"></script>--%>
<link rel="stylesheet" href="../static/css/cheye.css">
<style type="text/css">
    /*body{*/
    /*    background-attachment: fixed;*/
    /*    height: 100%;*/
    /*    background-image: linear-gradient(#06f8dc, #ffffff);*/
    /*}*/
</style>
<script language="JavaScript"> function check_input(theForm) {
    if (theForm.employeeid.value.length !== 6) {
        alert("员工编号必须为6位。");
        theForm.employeeid.focus();
        return (false);
    }

    if (theForm.username.value === "") {
        alert("请输入姓名。");
        theForm.username.focus();
        return (false);
    }
    if (theForm.identityid.value === "") {
        alert("请输入身份证号。");
        theForm.identityid.focus();
        return (false);
    }
}  </script>
<body>
<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col">--%>
<%--            <div class="d-flex justify-content-between align-items-center">--%>
<%--                <div>--%>
<%--                    <span class="text-primary fw-bold"><%=session.getAttribute("userName") %></span>，欢迎您使用人事管理平台！--%>
<%--                </div>--%>
<%--                <div>--%>
<%--                    <a href="../firstone.jsp" class="badge bg-info text-light">Web人事管理平台</a>--%>
<%--                    <span class="text-muted">|</span>--%>
<%--                    <a href="mailto:2460958118@qq.com" class="badge bg-secondary text-light">与版主交流</a>--%>
<%--                    <span class="text-muted">|</span>--%>
<%--                    <a href="../inc/exit.jsp" class="badge bg-warning text-light">退出系统管理</a>--%>
<%--                </div>--%>
<%--                <div class="p-1" id="time"></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div id="mySidenav" class="sidenav">--%>
<%--    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>--%>
<%--    <a class="badge badge-light" href="manageEmployee.jsp">当前管理信息页面</a>--%>
<%--    <a href="addEmployee.jsp">添加员工档案信息</a>--%>
<%--    <a href="serchEmployee.jsp">查询员工档案信息</a>--%>
<%--</div>--%>
<%--<div id="main">--%>
<%--    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>--%>
<%--</div>--%>
<div style="height: 5px"></div>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <form action="${pageContext.request.contextPath}/EmployeeCollection?method=upload" method="post"
                  enctype="multipart/form-data">
                <div class="input-group mb-3">
                    <input type="file" title="导入员工数据" name="file" class="form-control" id="file">
                    <button type="submit" class="btn btn-primary">上传</button>
                </div>
            </form>
        </div>
        <div class="col-md-6">
            <form action="${pageContext.request.contextPath}/EmployeeDownload" method="post">
                <button type="submit" class="btn btn-primary">导出数据</button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <%
                try {
                    String strSql = "SELECT EmployeeID,UserName,Sex,Birthday,NativePlace,Marriage,IdentityID,Folk FROM employee WHERE 1=1";
                    ResultSet rs = bd.getRs(strSql);
            %>
            <form action="${pageContext.request.contextPath}/delete" method="post">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                    新增员工
                </button>
                <button type="submit" class="btn btn-danger">删除选中</button>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th style="text-align: center"><input type="checkbox" id="selectAll"></th>
                        <th>员工ID</th>
                        <th>用户名</th>
                        <th>性别</th>
                        <th>生日</th>
                        <th>籍贯</th>
                        <th>婚姻状况</th>
                        <th>身份证号</th>
                        <th>民族</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% int p;
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
                            if (p2 > (p - 1) * pagecount && p2 <= p * pagecount) {%>
                    <tr>
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
                        <td><%=rs.getString(8) %>
                        </td>
                        <td>
                            <div class="btn-group">


                                <a href="detailInfo.jsp?id=<%=rs.getString(1) %>" class="btn btn-primary">详细信息</a>
                                <a href="${pageContext.request.contextPath}/ModEmployee1?id=<%=rs.getString(1) %>"
                                   class="btn btn-success">修改</a>
                                <a href="${pageContext.request.contextPath}/Employeedel?id=<%=rs.getString(1) %>"
                                   class="btn btn-danger">删除</a>
                            </div>
                        </td>
                    </tr>
                    <% }
                        p2++;
                    } %>
                    </tbody>
                </table>
            </form>

            <p>
            <form name="form1" method="post" action="manageEmployee.jsp">
                <div class="text-center">
                    第<%=p %>页 共<%=intpagecount %>页&nbsp;&nbsp;
                    <%
                        if (p > 1) {
                    %>
                    <a href="manageEmployee.jsp?page=1" class="btn btn-secondary">第一页</a>
                    <a href="manageEmployee.jsp?page=<%=p-1 %>" class="btn btn-secondary">上一页</a>&nbsp;&nbsp;
                    <%
                        }
                        if (p < intpagecount) {
                    %>
                    <a href="manageEmployee.jsp?page=<%=p+1 %>" class="btn btn-secondary">下一页</a>
                    <a href="manageEmployee.jsp?page=<%=intpagecount %>" class="btn btn-secondary">最后一页</a>&nbsp;&nbsp;
                    <%
                        }
                    %>
                    转到第<input type="text" name="page" size="4" class="">页
                    <input name="Submit" type="submit" value="GO" class="btn btn-primary"/>
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
        </div>
    </div>
</div>
<!-- 模态框 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">新增员工</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- 模态框内容 -->
            <div class="modal-body">
                <div class="form-container">
                    <form id="theForm" name="theForm" action="${pageContext.request.contextPath}/AddEmployee"
                          method="post" class="row" onSubmit="return check_input(this)">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="employeeid" class="form-label">账号</label>
                                <input type="text" name="employeeid" class="form-control" id="employeeid">
                            </div>
                            <div class="mb-3">
                                <label for="username" class="form-label">姓名</label>
                                <input type="text" name="username" class="form-control" id="username">
                            </div>
                            <div class="mb-3">
                                <label for="sex" class="form-label">性别</label>
                                <select class="form-select" name="sex" id="sex">
                                    <option selected>女</option>
                                    <option>男</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="branch" class="form-label">部门</label>
                                <select class="form-select" name="branch" id="branch">
                                    <option selected value="总经理室">总经理室</option>
                                    <option value="副总经理室">副总经理室</option>
                                    <option value="销售部">销售部</option>
                                    <option value="生产部">生产部</option>
                                    <option value="研发部"></option>
                                    <option value="财务部">财务部</option>
                                    <option value="人力资源部">人力资源部</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="birthday" class="form-label">出生日期</label>
                                <input type="text" class="form-control" name="birthday" id="birthday">
                            </div>
                            <div class="mb-3">
                                <label for="department" class="form-label">专业</label>
                                <input type="text" class="form-control" name="department" id="department">
                            </div>
                            <div class="mb-3">
                                <label for="nativeplace" class="form-label">籍贯</label>
                                <input type="text" class="form-control" name="nativeplace" id="nativeplace">
                            </div>
                            <div class="mb-3">
                                <label for="nativeplace" class="form-label">政治面貌</label>
                                <select class="form-select" name="politics" id="politics">
                                    <option value="党员" selected>党员</option>
                                    <option value="团员">团员</option>
                                    <option value="群众">群众</option>
                                    <option value="其他">其他</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="resume" class="form-label">个人简介</label>
                                <textarea class="form-control" id="resume" name="resume" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="identityid" class="form-label">身份证</label>
                                <input type="text" class="form-control" name="identityid" id="identityid">
                            </div>

                            <div class="mb-3">
                                <label for="folk" class="form-label">民族</label>
                                <input type="text" class="form-control" name="folk" id="folk">
                            </div>
                            <div class="mb-3">
                                <label for="marriage" class="form-label">婚姻状况</label>
                                <select class="form-select" name="marriage" id="marriage">
                                    <option value="未婚">未婚</option>
                                    <option value="已婚">已婚</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="graduatedate" class="form-label">毕业日期</label>
                                <input type="text" class="form-control" name="graduatedate" id="graduatedate">
                            </div>
                            <div class="mb-3">
                                <label for="university" class="form-label">毕业院校</label>
                                <input type="text" class="form-control" name="university" id="university">
                            </div>
                            <div class="mb-3">
                                <label for="education" class="form-label">学历</label>
                                <select class="form-select" name="education" id="education">
                                    <option value="初中">初中</option>
                                    <option value="高中">高中</option>
                                    <option value="中专">中专</option>
                                    <option value="专科">专科</option>
                                    <option value="本科" selected>本科</option>
                                    <option value="硕士">硕士</option>
                                    <option value="博士">博士</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="positions" class="form-label">职称</label>
                                <select class="form-select" name="positions" id="positions">
                                    <option value="助理工程师" selected>助理工程师</option>
                                    <option value="工程师">工程师</option>
                                    <option value="高级工程师">高级工程师</option>
                                    <option value="助理会计师">助理会计师</option>
                                    <option value="会计师">会计师</option>
                                    <option value="注册会计师">注册会计师</option>
                                    <option value="助理经济师">助理经济师</option>
                                    <option value="经济师">经济师</option>
                                    <option value="高级经济师">高级经济师</option>
                                    <option value="其他">其他</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="incumbency" class="form-label">在职情况</label>
                                <input type="text" class="form-control" name="incumbency" id="incumbency">
                            </div>

                            <div class="mb-3">
                                <label for="incumbencytype" class="form-label">用工形式</label>
                                <select class="form-select" name="incumbencytype" id="incumbencytype">
                                    <option value="正式工" selected>正式工</option>
                                    <option value="合同工">合同工</option>
                                    <option value="临时工">临时工</option>
                                    <option value="见习生">见习生</option>
                                    <option value="其他">其他</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">提交</button>
                        </div>
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
</body>
<script>

    window.onload = function () {
        var message = "${meg}";
        if (message) {
            alert(message);
        }
    }
    // 全选/取消全选
    document.getElementById("selectAll").addEventListener("change", function () {
        var checkboxes = document.getElementsByName("ids");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
    //
    // function time() {
    //     var vWeek, vWeek_s, vDay;
    //     vWeek = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
    //     var date = new Date();
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