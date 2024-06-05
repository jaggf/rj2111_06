package users;
import mybean.BaseDAO;
import mybean.kaoqin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "daka2", value = "/daka2")
public class daka2 extends HttpServlet {
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
        kaoqin kq = new kaoqin();
        request.setAttribute("kq",kq);
        java.util.Date data= new Date();
        SimpleDateFormat downtimes= new SimpleDateFormat("HH:mm:ss");//下班打卡
        String downtime=downtimes.format(data);
        String num = request.getParameter("num") ;
        String ename = request.getParameter("ename") ;
        ArrayList<String> paras = new ArrayList<String>();
        paras.add(downtime);
        paras.add(num);
        try{
            String sql="update kaoqin set downtime=? where num=?";
            int n=bd.exeUpdate(sql, paras);
            if(n>0) {
                kq.setBackNews(" 上班打卡 <font color='green'> 成 功 </font> ，单击 <a href='user/kqme.jsp'><font color='red'>返回</font></a>，继续添加");
            }
            else {
                kq.setBackNews(" 上班打卡 <font color='red'> 失 败 </font> ，单击 <a href='user/kqme.jsp'><font color='red'>返回</font></a>，重新添加");
            }
        } catch(ClassNotFoundException e) { out.println(e.getMessage());
        }
        catch(SQLException e) { out.println(e.getMessage());
        }
        catch (Exception e) { out.println(e.getMessage());
        }
        RequestDispatcher dispatcher=request.getRequestDispatcher("user/useshow.jsp");
        dispatcher.forward(request, response);}
}
