package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.Employee;

@WebServlet(description = "The ModEmployee1 Servlet", urlPatterns = { "/ModEmployee1" })
public class ModEmployee1 extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        BaseDAO bd = new BaseDAO();
        Employee em = new Employee();
        request.setAttribute("em",em);

        String employeeid = request.getParameter("id") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(employeeid);
        try {
            String sql="SELECT * FROM employee WHERE EmployeeID=?";
            ResultSet rs= bd.exeQuery(sql, paras);
            if( rs.next()){
                em.setEmployeeID(rs.getInt(1));
                em.setUsername(rs.getString(2));
                em.setSex(rs.getString(3));
                em.setBranch(rs.getString(4));
                em.setBirthday(rs.getString(5));
                em.setNativeplace(rs.getString(6));
                em.setMarriage(rs.getString(7));
                em.setIdentityID(rs.getLong(8));
                em.setPolitics(rs.getString(9));
                em.setFolk(rs.getString(10));
                em.setEducation(rs.getString(11));
                em.setDepartment(rs.getString(12));
                em.setGraduateDate(rs.getString(13));
                em.setUniversity(rs.getString(14));
                em.setPosition(rs.getString(15));
                em.setIncumbency(rs.getString(16));
                em.setIncumbencyType(rs.getString(17));
                em.setResume(rs.getString(18));
            }
            else{
                em.setBackNews("无此员工档案信息，单击<a href='Employee_file/manageEmployee.jsp'> <font color='red'>返回</font></a>，重新选择");
            }
            System.out.println(em.toString());
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("Employee_file/modEmployee.jsp");
        dispatcher.forward(request, response);
    }

}