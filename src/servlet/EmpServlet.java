package servlet;

import mybean.BaseDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet(name = "EmpServlet", value = "/EmpServlet")
public class EmpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        HttpSession session =request.getSession(true);
        try{
//             if (request.getParameter("checkCode").equals(session.getAttribute("randCheckCode"))){
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            BaseDAO bd=new BaseDAO();
            String strSql="SELECT*FROM users WHERE UserName='"+username+"'AND password='"+password+"'";
            ResultSet rs=bd.getRs(strSql);
            if (rs.next()){
                session.setAttribute("userName",username);
                out.print("<h1 align='center'>欢迎 <font color=blue>"+username+"</font> 来到web人事管理平台</h1>");
                response.setHeader("Refresh","3;URL=firstone.jsp");
//                    out.print("<script language='JavaScript'>window.location='05/default.jsp'</script>");
//                    response.sendRedirect("default.jsp");
//                    RequestDispatcher dispatcher=request.getRequestDispatcher("default.jsp");
//                    dispatcher.forward(request,response);
            }
            else {
                out.print("<script language='JavaScript'>window.alert('用户名or密码错误，马上即将回到登录界面')</script>");
                out.print("<script language='JavaScript'>window.location='05/login2.jsp'</script>");

            }
            bd.closeConn();
//             }
//             else {
//                 out.print("<script language='JavaScript'>window.alert('验证码错误，即将回到登录界面')</script>");
//                 out.print("<script language='JavaScript'>window.location='./web/05/login.jsp'</script>");
//             }
        }
        catch (ClassNotFoundException e){
            out.println(e.getMessage());
        }
        catch (SQLException e){
            out.println(e.getMessage());
        }
        catch (Exception e){
            out.println(e.getMessage());
        }
    }
}
