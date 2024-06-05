package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.Employee;
import mybean.xq;

@WebServlet(name = "modxq2", value = "/modxq2")
public class modxq2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        BaseDAO bd = new BaseDAO();
        xq xq = new xq();
        request.setAttribute("xq", xq);

        String num = request.getParameter("num");
        String rss = request.getParameter("rss");
        String gw = request.getParameter("gw");
        String x = request.getParameter("xq");
        String xl = request.getParameter("xl");
        String yea = request.getParameter("yea");
        String fzr = request.getParameter("fzr");
        String zt = request.getParameter("zt");

        ArrayList<String> paras = new ArrayList<String>();

        paras.add(rss);
        paras.add(gw);
        paras.add(x);
        paras.add(xl);
        paras.add(yea);
        paras.add(fzr);
        paras.add(zt);
        paras.add(num);
        try {
            String sql="update xq set rss=?,gw=?,xq=?,xl=?,yea=?,fzr=?,zt=? where num=?";
            int n=bd.exeUpdate(sql, paras);
            if(n>0) {
                xq.setBackNews("修改成功，单击<a href='xq/managexq.jsp'><font color='red'>返回</font></a>管理员工档案，继续修改");
            }
            else {
                xq.setBackNews("修改失败，单击<a href='modxq?id="+num+"'> <font color='red'>返回</font></a>，重新修改");
            }
            bd.closeConn();
        }
        catch(ClassNotFoundException e) {
            out.println(e.getMessage());
        }
        catch(SQLException e) {
            out.println(e.getMessage());
        }
        catch (Exception e) {
            out.println(e.getMessage());
        }
        RequestDispatcher dispatcher=request.getRequestDispatcher("xq/xqshow.jsp");
        dispatcher.forward(request, response);
    }

}