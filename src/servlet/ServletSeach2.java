package servlet;

import mybean.BaseDAO;
import mybean.Notice;

import java.io.IOException;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search2")
public class ServletSeach2 extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String branch = request.getParameter("branch");
		String politics = request.getParameter("politics");
		String education = request.getParameter("education");
		String incumbencytype = request.getParameter("incumbencytype");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/hrms";
			String user = "root";
			String password = "root";
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM employee WHERE 1=1";
			if (!username.isEmpty()) {
				sql += " AND username LIKE '%" + username + "%'";
			}
			if (!branch.isEmpty()) {
				sql += " AND branch LIKE '%" + branch + "%'";
			}
			if (!politics.isEmpty()) {
				sql += " AND politics LIKE '%" + politics + "%'";
			}
			if (!education.isEmpty()) {
				sql += " AND education LIKE '%" + education + "%'";
			}
			if (!incumbencytype.isEmpty()) {
				sql += " AND incumbencytype LIKE '%" + incumbencytype + "%'";
			}
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			request.setAttribute("employee", rs);
			request.getRequestDispatcher("Employee_file/test3.jsp").forward(request, response);
			rs.close();
			stmt.close();
			conn.close();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
