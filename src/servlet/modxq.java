package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;

import mybean.xq;

@WebServlet(name = "modxq", value = "/modxq")
public class
modxq extends HttpServlet {
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
        request.setAttribute("xq",xq);

        String num = request.getParameter("id") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(num);
        try {
            String sql="SELECT * FROM xq WHERE num=?";
            ResultSet rs= bd.exeQuery(sql, paras);
            if( rs.next()){
                xq.setNum(rs.getString(1));
                xq.setRss(rs.getString(2));
                xq.setGw(rs.getString(3));
                xq.setXq(rs.getString(4));
                xq.setXl(rs.getString(5));
                xq.setYea(rs.getString(6));
                xq.setFzr(rs.getString(7));
                xq.setZt(rs.getString(8));
            }
            else{
                xq.setBackNews("无此员工档案信息，单击<a href='xq/managexq.jsp'> <font color='red'>返回</font></a>，重新选择");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("xq/modxq.jsp");
        dispatcher.forward(request, response);
    }

}