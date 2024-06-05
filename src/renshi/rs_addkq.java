package renshi;

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

@WebServlet(name = "rs_addkq", value = "/rs_addkq")
public class rs_addkq extends HttpServlet {
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

        String eid = request.getParameter("eid") ;
        try {
            String sql1="SELECT * FROM kaoqin WHERE eid='"+eid+"'";
            ResultSet rs= bd.getRs(sql1);
            if( rs.next()){
                kq.setBackNews(" 该员工编号已存在，单击 <a href='renshi/kq/addkaoqin.jsp'><font color='green'>返回</font></a>，重新添加");
            }

            else{
                String ename = request.getParameter("ename") ;
                String uptime = request.getParameter("uptime") ;
                String downtime = request.getParameter("downtime") ;
                String date = request.getParameter("date") ;
                String incu = request.getParameter("incu") ;
                ArrayList<String> paras = new ArrayList<String>();
                paras.add(eid);
                paras.add(ename);
                paras.add(uptime);
                paras.add(downtime);
                paras.add(date);
                paras.add(incu);
                String sql2="INSERT INTO kaoqin VALUES(?,?,?,?,?,?)";
                int n=bd.exeUpdate(sql2, paras);
                if(n>0) {
                    kq.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='renshi/kq/addkaoqin.jsp'><font color='red'>返回</font></a>，继续添加");
                }
                else {
                    kq.setBackNews(" 添 加 <font color='red'> 失 败 </font> ，单击 <a href='renshi/kq/addkaoqin.jsp'><font color='red'>返回</font></a>，重新添加");
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
        RequestDispatcher dispatcher=request.getRequestDispatcher("renshi/kq/kaoqinshow.jsp");
        dispatcher.forward(request, response);}
}
