package model;

import java.util.Date;

public class Feedback {
    private int feedback_id;
    private int accountId;
    private int productId;
    private int rating;
    private Date createDate;
    private int customerId;

    // Getters và Setters

    public Feedback() {
    }

    public Feedback(int feedback_id, int accountId, int productId, int rating, Date createDate, int customerId) {
        this.feedback_id = feedback_id;
        this.accountId = accountId;
        this.productId = productId;
        this.rating = rating;
        this.createDate = createDate;
        this.customerId = customerId;
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    
}
