package servlet;

import java.io.IOException;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] ids = request.getParameterValues("ids");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/hrms";
			String user = "root";
			String password = "root";
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			Boolean boo = false;
			for (String id : ids) {
				String sql = "DELETE FROM employee WHERE  employeeid= " + id;
				stmt.executeUpdate(sql);
				boo = true;
			}
			if (boo) {
				request.setAttribute("meg", "批量删除成功");
			} else {
				request.setAttribute("meg", "批量删除失败");
			}
			RequestDispatcher dispatchersss = request.getRequestDispatcher("Employee_file/manageEmployee.jsp");
			dispatchersss.forward(request, response);
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}

