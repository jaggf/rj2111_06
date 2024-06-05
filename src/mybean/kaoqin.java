package mybean;


public class kaoqin {
    private int num;
   private String eid=null;
    private String ename=null;
    private String uptime=null;
    private String downtime=null;
    private String date=null;
    private String backNews = null;
    private String incu=null;

    public kaoqin(){}

    @Override
    public String toString() {
        return "kaoqin{" +
                "num=" + num +
                ", eid='" + eid + '\'' +
                ", ename='" + ename + '\'' +
                ", uptime='" + uptime + '\'' +
                ", downtime='" + downtime + '\'' +
                ", date='" + date + '\'' +
                ", backNews='" + backNews + '\'' +
                ", incu='" + incu + '\'' +
                '}';
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getUptime() {
        return uptime;
    }

    public void setUptime(String uptime) {
        this.uptime = uptime;
    }

    public String getDowntime() {
        return downtime;
    }

    public void setDowntime(String downtime) {
        this.downtime = downtime;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getBackNews() {
        return backNews;
    }

    public void setBackNews(String backNews) {
        this.backNews = backNews;
    }

    public String getIncu() {
        return incu;
    }

    public void setIncu(String incu) {
        this.incu = incu;
    }
}
