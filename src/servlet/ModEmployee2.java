package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.Employee;

@WebServlet(description = "The ModEmployee2 Servlet", urlPatterns = { "/ModEmployee2" })
public class ModEmployee2 extends HttpServlet {
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

        String employeeid = request.getParameter("employeeid") ;
        String username = request.getParameter("username") ;
        String sex = request.getParameter("sex") ;
        String branch = request.getParameter("branch") ;
        String birthday = request.getParameter("birthday") ;
        String nativeplace = request.getParameter("nativeplace") ;
        String marriage = request.getParameter("marriage") ;
        String identityid = request.getParameter("identityid") ;
        String politics = request.getParameter("politics") ;
        String folk = request.getParameter("folk") ;
        String education = request.getParameter("education") ;
        String department = request.getParameter("department") ;
        String graduatedate = request.getParameter("graduatedate") ;
        String university = request.getParameter("university") ;
        String position = request.getParameter("position") ;
        String incumbency = request.getParameter("incumbency") ;
        String incumbencytype = request.getParameter("incumbencytype") ;
        String resume = request.getParameter("resume") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(username);
        paras.add(sex);
        paras.add(branch);
        paras.add(birthday);
        paras.add(nativeplace);
        paras.add(marriage);
        paras.add(identityid);
        paras.add(politics);
        paras.add(folk);
        paras.add(education);
        paras.add(department);
        paras.add(graduatedate);
        paras.add(university);
        paras.add(position);
        paras.add(incumbency);
        paras.add(incumbencytype);
        paras.add(resume);
        paras.add(employeeid);
        try {
            String sql="update employee set UserName=?,Sex=?,Branch=?,Birthday=?,NativePlace=?,Marriage=?,IdentityID=?,Politics=?,Folk=?,Education=?,Department=?,GraduateDate=?,University=?,Positions=?,Incumbency=?,IncumbencyType=?,Resume=? where EmployeeID=?";
            int n=bd.exeUpdate(sql, paras);
            if(n>0) {
//                request.setAttribute("meg","修改成功");
               em.setBackNews("修改成功，单击<a href='Employee_file/manageEmployee.jsp'><font color='red'>返回</font></a>管理员工档案，继续修改");
            }
            else {
//                request.setAttribute("meg","修改失败");
               em.setBackNews("修改失败，单击<a href='ModEmployee1?id="+employeeid+"'> <font color='red'>返回</font></a>，重新修改");
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