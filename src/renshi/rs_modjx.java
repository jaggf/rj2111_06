package renshi;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.jx;

@WebServlet(name = "rs_modjx", value = "/rs_modjx")
public class rs_modjx extends HttpServlet {
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
        jx jx = new jx();
        request.setAttribute("jx",jx);

        String eid = request.getParameter("id") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(eid);
        try {
            String sql="SELECT * FROM jx WHERE eid=?";
            ResultSet rs= bd.exeQuery(sql, paras);
            if( rs.next()){
                jx.setEid(rs.getString(1));
                jx.setEname(rs.getString(2));
                jx.setWk(rs.getString(3));
                jx.setMon(rs.getString(4));
                jx.setDate(rs.getString(5));
                jx.setZt(rs.getString(6));
            }
            else{
                jx.setBackNews("无此员工档案信息，单击<a href='renshi/jxkh/managejx.jsp'> <font color='red'>返回</font></a>，重新选择");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("renshi/jxkh/modjx.jsp");
        dispatcher.forward(request, response);
    }

}