package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serial;
import java.sql.*;
@WebServlet("/search1")
public class ServletSeach1 {
//	@Serial
//	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		String username = request.getParameter("username");
//		String branch = request.getParameter("branch");
//		String politics = request.getParameter("politics");
//		String education = request.getParameter("education");
//		String incumbencytype = request.getParameter("incumbencytype");
//		System.out.println(username);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/hrms";
			String user = "root";
			String password = "root";
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql = "SELECT * FROM employee WHERE 1=1";
//			if (!username.isEmpty()) {
//				sql += " AND username LIKE '%" + username + "%'";
//			}
//			if (!branch.isEmpty()) {
//				sql += " AND branch LIKE '%" + branch + "%'";
//			}
//			if (!politics.isEmpty()) {
//				sql += " AND politics LIKE '%" + politics + "%'";
//			}
//			if (!education.isEmpty()) {
//				sql += " AND education LIKE '%" + education + "%'";
//			}
//			if (!incumbencytype.isEmpty()) {
//				sql += " AND incumbencytype LIKE '%" + incumbencytype + "%'";
//			}
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			request.setAttribute("results", rs);
			request.getRequestDispatcher("testElement.jsp").forward(request, response);
			rs.close();
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
