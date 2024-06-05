package servlet;

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

@WebServlet("/MegDownLoad")
public class MegDownLoad extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置响应头信息
		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment;filename=notice.xlsx");

		// 从数据库中获取数据
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url = "jdbc:mysql://localhost:3306/hrms";
		String user = "root";
		String password = "root";
		String sql = "SELECT title, content,publish_time,time,order_num FROM notice order by publish_time DESC";

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			// 创建Excel工作簿和工作表
			Workbook workbook = new XSSFWorkbook();
			Sheet sheet = workbook.createSheet("notice");

			// 创建表头
			Row headerRow = sheet.createRow(0);
			headerRow.createCell(0).setCellValue("标题");
			headerRow.createCell(1).setCellValue("内容");
			headerRow.createCell(2).setCellValue("发布日期");
			headerRow.createCell(3).setCellValue("发布时间");
			headerRow.createCell(4).setCellValue("排序号");

			// 填充数据
			int rowIndex = 1;
			while (rs.next()) {
				Row dataRow = sheet.createRow(rowIndex++);
				dataRow.createCell(0).setCellValue(rs.getString("title"));
				dataRow.createCell(1).setCellValue(rs.getString("content"));
				dataRow.createCell(2).setCellValue(rs.getString("publish_time"));
				dataRow.createCell(3).setCellValue(rs.getString("time"));
				dataRow.createCell(4).setCellValue(rs.getInt("order_num"));
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
