package servlet;

import mybean.BaseDAO;
import mybean.Employee;
import mybean.kaoqin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(description = "The modkaoqin2 Servlet", urlPatterns = { "/modkaoqin2" })
public class modkaoqin2 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        BaseDAO bd = new BaseDAO();
        kaoqin kq = new kaoqin();
        request.setAttribute("kq",kq);

        String num = request.getParameter("num") ;
//        String eid = request.getParameter("eid") ;
        String ename = request.getParameter("ename") ;
        String uptime = request.getParameter("uptime") ;
        String downtime = request.getParameter("downtime") ;
        String date = request.getParameter("date") ;
        String incu = request.getParameter("incu") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(ename);
        paras.add(uptime);
        paras.add(downtime);
        paras.add(date);
        paras.add(incu);
        paras.add(num);
        try {
            String sql="update kaoqin set ename=?,uptime=?,downtime=?,date=?,incu=? where num=?";
            int n=bd.exeUpdate(sql, paras);
            if(n>0) {
                kq.setBackNews("修改成功，单击<a href='kaoqin/managekaoqin.jsp'><font color='red'>返回</font></a>管理员工档案，继续修改");
            }
            else {
                kq.setBackNews("修改失败，单击<a href='modkaoqin?id="+num+"'> <font color='red'>返回</font></a>，重新修改");
            }
            bd.closeConn();
        }
        catch(ClassNotFoundException e) {
            out.println(e.getMessage());
        }
        catch(SQLException e) {
            out.println(e.getMessage());
        }
        catch (Exception e) {
            out.println(e.getMessage());
        }
        RequestDispatcher dispatcher=request.getRequestDispatcher("kaoqin/kaoqinshow.jsp");
        dispatcher.forward(request, response);
    }

}