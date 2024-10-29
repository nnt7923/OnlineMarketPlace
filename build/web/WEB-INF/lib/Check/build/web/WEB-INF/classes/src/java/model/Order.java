package model;

public class Order {
    private int orderId;
    private int accountId;
    private double totalPrice;
    private String note;
    private String createDate;
    private int shippingId;
    private int customerId;

    public Order() {
    }

    public Order(int orderId, int accountId, double totalPrice, String note, String createDate, int shippingId, int customerId) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.totalPrice = totalPrice;
        this.note = note;
        this.createDate = createDate;
        this.shippingId = shippingId;
        this.customerId = customerId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
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

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    
}
