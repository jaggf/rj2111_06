package Dao;

import mybean.Salary;

import java.util.List;
//用于封装数据字典的列表
public class SalaryDAO {
	private List<Salary> list;

	public List<Salary> getList() {
		return list;
	}

	public void setList(List<Salary> list) {
		this.list = list;
	}
}
