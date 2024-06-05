package renshi;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.ms;

@WebServlet(name = "rs_modms", value = "/rs_modms")
public class rs_modms extends HttpServlet {
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

        String num = request.getParameter("id") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(num);
        try {
            String sql="SELECT * FROM ms WHERE num=?";
            ResultSet rs= bd.exeQuery(sql, paras);
            if( rs.next()){
                ms.setNum(rs.getString(1));
                ms.setEm(rs.getString(2));
                ms.setTel(rs.getString(3));
                ms.setTime(rs.getString(4));
                ms.setMsg(rs.getString(5));
                ms.setZt(rs.getString(6));
                ms.setJg(rs.getString(7));
            }
            else{
                ms.setBackNews("无此员工档案信息，单击<a href='renshi/msjh/manage.jsp'> <font color='red'>返回</font></a>，重新选择");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("renshi/msjh/modms.jsp");
        dispatcher.forward(request, response);
    }

}