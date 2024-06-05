package servlet;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


import java.io.IOException;
import java.io.OutputStream;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet("/EmployeeDownload")
public class EmployeeDownload extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置响应头信息
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment;filename=employee.xlsx");

		// 从数据库中获取数据
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url = "jdbc:mysql://localhost:3306/hrms";
		String user = "root";
		String password = "root";
		String sql = "SELECT EmployeeID,UserName,Sex ,Branch, Birthday ,NativePlace ,Marriage,IdentityID,Politics ,Folk ,Education ,Department ,GraduateDate, University, Positions , Incumbency, IncumbencyType ,Resume FROM employee";

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			// 创建Excel工作簿和工作表
			Workbook workbook = new XSSFWorkbook();
			Sheet sheet = workbook.createSheet("employee");

			// 创建表头
			Row headerRow = sheet.createRow(0);
			headerRow.createCell(0).setCellValue("员工编号");
			headerRow.createCell(1).setCellValue("姓名");
			headerRow.createCell(2).setCellValue("性别");
			headerRow.createCell(3).setCellValue("所属部门");
			headerRow.createCell(4).setCellValue("出生日期");
			headerRow.createCell(5).setCellValue("籍贯");
			headerRow.createCell(6).setCellValue("婚姻状况");
			headerRow.createCell(7).setCellValue("身份证号");
			headerRow.createCell(8).setCellValue("政治面貌");
			headerRow.createCell(9).setCellValue("民族");
			headerRow.createCell(10).setCellValue("学历");
			headerRow.createCell(11).setCellValue("专业");
			headerRow.createCell(12).setCellValue("毕业日期");
			headerRow.createCell(13).setCellValue("毕业院校");
			headerRow.createCell(14).setCellValue("职称");
			headerRow.createCell(15).setCellValue("在职情况");
			headerRow.createCell(16).setCellValue("用工形式");
			headerRow.createCell(17).setCellValue("简介");
			// 填充数据
			int rowIndex = 1;
			while (rs.next()) {
				Row dataRow = sheet.createRow(rowIndex++);
				dataRow.createCell(0).setCellValue(rs.getString("EmployeeID"));
				dataRow.createCell(1).setCellValue(rs.getString("UserName"));
				dataRow.createCell(2).setCellValue(rs.getString("Sex"));
				dataRow.createCell(3).setCellValue(rs.getString("Branch"));
				dataRow.createCell(4).setCellValue(rs.getString("Birthday"));
				dataRow.createCell(5).setCellValue(rs.getString("NativePlace"));
				dataRow.createCell(6).setCellValue(rs.getString("Marriage"));
				dataRow.createCell(7).setCellValue(rs.getString("IdentityID"));
				dataRow.createCell(8).setCellValue(rs.getString("Politics"));
				dataRow.createCell(9).setCellValue(rs.getString("Folk"));
				dataRow.createCell(10).setCellValue(rs.getString("Education"));
				dataRow.createCell(11).setCellValue(rs.getString("Department"));
				dataRow.createCell(12).setCellValue(rs.getString("GraduateDate"));
				dataRow.createCell(13).setCellValue(rs.getString("University"));
				dataRow.createCell(14).setCellValue(rs.getString("Positions"));
				dataRow.createCell(15).setCellValue(rs.getString("Incumbency"));
				dataRow.createCell(16).setCellValue(rs.getString("IncumbencyType"));
				dataRow.createCell(17).setCellValue(rs.getString("Resume"));
			}

			// 将Excel数据写入响应流
			OutputStream outputStream = response.getOutputStream();
			workbook.write(outputStream);
			workbook.close();
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
