package renshi;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;
import mybean.BaseDAO;
import mybean.kaoqin;

@WebServlet(name = "rs_modkq", value = "/rs_modkq")
public class rs_modkq extends HttpServlet {
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

        String eid = request.getParameter("id") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(eid);
        try {
            String sql="SELECT * FROM kaoqin WHERE eid=?";
            ResultSet rs= bd.exeQuery(sql, paras);
            if( rs.next()){
                kq.setEid(rs.getString(1));
                kq.setEname(rs.getString(2));
                kq.setUptime(rs.getString(3));
                kq.setDowntime(rs.getString(4));
                kq.setDate(rs.getString(5));
                kq.setIncu(rs.getString(6));
            }
            else{
                kq.setBackNews("无此员工档案信息，单击<a href='renshi/kq/managekaoqin.jsp'> <font color='red'>返回</font></a>，重新选择");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("renshi/kq/modkaoqin.jsp");
        dispatcher.forward(request, response);
    }

}