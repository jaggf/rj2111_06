package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.Employee;
import mybean.Salary;

@WebServlet(description = "The ModEmployee2 Servlet", urlPatterns = { "/Modem_salary2" })
public class Modem_salary2 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        BaseDAO bd = new BaseDAO();
        Salary sa = new Salary();
        request.setAttribute("sa",sa);
        String num = request.getParameter("num") ;
        String eid = request.getParameter("eid") ;
        String eusername = request.getParameter("eusername") ;
        String basesalary = request.getParameter("basesalary") ;
        double bas = Double.parseDouble(basesalary);
        String fullwork = request.getParameter("fullwork") ;
        double full=Double.parseDouble(fullwork);
        String month = request.getParameter("month") ;
        String year = request.getParameter("year") ;
        String fivetax = request.getParameter("fivetax") ;
        double five=Double.parseDouble(fivetax);
        String persontax = request.getParameter("persontax") ;
        double per=Double.parseDouble(persontax);
        double total=(bas+full-(five+per));
        String totalsalaty=String.valueOf(total);
        String  incumbency= request.getParameter("incumbency");
        ArrayList<String> paras = new ArrayList<String>();

        paras.add(eusername);
        paras.add(basesalary);
        paras.add(fullwork);
        paras.add(month);
        paras.add(year);
        paras.add(fivetax);
        paras.add(persontax);
        paras.add(totalsalaty);
        paras.add(incumbency);
        paras.add(num);
        try {
            String sql="update salary set eusername=?,basesalary=?,fullwork=?,month=?,year=?,fivetax=?,persontax=?,totalsalary=?,incumbency=? where num=?";
            int n=bd.exeUpdate(sql, paras);
            if(n>0) {
                sa.setBackNews("修改成功，单击<a href='salary/manage_salary.jsp'><font color='red'>返回</font></a>管理员工工资信息，继续修改");
            }
            else {
                sa.setBackNews("修改失败，单击<a href='manage_salary?id="+num+"'> <font color='red'>返回</font></a>，重新修改");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("salary/salary_show.jsp");
        dispatcher.forward(request, response);
    }

}