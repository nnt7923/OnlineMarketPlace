package model;

import java.util.Date;


public class Voucher {

    private int id;                 
    private String code;             
    private String description;     
    private double discountAmount;    
    private double minOrderValue;    
    private String status;           
    private Date expiryDate;         

    // Constructor
    public Voucher(int id, String code, String description, double discountAmount,
            double minOrderValue, String status, Date expiryDate) {
        this.id = id;
        this.code = code;
        this.description = description;
        this.discountAmount = discountAmount;
        this.minOrderValue = minOrderValue;
        this.status = status;
        this.expiryDate = expiryDate;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(double discountAmount) {
        this.discountAmount = discountAmount;
    }

    public double getMinOrderValue() {
        return minOrderValue;
    }

    public void setMinOrderValue(double minOrderValue) {
        this.minOrderValue = minOrderValue;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }
}
