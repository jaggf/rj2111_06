package servlet;

import mybean.*;
import org.apache.poi.ss.usermodel.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.Serial;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@WebServlet("/acount")
@MultipartConfig
public class acount extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String method = request.getParameter("method");
		BaseDAO bd = new BaseDAO();
		ArrayList<String> paras = new ArrayList<String>();
		users us = new users();
		emuser eu = new emuser();
		renshi ren = new renshi();
//		对象存入request域中
		request.setAttribute("eu",eu);
		request.setAttribute("us", us);
		request.setAttribute("ren",ren);
		switch (method) {
			case "list":
				break;
			case "search":
				String id = request.getParameter("id");
				String title = request.getParameter("title");
				String publishtime = request.getParameter("publishtime");
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/hrms";
					String user = "root";
					String password = "root";
					Connection conn = DriverManager.getConnection(url, user, password);
					String sql = "SELECT * FROM notice WHERE 1=1";
					if (!id.isEmpty()) {
						sql += " AND id LIKE '%" + id + "%'";
					}
					if (!title.isEmpty()) {
						sql += " AND title LIKE '%" + title + "%'";
					}
					if (!publishtime.isEmpty()) {
						sql += " AND publish_time LIKE '%" + publishtime + "%'";
					}
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					request.setAttribute("no", rs);
					request.getRequestDispatcher("seachMegs.jsp").forward(request, response);
					rs.close();
					stmt.close();
					conn.close();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case "adminsave":
				try {
					String UserName = request.getParameter("UserName");
					String Password = request.getParameter("Password");
					paras.add(UserName);
					paras.add(Password);
					String sql2 = "INSERT INTO users(UserName,Password) VALUES(?,?)";
					int n = bd.exeUpdate(sql2, paras);
					if (n > 0) {
						us.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/admins.jsp'><font color='red'>返回</font></a>，继续添加");
					} else {
						us.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/admins.jsp'><font color='red'>返回</font></a>，继续添加");
					}
					bd.closeConn();
				} catch (ClassNotFoundException e) {
					out.println(e.getMessage());
				} catch (SQLException e) {
					out.println(e.getMessage());
				} catch (Exception e) {
					out.println(e.getMessage());
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher("em_acounts/ac_show.jsp");
				dispatcher.forward(request, response);
				break;
			case "usersave":
				try {
					String UserNames = request.getParameter("UserName");
					String Passwords = request.getParameter("Password");
					ArrayList<String> para = new ArrayList<String>();
					para.add(UserNames);
					para.add(Passwords);
					String sql22 = "INSERT INTO emuser(eid,passwd) VALUES(?,?)";
					int ns = bd.exeUpdate(sql22, para);
					if (ns > 0) {
						eu.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/user_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					} else {
						eu.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/user_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					}
					bd.closeConn();
				} catch (ClassNotFoundException e) {
					out.println(e.getMessage());
				} catch (SQLException e) {
					out.println(e.getMessage());
				} catch (Exception e) {
					out.println(e.getMessage());
				}
				RequestDispatcher dis = request.getRequestDispatcher("em_acounts/ac_show.jsp");
				dis.forward(request, response);
				break;
			case "magersave":
				try {
					String magerUserNames = request.getParameter("UserName");
					String magerPasswords = request.getParameter("Password");
					ArrayList<String> magerpara = new ArrayList<String>();
					magerpara.add(magerUserNames);
					magerpara.add(magerPasswords);
					String magersql22 = "INSERT INTO renshi(username,password) VALUES(?,?)";
					int ns = bd.exeUpdate(magersql22, magerpara);
					if (ns > 0) {
						ren.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/mager_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					} else {
						ren.setBackNews(" 添 加 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/mager_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					}
					bd.closeConn();
				} catch (ClassNotFoundException e) {
					out.println(e.getMessage());
				} catch (SQLException e) {
					out.println(e.getMessage());
				} catch (Exception e) {
					out.println(e.getMessage());
				}
				RequestDispatcher magerdis = request.getRequestDispatcher("em_acounts/ac_show.jsp");
				magerdis.forward(request, response);
				break;
			case "adminupdate":
				String UserName = request.getParameter("UserName");
				String Password = request.getParameter("Password");
				paras.add(Password);
				paras.add(UserName);
				String sqlu = "update users set Password=? where UserName=?";
				try {
					System.out.println("***********管理员账号集合servlet：MegsCollection***********");
					System.out.println("SQL: " + sqlu);
					System.out.println("Params: " + paras);
					int i = bd.exeUpdate(sqlu, paras);
					if (i > 0) {
						us.setBackNews(" 更新 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/admins.jsp'><font color='red'>返回</font></a>，继续添加");
					} else {
						us.setBackNews(" 更新 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/admins.jsp'><font color='red'>返回</font></a>，继续添加");
					}
					bd.closeConn();
				} catch (Exception e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatchers = request.getRequestDispatcher("em_acounts/ac_show.jsp");
				dispatchers.forward(request, response);
				break;
			case "userupdate":
				String UserNameu = request.getParameter("UserName");
				String Passwordu = request.getParameter("Password");
				paras.add(Passwordu);
				paras.add(UserNameu);
				String sqlu2 = "update emuser set passwd=? where eid=?";
				try {
					System.out.println("***********用户账号集合servlet：acount控制层***********");
					System.out.println("SQL: " + sqlu2);
					System.out.println("Params: " + paras);
					int i2 = bd.exeUpdate(sqlu2, paras);
					if (i2 > 0) {
						eu.setBackNews(" 更新 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/user_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					} else {
						eu.setBackNews(" 更新 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/user_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					}
					bd.closeConn();
				} catch (Exception e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatchersuser = request.getRequestDispatcher("em_acounts/ac_show.jsp");
				dispatchersuser.forward(request, response);
				break;
			case "magerupdate":
				String UserNameumager = request.getParameter("UserName");
				String Passwordumager = request.getParameter("Password");
				paras.add(Passwordumager);
				paras.add(UserNameumager);
				String sqlu2mager = "update renshi set password=? where username=?";
				try {
					System.out.println("***********用户账号集合servlet：acount控制层***********");
					System.out.println("SQL: " + sqlu2mager);
					System.out.println("Params: " + paras);
					int i2 = bd.exeUpdate(sqlu2mager, paras);
					if (i2 > 0) {
						ren.setBackNews(" 更新 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/mager_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					} else {
						ren.setBackNews(" 更新 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/mager_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					}
					bd.closeConn();
				} catch (Exception e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatchersmager = request.getRequestDispatcher("em_acounts/ac_show.jsp");
				dispatchersmager.forward(request, response);
				break;
			case "delete":
				String id1 = request.getParameter("id");
				paras.add(id1);
				String sqlDel = "DElETE FROM notice WHERE id=?";
				try {
					int i = bd.exeUpdate(sqlDel, paras);
					if (i > 0) {
						request.setAttribute("meg", "删除成功");
					} else {
						request.setAttribute("meg", "删除失败");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatcherss = request.getRequestDispatcher("megmager.jsp");
				dispatcherss.forward(request, response);
				bd.closeConn();
				break;
			case "moreDelete":
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/hrms?useUnicode=true&characterEncoding=utf8";
					String user = "root";
					String password = "root";
					Connection conn = DriverManager.getConnection(url, user, password);
					Statement stmt = conn.createStatement();
					String[] ids = request.getParameterValues("ids");
					Boolean boo = false;
					for (String ides : ids) {
						String sqls = "DELETE FROM users WHERE  UserName='" + ides + "'";
						stmt.executeUpdate(sqls);
						boo = true;
					}
					if (boo) {
						us.setBackNews(" 删除 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/admins.jsp'><font color='red'>返回</font></a>，继续添加");
					} else {
						us.setBackNews(" 删除 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/admins.jsp'><font color='red'>返回</font></a>，继续添加");
					}
					stmt.close();
					conn.close();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatchersss = request.getRequestDispatcher("em_acounts/ac_show.jsp");
				dispatchersss.forward(request, response);
				bd.closeConn();
				break;
			case "usermoreDelete":
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					String urls = "jdbc:mysql://localhost:3306/hrms?useUnicode=true&characterEncoding=utf8";
					String users = "root";
					String passwords = "root";
					Connection conns = DriverManager.getConnection(urls, users, passwords);
					Statement stmts = conns.createStatement();
					String[] idsuser = request.getParameterValues("ids");
					Boolean boo = false;
					for (String ides : idsuser) {
						String sqls = "DELETE FROM emuser WHERE  eid='" + ides + "'";
						stmts.executeUpdate(sqls);
						boo = true;
					}
					if (boo) {
						eu.setBackNews(" 删除 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/user_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					} else {
						eu.setBackNews(" 删除 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/user_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					}
					stmts.close();
					conns.close();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatchersdeluser = request.getRequestDispatcher("em_acounts/ac_show.jsp");
				dispatchersdeluser.forward(request, response);
				bd.closeConn();
				break;
			case "renshimoreDelete":
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					String rurl = "jdbc:mysql://localhost:3306/hrms?useUnicode=true&characterEncoding=utf8";
					String ruser = "root";
					String rpassword = "root";
					Connection rconn = DriverManager.getConnection(rurl, ruser, rpassword);
					Statement rstmt = rconn.createStatement();
					String[] rids = request.getParameterValues("ids");
					Boolean rboo = false;
					for (String ides : rids) {
						String sqls = "DELETE FROM renshi WHERE  username='" + ides + "'";
						rstmt.executeUpdate(sqls);
						rboo = true;
					}
					if (rboo) {
						ren.setBackNews(" 删除 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/mager_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					} else {
						ren.setBackNews(" 删除 <font color='red'> 成 功 </font> ，单击 <a href='em_acounts/mager_ac.jsp'><font color='red'>返回</font></a>，继续添加");
					}
					rstmt.close();
					rconn.close();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				RequestDispatcher renshidispatchersss = request.getRequestDispatcher("em_acounts/ac_show.jsp");
				renshidispatchersss.forward(request, response);
				bd.closeConn();
				break;
//				文件上传
			case "upload":
				Part filePart = request.getPart("file");
				java.util.Date daytime = new java.util.Date();
				java.util.Date datas = new Date();
				SimpleDateFormat sim = new SimpleDateFormat("HH:mm:ss");//现在时间
				SimpleDateFormat yaer = new SimpleDateFormat("yyyy-MM-dd");//年月日
				String publishtimes = yaer.format(daytime);
				String times = sim.format(datas);
				InputStream fileContent = filePart.getInputStream();
				if (filePart.getSize() != 0) {
					// 使用Apache POI读取Excel文件内容
					Workbook workbook = WorkbookFactory.create(fileContent);
					Sheet sheet = workbook.getSheetAt(0);

					List<Notice> dataList = new ArrayList<>();
					Iterator<Row> rowIterator = sheet.iterator();
// 跳过第一行（标题行）
					if (rowIterator.hasNext()) {
						rowIterator.next();
					}

					while (rowIterator.hasNext()) {
						Row row = rowIterator.next();
						Notice nos = new Notice();
						Cell cell1 = row.getCell(0);
						Cell cell2 = row.getCell(1);
						Cell cell3 = row.getCell(2);
						//获取表格每一行数据
						if (cell1.getCellType() == CellType.STRING) {
							nos.setTitle(cell1.getStringCellValue());
						} else if (cell1.getCellType() == CellType.NUMERIC) {
							nos.setTitle(String.valueOf(cell1.getNumericCellValue()));
						}

						if (cell2.getCellType() == CellType.STRING) {
							nos.setContent(cell2.getStringCellValue());
						} else if (cell2.getCellType() == CellType.NUMERIC) {
							nos.setContent(String.valueOf(cell2.getNumericCellValue()));
						}

						if (cell3.getCellType() == CellType.STRING) {
							nos.setOrderNum(Integer.parseInt(cell3.getStringCellValue()));
						} else if (cell3.getCellType() == CellType.NUMERIC) {
							nos.setOrderNum((int) cell3.getNumericCellValue());
						}
						nos.setPublishTime(publishtimes);
						nos.setTime(times);
						dataList.add(nos);
					}
					System.out.println("*******导入Excel表格数据********");
					System.out.println(dataList);
					// 将数据插入到MySQL数据库中
					Connection connection = null;
					PreparedStatement statement = null;
					try {
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms", "root", "root");
						String sql = "INSERT INTO notice (title, content,order_num,publish_time,time) VALUES (?,?,?,?,?)";
						statement = connection.prepareStatement(sql);

						for (Notice data : dataList) {
							statement.setString(1, data.getTitle());
							statement.setString(2, data.getContent());
							statement.setInt(3, data.getOrderNum());
							statement.setString(4, data.getPublishTime());
							statement.setString(5, data.getTime());
							statement.executeUpdate();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						try {
							if (statement != null) {
								statement.close();
							}
							if (connection != null) {
								connection.close();
							}
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
//				 返回处理结果给JSP页面
					request.setAttribute("message", "上传成功");
					request.getRequestDispatcher("test4.jsp").forward(request, response);

				} else {
					out.print("<script language='JavaScript'>window.alert('上传文件不能为空！！！')</script>");
					out.print("<script language='JavaScript'>window.location ='test4.jsp'</script>");
				}
				break;
		}
	}
}
