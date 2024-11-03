package model;

import java.sql.Date;

public class Feedback {
    private int feedback_id;     
    private int account_id;       
    private int product_id;          
    private int rating;              
    private Date create_date;        
    private int customer_id;         
    private String feedback_content;  

    // Constructor không tham s?
    public Feedback() {
    }

    // Constructor có tham s?
    public Feedback(int feedback_id, int account_id, int product_id, int rating, Date create_date, int customer_id, String feedback_content) {
        this.feedback_id = feedback_id;
        this.account_id = account_id;
        this.product_id = product_id;
        this.rating = rating;
        this.create_date = create_date;
        this.customer_id = customer_id;
        this.feedback_content = feedback_content;
    }

    // Getter và Setter cho các thu?c tính
    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getFeedback_content() {
        return feedback_content;
    }

    public void setFeedback_content(String feedback_content) {
        this.feedback_content = feedback_content;
    }
}
