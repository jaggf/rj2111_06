package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.ms;

@WebServlet(name = "modms2", value = "/modms2")
public class modms2 extends HttpServlet {
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
        ms ms = new ms();
        request.setAttribute("ms",ms);

        String num = request.getParameter("num") ;
        String em = request.getParameter("em") ;
        String tel = request.getParameter("tel") ;
        String time = request.getParameter("time") ;
        String msg = request.getParameter("msg") ;
        String zt = request.getParameter("zt") ;
        String jg = request.getParameter("jg") ;

        ArrayList<String> paras = new ArrayList<String>();
        paras.add(em);
        paras.add(tel);
        paras.add(time);
        paras.add(msg);
        paras.add(zt);
        paras.add(jg);
        paras.add(num);
        try {
            String sql="update ms set em=?,tel=?,time=?,msg=?,zt=?,jg=? where num=?";
            int n=bd.exeUpdate(sql, paras);
            if(n>0) {
                ms.setBackNews("修改成功，单击<a href='ms/managems.jsp'><font color='red'>返回</font></a>管理员工档案，继续修改");
            }
            else {
                ms.setBackNews("修改失败，单击<a href='modms?id="+num+"'> <font color='red'>返回</font></a>，重新修改");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("ms/msshow.jsp");
        dispatcher.forward(request, response);
    }

}