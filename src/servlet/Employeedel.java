package servlet;

import mybean.BaseDAO;
import mybean.Employee;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "Employeedel", value = "/Employeedel")
public class Employeedel extends HttpServlet {
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
        Employee em = new Employee();
        request.setAttribute("em",em);
        try {
            String id = request.getParameter("id") ;
            ArrayList<String> paras = new ArrayList<String>();
            paras.add(id);
            String sql="DELETE FROM employee WHERE EmployeeID=?";
            int n=bd.exeUpdate(sql, paras);
            if(n>0) {
                em.setBackNews(" 删 除 <font color='red'> 成 功 </font> ，单击 <a href='Employee_file/manageEmployee.jsp'><font color='red'>返回</font></a>管理员工培训记录页面，继续删除 ");
            }
            else {
                em.setBackNews(" 删 除 <font color='red'> 失 败 </font> ，单击 <a href='Employee_file/manageEmployee.jsp'><font color='red'>返回</font></a>管理员工培训记录页面，重新删除 ");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("Employee_file/show.jsp");
        dispatcher.forward(request, response);
    }

}
