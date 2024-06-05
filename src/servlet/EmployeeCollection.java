package servlet;

import mybean.BaseDAO;
import mybean.Employee;
import mybean.Notice;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@WebServlet("/EmployeeCollection")
@MultipartConfig
public class EmployeeCollection extends HttpServlet {
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
					java.util.Date data = new java.util.Date();
					java.util.Date datas = new java.util.Date();
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
				InputStream fileContent = filePart.getInputStream();
				List<Employee> dataList = new ArrayList<>();
				Employee ems = new Employee();
				request.setAttribute("em",ems);
				if (filePart.getSize() != 0) {
					// 使用Apache POI读取Excel文件内容
					Workbook workbook = WorkbookFactory.create(fileContent);
					Sheet sheet = workbook.getSheetAt(0);

					Iterator<Row> rowIterator = sheet.iterator();
// 跳过第一行（标题行）
					if (rowIterator.hasNext()) {
						rowIterator.next();
					}

					while (rowIterator.hasNext()) {
						Row row = rowIterator.next();
						Employee em = new Employee();
						Cell cell1 = row.getCell(0);
						Cell cell2 = row.getCell(1);
						Cell cell3 = row.getCell(2);
						Cell cell4 = row.getCell(3);
						Cell cell5 = row.getCell(4);
						Cell cell6 = row.getCell(5);
						Cell cell7 = row.getCell(6);
						Cell cell8 = row.getCell(7);
						Cell cell9 = row.getCell(8);
						Cell cell10 = row.getCell(9);
						Cell cell11 = row.getCell(10);
						Cell cell12 = row.getCell(11);
						Cell cell13 = row.getCell(12);
						Cell cell14 = row.getCell(13);
						Cell cell15 = row.getCell(14);
						Cell cell16 = row.getCell(15);
						Cell cell17 = row.getCell(16);
						Cell cell18 = row.getCell(17);
						//获取表格每一行数据
						if (cell1.getCellType() == CellType.STRING) {
							em.setEmployeeID(Integer.parseInt(cell1.getStringCellValue()));
						} else if (cell1.getCellType() == CellType.NUMERIC) {
							em.setEmployeeID((int) cell1.getNumericCellValue());
						}

						if (cell2.getCellType() == CellType.STRING) {
							em.setUsername(cell2.getStringCellValue());
						} else if (cell2.getCellType() == CellType.NUMERIC) {
							em.setUsername(String.valueOf(cell2.getNumericCellValue()));
						}

						if (cell3.getCellType() == CellType.STRING) {
							em.setSex(cell3.getStringCellValue());
						} else if (cell3.getCellType() == CellType.NUMERIC) {
							em.setSex(String.valueOf(cell3.getNumericCellValue()));
						}

						// 读取并设置部门
						if (cell4.getCellType() == CellType.STRING) {
							em.setBranch(cell4.getStringCellValue());
						} else if (cell4.getCellType() == CellType.NUMERIC) {
							em.setBranch(String.valueOf(cell4.getNumericCellValue()));
						}
// 读取并设置生日
						if (cell5.getCellType() == CellType.NUMERIC) {
							// 根据实际情况进行日期格式转换
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

							String birthday = sdf.format(cell5.getDateCellValue());
							em.setBirthday(birthday);
						}

						// 读取并设置籍贯
						if (cell6.getCellType() == CellType.STRING) {
							em.setNativeplace(cell6.getStringCellValue());
						} else if (cell6.getCellType() == CellType.NUMERIC) {
							em.setNativeplace(String.valueOf(cell6.getNumericCellValue()));
						}

// 读取并设置婚姻状况
						if (cell7.getCellType() == CellType.STRING) {
							em.setMarriage(cell7.getStringCellValue());
						} else if (cell7.getCellType() == CellType.NUMERIC) {
							em.setMarriage(String.valueOf(cell7.getNumericCellValue()));
						}

// 读取并设置身份证
						if (cell8.getCellType() == CellType.STRING) {
							em.setIdentityID(Long.parseLong(cell8.getStringCellValue()));
						} else if (cell8.getCellType() == CellType.NUMERIC) {
							em.setIdentityID((long) cell8.getNumericCellValue());
						}

						// 读取并设置政治面貌
						if (cell9.getCellType() == CellType.STRING) {
							em.setPolitics(cell9.getStringCellValue());
						} else if (cell9.getCellType() == CellType.NUMERIC) {
							em.setPolitics(String.valueOf(cell9.getNumericCellValue()));
						}

// 读取并设置民族
						if (cell10.getCellType() == CellType.STRING) {
							em.setFolk(cell10.getStringCellValue());
						} else if (cell10.getCellType() == CellType.NUMERIC) {
							em.setFolk(String.valueOf(cell10.getNumericCellValue()));
						}

// 读取并设置学历
						if (cell11.getCellType() == CellType.STRING) {
							em.setEducation(cell11.getStringCellValue());
						} else if (cell11.getCellType() == CellType.NUMERIC) {
							em.setEducation(String.valueOf(cell11.getNumericCellValue()));
						}

						// 读取并设置毕业专业
						if (cell12.getCellType() == CellType.STRING) {
							em.setDepartment(cell12.getStringCellValue());
						} else if (cell12.getCellType() == CellType.NUMERIC) {
							em.setDepartment(String.valueOf(cell12.getNumericCellValue()));
						}

// 读取并设置毕业日期
						if (cell13.getCellType() == CellType.NUMERIC) {
							// 根据实际情况进行日期格式转换
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							String graduateDate = sdf.format(cell13.getDateCellValue());
							em.setGraduateDate(graduateDate);
						}

// 读取并设置毕业院校
						if (cell14.getCellType() == CellType.STRING) {
							em.setUniversity(cell14.getStringCellValue());
						} else if (cell14.getCellType() == CellType.NUMERIC) {
							em.setUniversity(String.valueOf(cell14.getNumericCellValue()));
						}

// 读取并设置职位
						if (cell15.getCellType() == CellType.STRING) {
							em.setPosition(cell15.getStringCellValue());
						} else if (cell15.getCellType() == CellType.NUMERIC) {
							em.setPosition(String.valueOf(cell15.getNumericCellValue()));
						}

// 读取并设置在职状态
						if (cell16.getCellType() == CellType.STRING) {
							em.setIncumbency(cell16.getStringCellValue());
						} else if (cell16.getCellType() == CellType.NUMERIC) {
							em.setIncumbency(String.valueOf(cell16.getNumericCellValue()));
						}

// 读取并设置在职类型
						if (cell17.getCellType() == CellType.STRING) {
							em.setIncumbencyType(cell17.getStringCellValue());
						} else if (cell17.getCellType() == CellType.NUMERIC) {
							em.setIncumbencyType(String.valueOf(cell17.getNumericCellValue()));
						}

// 读取并设置简历
						if (cell18.getCellType() == CellType.STRING) {
							em.setResume(cell18.getStringCellValue());
						} else if (cell18.getCellType() == CellType.NUMERIC) {
							em.setResume(String.valueOf(cell18.getNumericCellValue()));
						}

						dataList.add(em);
					}

					System.out.println("*******导入Excel表格数据********");
					System.out.println(dataList);
					// 将数据插入到MySQL数据库中
					Connection connection = null;
					PreparedStatement statement = null;
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms", "root", "root");
						String sql = "INSERT INTO employee (EmployeeID,UserName,Sex ,Branch, Birthday ,NativePlace ,Marriage,IdentityID,Politics ,Folk ,Education ,Department ,GraduateDate, University, Positions , Incumbency, IncumbencyType ,Resume) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						statement = connection.prepareStatement(sql);

						for (Employee employee : dataList) {
							statement.setInt(1, employee.getEmployeeID());
							statement.setString(2, employee.getUsername());
							statement.setString(3, employee.getSex());
							statement.setString(4, employee.getBranch());
							statement.setString(5, employee.getBirthday());
							statement.setString(6, employee.getNativeplace());
							statement.setString(7, employee.getMarriage());
							statement.setLong(8, employee.getIdentityID());
							statement.setString(9, employee.getPolitics());
							statement.setString(10, employee.getFolk());
							statement.setString(11, employee.getEducation());
							statement.setString(12, employee.getDepartment());
							statement.setString(13, employee.getGraduateDate());
							statement.setString(14, employee.getUniversity());
							statement.setString(15, employee.getPosition());
							statement.setString(16, employee.getIncumbency());
							statement.setString(17, employee.getIncumbencyType());
							statement.setString(18, employee.getResume());
							statement.executeUpdate();
						}
					} catch (SQLException | ClassNotFoundException e) {
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
					if (statement !=null){
						ems.setBackNews(" 数据导入 <font color='red'> 成 功 </font> ，单击 <a href='Employee_file/manageEmployee.jsp'><font color='red'>返回</font></a> ");
					}else {
						ems.setBackNews(" 数据导入 <font color='red'> 失败 </font> ，单击 <a href='Employee_file/manageEmployee.jsp'><font color='red'>返回</font></a> ");
					}
//				 返回处理结果给JSP页面
					request.getRequestDispatcher("Employee_file/show.jsp").forward(request, response);

				} else {
					out.print("<script language='JavaScript'>window.alert('上传文件不能为空！！！')</script>");
					out.print("<script language='JavaScript'>window.location ='Employee_file/manageEmployee.jsp'</script>");
				}
				break;
		}
	}
}
