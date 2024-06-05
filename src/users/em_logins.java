package users;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.net.InetAddress;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import mybean.BaseDAO;

@WebServlet(name = "em_logins", value = "/em_logins")
public class em_logins extends HttpServlet {
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
			String type = "员工";
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

			BaseDAO bd = new BaseDAO();
			String sql2 = "INSERT INTO landingrecord(user_name,show_time,type,computer_name,ip_address) VALUES(?,?,?,?,?)";
			String strSql = "SELECT * FROM emuser WHERE eid=? AND passwd=?";
			ArrayList<String> paras = new ArrayList<String>();
			paras.add(username);
			paras.add(password);

			ResultSet rs = bd.exeQuery(strSql, paras);
			if (rs.next()) {
				 bd.exeUpdate(sql2, parass);
//                ResultSet emf= bd.getRs(emfile);//员工档案数据库读取
//                ResultSet emj=bd.getRs(emj_x);//绩效考核数据库读取
//                ResultSet emk= bd.getRs(emk_q);
				session.setAttribute("userNames", username);
				session.setAttribute("userType", "user");
				response.sendRedirect("admin/users.jsp");
//                RequestDispatcher dispatcher=request.getRequestDispatcher("admin/users.jsp");
//                dispatcher.forward(request, response);
			} else {
				out.print("<script language='JavaScript'>window.alert('用户名或密码不正确，即将返回登录页面')</script>");
				out.print("<script language='JavaScript'>window.location ='login6.jsp'</script>");
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

