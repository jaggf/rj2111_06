package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.jx;

@WebServlet(name = "Addjx", value = "/Addjx")
public class Addjx extends HttpServlet {
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
		jx jx = new jx();
		request.setAttribute("jx", jx);

		String eid = request.getParameter("eid");
		try {
			String ename = request.getParameter("ename");
			String wk = request.getParameter("wk");
			String mon = request.getParameter("mon");
			String date = request.getParameter("date");
			String zt = request.getParameter("zt");
			ArrayList<String> paras = new ArrayList<String>();
			paras.add(eid);
			paras.add(ename);
			paras.add(wk);
			paras.add(mon);
			paras.add(date);
			paras.add(zt);
			String sql2 = "INSERT INTO jx(eid,ename,wk,mon,date,zt) VALUES(?,?,?,?,?,?)";
			int n = bd.exeUpdate(sql2, paras);
			if (n > 0) {
				jx.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='jx/addjx.jsp'><font color='red'>返回</font></a>，继续添加");
			} else {
				jx.setBackNews(" 添 加 <font color='red'> 失 败 </font> ，单击 <a href='jx/addjx.jsp'><font color='red'>返回</font></a>，重新添加");
			}
			bd.closeConn();
		} catch (ClassNotFoundException e) {
			out.println(e.getMessage());
		} catch (SQLException e) {
			out.println(e.getMessage());
		} catch (Exception e) {
			out.println(e.getMessage());
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("jx/jxshow.jsp");
		dispatcher.forward(request, response);
	}
}
