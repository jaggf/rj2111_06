package mybean;


public class Salary {
    private int num;
    private String eid=null;
    private String eusername=null;
    private String basesalary= null;
    private String fullwork =null;
    private String month=null;
    private String year=null;
    private String  fivetax = null;
    private String  persontax =null;
    private String backNews = null;
    private String  totalSalary =null;
    private String  incumbency=null;

    public Salary(){}

    @Override
    public String toString() {
        return "Salary{" +
                "num=" + num +
                ", eid='" + eid + '\'' +
                ", eusername='" + eusername + '\'' +
                ", basesalary='" + basesalary + '\'' +
                ", fullwork='" + fullwork + '\'' +
                ", month='" + month + '\'' +
                ", year='" + year + '\'' +
                ", fivetax='" + fivetax + '\'' +
                ", persontax='" + persontax + '\'' +
                ", backNews='" + backNews + '\'' +
                ", totalSalary='" + totalSalary + '\'' +
                ", incumbency='" + incumbency + '\'' +
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

    public String getEusername() {
        return eusername;
    }

    public void setEusername(String eusername) {
        this.eusername = eusername;
    }

    public String getBasesalary() {
        return basesalary;
    }

    public void setBasesalary(String basesalary) {
        this.basesalary = basesalary;
    }

    public String getFullwork() {
        return fullwork;
    }

    public void setFullwork(String fullwork) {
        this.fullwork = fullwork;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getFivetax() {
        return fivetax;
    }

    public void setFivetax(String fivetax) {
        this.fivetax = fivetax;
    }

    public String getPersontax() {
        return persontax;
    }

    public void setPersontax(String persontax) {
        this.persontax = persontax;
    }

    public String getBackNews() {
        return backNews;
    }

    public void setBackNews(String backNews) {
        this.backNews = backNews;
    }

    public String getTotalSalary() {
        return totalSalary;
    }

    public void setTotalSalary(String totalSalary) {
        this.totalSalary = totalSalary;
    }

    public String getIncumbency() {
        return incumbency;
    }

    public void setIncumbency(String incumbency) {
        this.incumbency = incumbency;
    }
}
