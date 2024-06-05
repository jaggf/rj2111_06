package mybean;

public class users {
	private String UserName;
	private String Password;
	private String backNews;

	public users() {
	}

	public users(String userName, String password) {
		UserName = userName;
		Password = password;
	}

	@Override
	public String toString() {
		return "users{" +
				"UserName='" + UserName + '\'' +
				", Password='" + Password + '\'' +
				", backNews='" + backNews + '\'' +
				'}';
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getBackNews() {
		return backNews;
	}

	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
}
