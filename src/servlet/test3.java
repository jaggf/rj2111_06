package servlet;

import mybean.EmDao;
import mybean.Employee;
import mybean.Notice;
import mybean.NoticeDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test3")
public class test3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		request.setCharacterEncoding("UTF-8");
		EmDao emDao = new EmDao();
		List<Employee> em = emDao.getAllEm();
		for(int i=0;i<em.size();i++){

			System.out.println(em.get(i).getEmployeeID());

		}
		request.setAttribute("employee", em);
		request.getRequestDispatcher("test3.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
