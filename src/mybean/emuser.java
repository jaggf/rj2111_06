package mybean;

public class emuser {
	private String eid;
	private String passwd;
	private String backNews;

	@Override
	public String toString() {
		return "emuser{" +
				"eid='" + eid + '\'' +
				", passwd='" + passwd + '\'' +
				", backNews='" + backNews + '\'' +
				'}';
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getBackNews() {
		return backNews;
	}

	public void setBackNews(String backNews) {
		this.backNews = backNews;
	}
}
