package model;

import java.util.Date;

public class Seller {

    private int sellerId;
    private int accountId;
    private String storeName;
    private double rating;
    private Date joinDate;
    private Date lastOnline;
    private String image;
    
    public Seller() {
    }

    public Seller(int sellerId, int accountId, String storeName, double rating, Date joinDate, Date lastOnline, String image) {
        this.sellerId = sellerId;
        this.accountId = accountId;
        this.storeName = storeName;
        this.rating = rating;
        this.joinDate = joinDate;
        this.lastOnline = lastOnline;
        this.image = image;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public Date getLastOnline() {
        return lastOnline;
    }

    public void setLastOnline(Date lastOnline) {
        this.lastOnline = lastOnline;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Seller{" + "sellerId=" + sellerId + ", accountId=" + accountId + ", storeName=" + storeName + ", rating=" + rating + ", joinDate=" + joinDate + ", lastOnline=" + lastOnline + ", image=" + image + '}';
    }

    
    
}
