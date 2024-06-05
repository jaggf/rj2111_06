package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.Employee;

@WebServlet(description = "The AddEmployee Servlet", urlPatterns = {"/AddEmployee"})
public class AddEmployee extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
			ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
			ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		BaseDAO bd = new BaseDAO();
		Employee em = new Employee();
		request.setAttribute("em", em);

		String employeeid = request.getParameter("employeeid");
		try {
			String sql1 = "SELECT * FROM employee WHERE EmployeeID='" + employeeid + "'";
			ResultSet rs = bd.getRs(sql1);
			if (rs.next()) {
				em.setBackNews(" 该员工编号已存在，单击 <a href='Employee_file/addEmployee.jsp'><font color='green'>返回</font></a>，重新添加");
			} else {
				String username = request.getParameter("username");
				String sex = request.getParameter("sex");
				String branch = request.getParameter("branch");
				String birthday = request.getParameter("birthday");
				String nativeplace = request.getParameter("nativeplace");
				String marriage = request.getParameter("marriage");
				String identityid = request.getParameter("identityid");
				String politics = request.getParameter("politics");
				String folk = request.getParameter("folk");
				String education = request.getParameter("education");
				String department = request.getParameter("department");
				String graduatedate = request.getParameter("graduatedate");
				String university = request.getParameter("university");
				String position = request.getParameter("positions");
				String incumbency = request.getParameter("incumbency");
				String incumbencytype = request.getParameter("incumbencytype");
				String resume = request.getParameter("resume");
				ArrayList<String> paras = new ArrayList<String>();
				paras.add(employeeid);
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
				String sql2 = "INSERT INTO employee VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				System.out.println(sql2);
				System.out.println(paras);
				int n = bd.exeUpdate(sql2, paras);
				if (n > 0) {
//					request.setAttribute("meg", "新增成功");
              em.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='Employee_file/manageEmployee.jsp'><font color='red'>返回</font></a>，继续添加");
				} else {
//					request.setAttribute("meg", "新增失败");
                   em.setBackNews(" 添 加 <font color='red'> 失 败 </font> ，单击 <a href='Employee_file/manageEmployee.jsp'><font color='red'>返回</font></a>，重新添加");
				}
			}
			bd.closeConn();
		} catch (ClassNotFoundException e) {
			out.println(e.getMessage());
		} catch (SQLException e) {
			out.println(e.getMessage());
		} catch (Exception e) {
			out.println(e.getMessage());
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("Employee_file/show.jsp");
		dispatcher.forward(request, response);
	}
}
