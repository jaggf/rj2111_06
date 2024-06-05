package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import mybean.BaseDAO;

@WebServlet(description = "The Servlet to Verify Login", urlPatterns = {"/emlgin"})
public class emlogin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		ArrayList<String> parass = new ArrayList<String>();
		ArrayList<Object> ipAddressesList = new ArrayList<>();
		BaseDAO bd = new BaseDAO();
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			java.util.Date datas = new Date();
			String type = "管理员";
			String computerName = System.getenv("COMPUTERNAME");
			System.out.println("计算机名：" + computerName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = sdf.format(datas);
//			InetAddress ip = InetAddress.getLocalHost();
//			String ipAddress = ip.getHostAddress();
//			System.out.println("IP地址：" + ipAddress);

			parass.add(username);
			parass.add(time);
			parass.add(type);
			parass.add(computerName);
			Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
			while (networkInterfaces.hasMoreElements()) {
				NetworkInterface networkInterface = networkInterfaces.nextElement();
				Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
				while (inetAddresses.hasMoreElements()) {
					InetAddress address = inetAddresses.nextElement();
					if (!address.isLoopbackAddress() && address instanceof Inet4Address) {
						String ipAddress = address.getHostAddress();
						ipAddressesList.add(ipAddress);
						System.out.println(ipAddress);
					}
				}
			}
			// 将ArrayList转换为String数组
			String[] ipAddressesArray = ipAddressesList.toArray(new String[0]);
			String[] parts = ipAddressesArray[1].split("\\."); // 使用split方法按照"."分割字符串
			String result = parts[0] + "." + parts[1]; // 获取前两部分并拼接
			if (!result.equals("192.168") && !result.equals("10.10")) {
				ipAddressesArray[1] = "未连接网络";
				parass.add(ipAddressesArray[1]);
			} else {
				parass.add(ipAddressesArray[1]);
			}
			ArrayList<String> paras = new ArrayList<String>();
			paras.add(username);
			paras.add(password);
			String sql2 = "INSERT INTO landingrecord(user_name,show_time,type,computer_name,ip_address) VALUES(?,?,?,?,?)";
			String strSql = "SELECT * FROM users WHERE UserName=? AND Password=?";
			ResultSet rs = bd.exeQuery(strSql, paras);
			if (rs.next()) {
				bd.exeUpdate(sql2, parass);
				session.setAttribute("userName", username);
				session.setAttribute("userType", "admin");
//                RequestDispatcher dispatcher=request.getRequestDispatcher("admin/admin.jsp"); dispatcher.forward(request, response);
				response.sendRedirect("admin/admin.jsp");
			} else {
				out.print("<script language='JavaScript'>window.alert('用户名或密码不正确，即将返回登录页面')</script>");
				out.print("<script language='JavaScript'>window.location ='login5.jsp'</script>");
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

