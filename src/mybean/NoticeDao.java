package mybean;

import mybean.Notice;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

	public class NoticeDao {
		private String jdbcUrl = "jdbc:mysql://localhost:3306/hrms?useUnicode=true&characterEncoding=utf8";
		private String username = "root";
		private String password = "root";

		public List<Notice> getAllNotices() {
			List<Notice> notices = new ArrayList<>();
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("SELECT * FROM notice");

				while (resultSet.next()) {
					int id = resultSet.getInt("id");
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String publishTime = resultSet.getString("publish_time");
					int orderNum = resultSet.getInt("order_num");
					Notice notice = new Notice();
					notice.setId(id);
					notice.setTitle(title);
					notice.setContent(content);
					notice.setPublishTime(publishTime);
					notice.setOrderNum(orderNum);
					notices.add(notice);
				}

				resultSet.close();
				statement.close();
				connection.close();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

			return notices;
		}
            //根据id查询
		public Notice getNoticeById(int id) {
			Notice notice = null;
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
				PreparedStatement statement = connection.prepareStatement("SELECT * FROM notice WHERE id = ?");
				statement.setInt(1, id);
				ResultSet resultSet = statement.executeQuery();

				if (resultSet.next()) {
					String title = resultSet.getString("title");
					String content = resultSet.getString("content");
					String publishTime = resultSet.getString("publish_time");
					int orderNum = resultSet.getInt("order_num");

					notice = new Notice();
					notice.setId(id);
					notice.setTitle(title);
					notice.setContent(content);
					notice.setPublishTime(publishTime);
					notice.setOrderNum(orderNum);
				}

				resultSet.close();
				statement.close();
				connection.close();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

			return notice;
		}
//添加公告信息
		public void addNotice(Notice notice) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
				PreparedStatement statement = connection.prepareStatement("INSERT INTO notice (title, content, publish_time,order_num) VALUES (?, ?, ?,?)");
				statement.setString(1, notice.getTitle());
				statement.setString(2, notice.getContent());
				statement.setString(3, notice.getPublishTime());
				statement.setInt(4, notice.getOrderNum());
				statement.executeUpdate();

				statement.close();
				connection.close();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}

		public void updateNotice(Notice notice) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
				PreparedStatement statement = connection.prepareStatement("UPDATE notice SET title = ?, content = ?, publish_time = ?, order_num = ? WHERE id = ?");
				statement.setString(1, notice.getTitle());
				statement.setString(2, notice.getContent());
				statement.setString(3, notice.getPublishTime());
				statement.setInt(4, notice.getId());
				statement.executeUpdate();

				statement.close();
				connection.close();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}

		public void deleteNotice(int id) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
				PreparedStatement statement = connection.prepareStatement("DELETE FROM notice WHERE id = ?");
				statement.setInt(1, id);
				statement.executeUpdate();

				statement.close();
				connection.close();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}


		//   获取所有员工信息
		public List<Employee> getAllEm() {
			List<Employee> employees = new ArrayList<>();
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("SELECT * FROM employee");

				while (resultSet.next()) {
					int employeeid = resultSet.getInt("employeeid");
					String username = resultSet.getString("username");
					String branch = resultSet.getString("branch");
					String politics = resultSet.getString("politics");
					String education = resultSet.getString("education");
					String incumbencyType = resultSet.getString("incumbencyType");
					Employee employee = new Employee();
					employee.setEmployeeID(employeeid);
					employee.setUsername(username);
					employee.setBranch(branch);
					employee.setPolitics(politics);
					employee.setEducation(education);
					employee.setIncumbencyType(incumbencyType);
					employees.add(employee);
				}

				resultSet.close();
				statement.close();
				connection.close();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

			return employees;
		}
	}

