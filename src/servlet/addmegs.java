package servlet;

import mybean.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.kaoqin;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "addmegs", value = "/addmegs")
public class addmegs extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		request.setCharacterEncoding("UTF-8");
		BaseDAO bd = new BaseDAO();
		Notice notice = new Notice();
		request.setAttribute("notice",notice);

		try {
				String title = request.getParameter("title") ;
				String content = request.getParameter("content") ;
			java.util.Date data= new Date();
			java.util.Date datas= new Date();
			SimpleDateFormat sim= new SimpleDateFormat("HH:mm:ss");//现在时间
			SimpleDateFormat yaer= new SimpleDateFormat("yyyy-MM-dd");//年月日
			String publishtime= yaer.format(data);
			String time= sim.format(datas);
				String ordernum = request.getParameter("ordernum") ;
				ArrayList<String> paras = new ArrayList<String>();
				paras.add(title);
				paras.add(content);
				paras.add(publishtime);
				paras.add(ordernum);
			    paras.add(time);
				String sql2="INSERT INTO notice(title,content,publish_time,order_num,time) VALUES(?,?,?,?,?)";
				int n=bd.exeUpdate(sql2, paras);
				if(n>0) {
					notice.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='megmager.jsp'><font color='red'>返回</font></a>，继续添加");
				}
				else {
					notice.setBackNews(" 添 加 <font color='red'> 失 败 </font> ，单击 <a href='megmager.jsp'><font color='red'>返回</font></a>，重新添加");
				}
			bd.closeConn();
			}  catch(ClassNotFoundException e) {
			out.println(e.getMessage());
		}
		catch(SQLException e) {
			out.println(e.getMessage());
		}
		catch (Exception e) {
			out.println(e.getMessage());
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("showMegs.jsp");
		dispatcher.forward(request, response);}
}
