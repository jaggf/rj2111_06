package renshi;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.xq;

@WebServlet(name = "rs_addxq", value = "/rs_addxq")
public class rs_addxq extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        BaseDAO bd = new BaseDAO();
        xq xq = new xq();
        request.setAttribute("xq", xq);

        String num = request.getParameter("num");
        try {
            String sql1 = "SELECT * FROM xq WHERE num='" + num + "'";
            ResultSet rs = bd.getRs(sql1);
            if (rs.next()) {
                xq.setBackNews(" 该员工编号已存在，单击 <a href='renshi/zpxq/addxq.jsp'><font color='green'>返回</font></a>，重新添加");
            } else {
                String rss = request.getParameter("rss");
                String gw = request.getParameter("gw");
                String x = request.getParameter("xq");
                String xl = request.getParameter("xl");
                String yea = request.getParameter("yea");
                String fzr = request.getParameter("fzr");
                String zt = request.getParameter("zt");
                ArrayList<String> paras = new ArrayList<String>();
                paras.add(num);
                paras.add(rss);
                paras.add(gw);
                paras.add(x);
                paras.add(xl);
                paras.add(yea);
                paras.add(fzr);
                paras.add(zt);
                String sql2 = "INSERT INTO xq VALUES(?,?,?,?,?,?,?,?)";
                int n = bd.exeUpdate(sql2, paras);
                if (n > 0) {
                    xq.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='renshi/zpxq/addxq.jsp'><font color='red'>返回</font></a>，继续添加");
                } else {
                    xq.setBackNews(" 添 加 <font color='red'> 失 败 </font> ，单击 <a href='renshi/zpxq/addxq.jsp'><font color='red'>返回</font></a>，重新添加");
                }
            }
            bd.closeConn();
        } catch (ClassNotFoundException e) {
            out.println(e.getMessage());
        } catch (SQLException e) {
            out.println(e.getMessage());
        } catch (Exception e) {
            out.println(e.getMessage());
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("renshi/zpxq/xqshow.jsp");
        dispatcher.forward(request, response);
    }
}