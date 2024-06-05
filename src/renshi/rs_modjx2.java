package renshi;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.jx;

@WebServlet(name = "rs_modjx2", value = "/rs_modjx2")
public class rs_modjx2 extends HttpServlet {
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
        jx jx = new jx();
        request.setAttribute("jx",jx);

        String eid = request.getParameter("eid") ;
        String ename = request.getParameter("ename") ;
        String wk = request.getParameter("wk") ;
        String mon = request.getParameter("mon") ;
        String date = request.getParameter("date") ;
        String zt = request.getParameter("zt") ;

        ArrayList<String> paras = new ArrayList<String>();
        paras.add(ename);
        paras.add(wk);
        paras.add(mon);
        paras.add(date);
        paras.add(zt);
        paras.add(eid);
        try {
            String sql="update jx set ename=?,wk=?,mon=?,date=?,zt=? where eid=?";
            int n=bd.exeUpdate(sql, paras);
            if(n>0) {
                jx.setBackNews("修改成功，单击<a href='renshi/jxkh/managejx.jsp'><font color='red'>返回</font></a>管理员工档案，继续修改");
            }
            else {
                jx.setBackNews("修改失败，单击<a href='rs_modjx?id="+eid+"'> <font color='red'>返回</font></a>，重新修改");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("renshi/jxkh/jxshow.jsp");
        dispatcher.forward(request, response);
    }

}
