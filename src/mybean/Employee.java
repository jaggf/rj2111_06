package mybean;

public class Employee {
    private int employeeID;
    private String username = null;
    private String sex = null;
    private String branch = null;
    private String birthday = null;
    private String nativeplace = null;
    private String marriage = null;
    private long identityID ;
    private String politics = null;
    private String folk = null;
    private String education = null;
    private String department = null;
    private String graduateDate = null;
    private String university = null;
    private String position = null;
    private String incumbency = null;
    private String incumbencyType = null;
    private String resume = null;
    private String backNews = null;

    public Employee() {
    }

    public Employee(int employeeID, String username, String branch, String politics, String education, String incumbencyType) {
        this.employeeID = employeeID;
        this.username = username;
        this.branch = branch;
        this.politics = politics;
        this.education = education;
        this.incumbencyType = incumbencyType;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getNativeplace() {
        return nativeplace;
    }

    public void setNativeplace(String nativeplace) {
        this.nativeplace = nativeplace;
    }

    public String getMarriage() {
        return marriage;
    }

    public void setMarriage(String marriage) {
        this.marriage = marriage;
    }

    public long getIdentityID() {
        return identityID;
    }

    public void setIdentityID(long identityID) {
        this.identityID = identityID;
    }

    public String getPolitics() {
        return politics;
    }

    public void setPolitics(String politics) {
        this.politics = politics;
    }

    public String getFolk() {
        return folk;
    }

    public void setFolk(String folk) {
        this.folk = folk;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getGraduateDate() {
        return graduateDate;
    }

    public void setGraduateDate(String graduateDate) {
        this.graduateDate = graduateDate;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getIncumbency() {
        return incumbency;
    }

    public void setIncumbency(String incumbency) {
        this.incumbency = incumbency;
    }

    public String getIncumbencyType() {
        return incumbencyType;
    }

    public void setIncumbencyType(String incumbencyType) {
        this.incumbencyType = incumbencyType;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public String getBackNews() {
        return backNews;
    }

    public void setBackNews(String backNews) {
        this.backNews = backNews;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "employeeID=" + employeeID +
                ", username='" + username + '\'' +
                ", sex='" + sex + '\'' +
                ", branch='" + branch + '\'' +
                ", birthday='" + birthday + '\'' +
                ", nativeplace='" + nativeplace + '\'' +
                ", marriage='" + marriage + '\'' +
                ", identityID=" + identityID +
                ", politics='" + politics + '\'' +
                ", folk='" + folk + '\'' +
                ", education='" + education + '\'' +
                ", department='" + department + '\'' +
                ", graduateDate='" + graduateDate + '\'' +
                ", university='" + university + '\'' +
                ", position='" + position + '\'' +
                ", incumbency='" + incumbency + '\'' +
                ", incumbencyType='" + incumbencyType + '\'' +
                ", resume='" + resume + '\'' +
                ", backNews='" + backNews + '\'' +
                '}';
    }
}
