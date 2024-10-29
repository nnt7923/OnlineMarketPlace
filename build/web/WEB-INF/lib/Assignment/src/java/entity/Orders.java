package entity;

import java.util.Date;

public class Orders {
    private int id;
    private int accountId;
    private double totalPrice;
    private String note;
    private Date createDate;
    private int shippingId;

    public Orders() {
    }

    public Orders(int accountId, double totalPrice, String note, Date createDate, int shippingId) {
        this.accountId = accountId;
        this.totalPrice = totalPrice;
        this.note = note;
        this.createDate = createDate;
        this.shippingId = shippingId;
    }

    public Orders(int id, int accountId, double totalPrice, String note, Date createDate, int shippingId) {
        this.id = id;
        this.accountId = accountId;
        this.totalPrice = totalPrice;
        this.note = note;
        this.createDate = createDate;
        this.shippingId = shippingId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }
}
