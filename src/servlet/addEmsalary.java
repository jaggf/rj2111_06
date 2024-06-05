package servlet;

import mybean.Salary;
import mybean.BaseDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "addEmsalary", value = "/addEmsalary")
public class addEmsalary extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		BaseDAO bd = new BaseDAO();
		Salary sa = new Salary();
		request.setAttribute("sa", sa);
		String eid = request.getParameter("eid");
//		String num = request.getParameter("num");
		String year = request.getParameter("year");
		String eusername = request.getParameter("eusername");
		String basesalary = request.getParameter("basesalary");
		double bas = Integer.valueOf(basesalary);
		String fullwork = request.getParameter("fullwork");
		double full = Integer.valueOf(fullwork);
		String month = request.getParameter("month");
		String fivetax = request.getParameter("fivetax");
		double five = Integer.valueOf(fivetax);
		String persontax = request.getParameter("persontax");
		double per = Integer.valueOf(persontax);
		double total = (bas + full - (five + per));
		String totalsalaty = String.valueOf(total);
		String incumbency = request.getParameter("incumbency");
		try {
			String sql1 = "SELECT * FROM salary WHERE eusername='" + eusername + "'"+"and year='"+year+"' and month='"+month+"'";
			ResultSet rs = bd.getRs(sql1);
			if (rs.next()) {
				sa.setBackNews(" 该员工同年同月工资记录已存在，单击 <a href='salary/manage_salary.jsp'><font color='green'>返回</font></a>，重新添加");
			} else {
				ArrayList<String> paras = new ArrayList<String>();
//				paras.add(num);
				paras.add(eid);
				paras.add(eusername);
				paras.add(basesalary);
				paras.add(fullwork);
				paras.add(year);
				paras.add(month);
				paras.add(fivetax);
				paras.add(persontax);
				paras.add(totalsalaty);
				paras.add(incumbency);
				String sql2 = "INSERT INTO salary(eid,eusername,basesalary,fullwork,year,month,fivetax,persontax,totalsalary,incumbency) VALUES(?,?,?,?,?,?,?,?,?,?)";
				int n = bd.exeUpdate(sql2, paras);
				if (n > 0) {
					sa.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='salary/manage_salary.jsp'><font color='red'>返回</font></a>，继续添加");
				} else {
					sa.setBackNews(" 添 加 <font color='red'> 失 败 </font> ，单击 <a href='salary/manage_salary.jsp'><font color='red'>返回</font></a>，重新添加");
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("salary/salary_show.jsp");
		dispatcher.forward(request, response);
	}
}
