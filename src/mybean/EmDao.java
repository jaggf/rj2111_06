package mybean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmDao {
	BaseDAO ba =new BaseDAO();
	//   获取所有员工信息
	public List<Employee> getAllEm() {
		List<Employee> employees = new ArrayList<>();
		try {
		String sql="SELECT * FROM employee";
			ResultSet resultSet = ba.getRs(sql);
			while (resultSet.next()) {
				int employeeid = resultSet.getInt("employeeId");
				String username = resultSet.getString("userName");
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

			ba.closeConn();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return employees;
	}

              //	分页功能
			  private static final String URL = "jdbc:mysql://localhost:3306/database_name";
	private static final String USERNAME = "username";
	private static final String PASSWORD = "password";

	public List<Employee> getAllEmployees(int offset, int limit) {
		List<Employee> employees = new ArrayList<>();

		try {
			Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM employee LIMIT ?, ?");
			statement.setInt(1, offset);
			statement.setInt(2, limit);

			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				Employee employee = new Employee();
				employee.setEmployeeID(resultSet.getInt("employeeID"));
				employee.setUsername(resultSet.getString("username"));
				employee.setBranch(resultSet.getString("branch"));
				employee.setPolitics(resultSet.getString("politics"));
				employee.setEducation(resultSet.getString("education"));
				employee.setIncumbencyType(resultSet.getString("incumbencyType"));

				employees.add(employee);
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return employees;
	}

	public int getTotalPages(int pageSize) {
		int totalPages = 0;

		try {
			Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) as total FROM employee");

			if (resultSet.next()) {
				int totalRecords = resultSet.getInt("total");
				totalPages = (int) Math.ceil((double) totalRecords / pageSize);
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return totalPages;
	}
}
