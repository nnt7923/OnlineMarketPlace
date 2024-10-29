package entity;

public class Teacher {
    private String teacherID;
    private String userID;
    private String degree;

    public Teacher() {
    }

    public Teacher(String teacherID, String userID, String degree) {
        this.teacherID = teacherID;
        this.userID = userID;
        this.degree = degree;
    }

    public String getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(String teacherID) {
        this.teacherID = teacherID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }
}
