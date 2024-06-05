package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;
import mybean.BaseDAO;
import mybean.kaoqin;

@WebServlet(name = "modkaoqin", value = "/modkaoqin")
public class modkaoqin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        BaseDAO bd = new BaseDAO();
        kaoqin kq = new kaoqin();
        request.setAttribute("kq",kq);

        String num = request.getParameter("id") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(num);
        try {
            String sql="SELECT * FROM kaoqin WHERE num=?";
            ResultSet rs= bd.exeQuery(sql, paras);
            if( rs.next()){
                kq.setNum(rs.getInt(1));
                kq.setEid(rs.getString(2));
                kq.setEname(rs.getString(3));
                kq.setUptime(rs.getString(4));
                kq.setDowntime(rs.getString(5));
                kq.setDate(rs.getString(6));
                kq.setIncu(rs.getString(7));
            }
            else{
                kq.setBackNews("无此员工档案信息，单击<a href='kaoqin/managekaoqin.jsp'> <font color='red'>返回</font></a>，重新选择");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("kaoqin/modkaoqin.jsp");
        dispatcher.forward(request, response);
    }

}