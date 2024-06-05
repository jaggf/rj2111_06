package renshi;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.ArrayList;

import mybean.BaseDAO;
import mybean.ms;

@WebServlet(name = "rs_addms", value = "/rs_addms")
public class rs_addms extends HttpServlet {
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
        ms ms = new ms();
        request.setAttribute("ms",ms);

        String num = request.getParameter("num") ;
        try {
            String sql1="SELECT * FROM ms WHERE num='"+num+"'";
            ResultSet rs= bd.getRs(sql1);
            if( rs.next()){
                ms.setBackNews(" 该员工编号已存在，单击 <a href='renshi/msjh/rsaddms.jsp'><font color='green'>返回</font></a>，重新添加");
            }

            else{
                String em = request.getParameter("em") ;
                String tel = request.getParameter("tel") ;
                String time = request.getParameter("time") ;
                String msg = request.getParameter("msg") ;
                String zt = request.getParameter("zt") ;
                String jg = request.getParameter("jg") ;
                ArrayList<String> paras = new ArrayList<String>();
                paras.add(num);
                paras.add(em);
                paras.add(tel);
                paras.add(time);
                paras.add(msg);
                paras.add(zt);
                paras.add(jg);
                String sql2="INSERT INTO ms VALUES(?,?,?,?,?,?,?)";
                int n=bd.exeUpdate(sql2, paras);
                if(n>0) {
                    ms.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='renshi/msjh/rsaddms.jsp'><font color='red'>返回</font></a>，继续添加");
                }
                else {
                    ms.setBackNews(" 添 加 <font color='red'> 失 败 </font> ，单击 <a href='renshi/msjh/rsaddms.jsp'><font color='red'>返回</font></a>，重新添加");
                }
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("renshi/msjh/msshow.jsp");
        dispatcher.forward(request, response);}
}
