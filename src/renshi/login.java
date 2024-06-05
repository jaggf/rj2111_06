package renshi;

import mybean.BaseDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		ArrayList<String> parass = new ArrayList<String>();
		try {


			String username = request.getParameter("username");
			String password = request.getParameter("password");

			java.util.Date datas = new Date();
			String type = "人事";
			String computerName = System.getenv("COMPUTERNAME");
			System.out.println("计算机名：" + computerName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = sdf.format(datas);
			InetAddress ip = InetAddress.getLocalHost();
			String ipAddress = ip.getHostAddress();
			System.out.println("IP地址：" + ipAddress);

			parass.add(username);
			parass.add(time);
			parass.add(type);
			parass.add(computerName);
			parass.add(ipAddress);

			ArrayList<String> paras = new ArrayList<String>();
			paras.add(username);
			paras.add(password);
			BaseDAO bd = new BaseDAO();
			String sql2 = "INSERT INTO landingrecord(user_name,show_time,type,computer_name,ip_address) VALUES(?,?,?,?,?)";
			String strSql = "SELECT * FROM renshi WHERE username=? AND password=?";
			ResultSet rs = bd.exeQuery(strSql, paras);
			if (rs.next()) {
				bd.exeUpdate(sql2, parass);
				session.setAttribute("userName", username);
				session.setAttribute("userType", "hr");
				response.sendRedirect("admin/mager.jsp");
			} else {
				out.print("<script language='JavaScript'>window.alert('用户名或密码不正确，即 将返回登录页面')</script>");
				out.print("<script language='JavaScript'>window.location ='login7.jsp'</script>");
			}
			bd.closeConn();
		} catch (ClassNotFoundException e) {
			out.println(e.getMessage());
		} catch (SQLException e) {
			out.println(e.getMessage());
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}

}

