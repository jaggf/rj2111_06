package servlet;

public class testone {
	public static void main(String[] args) {
		String s = "192.168.137.1";
		String[] parts = s.split("\\."); // 使用split方法按照"."分割字符串
		String result = parts[0] + "." + parts[1]; // 获取前两部分并拼接
		System.out.println(result); // 输出 192.168
	}
}
