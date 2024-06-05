package servlet;

import mybean.BaseDAO;
import mybean.Notice;

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

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet("/MegsCollection")
@MultipartConfig
public class MegsCollection extends HttpServlet {
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
		Notice no = new Notice();
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
			case "searchUser":
				String idU = request.getParameter("id");
				String titleU = request.getParameter("title");
				String publishtimeU = request.getParameter("publishtime");
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/hrms";
					String user = "root";
					String password = "root";
					Connection conn = DriverManager.getConnection(url, user, password);
					String sqlU = "SELECT * FROM notice WHERE 1=1";
					if (!idU.isEmpty()) {
						sqlU += " AND id LIKE '%" + idU + "%'";
					}
					if (!titleU.isEmpty()) {
						sqlU += " AND title LIKE '%" + titleU + "%'";
					}
					if (!publishtimeU.isEmpty()) {
						sqlU += " AND publish_time LIKE '%" + publishtimeU + "%'";
					}
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sqlU);
					request.setAttribute("no", rs);
					request.getRequestDispatcher("checkUsermegs.jsp").forward(request, response);
					rs.close();
					stmt.close();
					conn.close();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case "save":
				try {
					String titles = request.getParameter("title");
					String content = request.getParameter("content");
					java.util.Date data = new Date();
					java.util.Date datas = new Date();
					SimpleDateFormat sim = new SimpleDateFormat("HH:mm:ss");//现在时间
					SimpleDateFormat yaer = new SimpleDateFormat("yyyy-MM-dd");//年月日
					String publishtimes = yaer.format(data);
					String time = sim.format(datas);
					String ordernum = request.getParameter("ordernum");
					paras.add(titles);
					paras.add(content);
					paras.add(publishtimes);
					paras.add(ordernum);
					paras.add(time);
					String sql2 = "INSERT INTO notice(title,content,publish_time,order_num,time) VALUES(?,?,?,?,?)";
					int n = bd.exeUpdate(sql2, paras);
					if (n > 0) {
						request.setAttribute("meg", "添加成功");
					} else {
						request.setAttribute("meg", "添加失败");
					}
					bd.closeConn();
				} catch (ClassNotFoundException e) {
					out.println(e.getMessage());
				} catch (SQLException e) {
					out.println(e.getMessage());
				} catch (Exception e) {
					out.println(e.getMessage());
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher("megmager.jsp");
				dispatcher.forward(request, response);
				break;
			case "update":
				String idu = request.getParameter("id");
				String titleu = request.getParameter("title");
				String content = request.getParameter("content");
				String publishtimeu = request.getParameter("publishtime");
				String ordernum = request.getParameter("ordernum");
				String time = request.getParameter("time");
				paras.add(titleu);
				paras.add(content);
				paras.add(publishtimeu);
				paras.add(ordernum);
				paras.add(time);
				paras.add(idu);
				String sqlu = "update notice set title=?,content=?,publish_time=?,order_num=?,time=? where id=?";
				try {
					System.out.println("***********信息集合servlet：MegsCollection***********");
					System.out.println("SQL: " + sqlu);
					System.out.println("Params: " + paras);
					int i = bd.exeUpdate(sqlu, paras);
					if (i > 0) {
						request.setAttribute("meg", "修改数据成功");
					} else {
						request.setAttribute("meg", "修改数据失败");
					}
					bd.closeConn();
				} catch (Exception e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatchers = request.getRequestDispatcher("megmager.jsp");
				dispatchers.forward(request, response);
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
					if (ids != null) {
						for (String ides : ids) {
							String sqls = "DELETE FROM notice WHERE  id= " + ides;
							stmt.executeUpdate(sqls);
							boo = true;
						}
						if (boo) {
							request.setAttribute("meg", "批量删除成功");
						} else {
							request.setAttribute("meg", "批量删除失败");
						}
						stmt.close();
						conn.close();
					} else {
//						out.print("<script language='JavaScript'>window.alert('未')</script>");
						out.print("<script language='JavaScript'>window.location ='megmager.jsp'</script>");
						bd.closeConn();
					}

				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				RequestDispatcher dispatchersss = request.getRequestDispatcher("megmager.jsp");
				dispatchersss.forward(request, response);
				bd.closeConn();
				break;
//				文件上传
			case "upload":
				Part filePart = request.getPart("file");
				java.util.Date daytime = new Date();
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
					request.getRequestDispatcher("megmager.jsp").forward(request, response);

				} else {
					out.print("<script language='JavaScript'>window.alert('上传文件不能为空！！！')</script>");
					out.print("<script language='JavaScript'>window.location ='megmager.jsp'</script>");
				}
				break;
		}
	}
}
