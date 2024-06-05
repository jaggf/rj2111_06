package mybean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BaseDAO {
    private Connection conn;
    private Statement stm = null;
    private PreparedStatement pstm = null;
    private ResultSet rs = null;
    private String strConn;
    private String strUser = "";
    private String strPwd="";

    //连接到指定数据库
    public Connection getConn() throws Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            strConn="jdbc:mysql://localhost:3306/hrms?useUnicode=true&characterEncoding=utf8";
            strUser="root";
            strPwd="root";
            conn = DriverManager.getConnection(strConn,strUser,strPwd);
        }
        catch (Exception e) {
            System.out.println(e);
        }
        return conn;
    }

    //执行不带参数的SELECT语句
    public ResultSet getRs(String sql) throws Exception {
        try {
            conn=getConn();
            stm=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            rs=stm.executeQuery(sql);
            return rs;
        }
        catch(Exception e) {
            System.out.print(e);
            return null;
        }
    }

    //执行不带参数的INSERT、UPDATE、DELETE语句
    public int exec(String sql) throws Exception {
        int n=0;
        try {
            conn=getConn();
            stm=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            n=stm.executeUpdate(sql);
        }
        catch(Exception e) {
            System.out.print(e.toString());
        }
        return n;
    }

    //执行带参数的SELECT语句，第2个参数应是数组
    public ResultSet exeQuery(String sql,ArrayList paras) throws Exception {
        try {
            conn=getConn();
            pstm = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            if (paras != null) {
                Object o[] = paras.toArray();
                for (int i = 0; i < o.length; i++) {
                    if (o[i] instanceof String) {
                        pstm.setString(i + 1, (String) o[i]);
                    }
                }
            }
            rs=pstm.executeQuery();
            return rs;
        }
        catch(Exception e) {
            System.out.print(e);
            return null;
        }
    }

    //执行带参数的INSERT、UPDATE、DELETE语句，第2个参数应是数组
    public int exeUpdate(String sql,ArrayList paras) throws Exception {
        int n=0;
        try {
            conn=getConn();
            pstm = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            if (paras != null) {
                Object o[] = paras.toArray();
                for (int i = 0; i < o.length; i++) {
                    if (o[i] instanceof String) {
                        pstm.setString(i + 1, (String) o[i]);
                    }
                }
            }
            n=pstm.executeUpdate();
        }
        catch(Exception e) {
            System.out.print(e.toString());
        }
        return n;
    }

    //关闭连接
    public void closeConn(){
        try	{
            if (rs!=null)
                rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        try	{
            if (stm!=null)
                stm.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        try	{
            if (pstm!=null)
                pstm.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        try	{
            if (conn!=null)
                conn.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}
