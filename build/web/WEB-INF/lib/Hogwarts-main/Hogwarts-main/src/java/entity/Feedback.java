package entity;

import java.sql.Date;

public class Feedback {
    private String feedbackID;
    private String date;
    private String content;
    private String studentID;

    public Feedback() {
    }

    public Feedback(String feedbackID, String date, String content, String studentID) {
        this.feedbackID = feedbackID;
        this.date = date;
        this.content = content;
        this.studentID = studentID;
    }

    public String getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(String feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }
}
