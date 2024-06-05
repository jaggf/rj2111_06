package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.Salary;

@WebServlet(description = "The ModEmployee1 Servlet", urlPatterns = { "/Modem_salary1" })
public class Modem_salary extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        BaseDAO bd = new BaseDAO();
        Salary sa = new Salary();
        request.setAttribute("sa",sa);

        String employeeid = request.getParameter("id") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(employeeid);
        try {
            String sql="SELECT * FROM salary WHERE num=?";
            ResultSet rs= bd.exeQuery(sql, paras);
            if( rs.next()){
                sa.setNum(rs.getInt(1));
                sa.setEid(rs.getString(2));
                sa.setEusername(rs.getString(3));
                sa.setBasesalary(rs.getString(4));
                sa.setFullwork(rs.getString(5));
                sa.setYear(rs.getString(6));
                sa.setMonth(rs.getString(7));
                sa.setFivetax(rs.getString(8));
                sa.setPersontax(rs.getString(9));
                sa.setTotalSalary(rs.getString(10));
                sa.setIncumbency(rs.getString(11));
//                request.setAttribute("meg","修改成功");
            }
            else{
//                request.setAttribute("meg","修改失败");
//                sa.setBackNews("无此员工档案信息，单击<a href='salary/manageEmployee.jsp'> <font color='red'>返回</font></a>，重新选择");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("salary/modsalary.jsp");
        dispatcher.forward(request, response);
    }

}