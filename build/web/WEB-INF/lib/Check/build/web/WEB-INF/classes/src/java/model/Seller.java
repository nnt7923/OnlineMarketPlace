package model;

public class Seller {

    private int sellerId;
    private int accountId;
    private String storeName;
    private double rating;
    private String joinDate;

    public Seller() {
    }

    public Seller(int sellerId, int accountId, String storeName, double rating, String joinDate) {
        this.sellerId = sellerId;
        this.accountId = accountId;
        this.storeName = storeName;
        this.rating = rating;
        this.joinDate = joinDate;
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

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

}
