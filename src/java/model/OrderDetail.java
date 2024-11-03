package model;

public class OrderDetail {
    private int orderId;
    private int pdId;
    private String productName;
    private double productPrice;
    private int quantity;
    private Order order;
    private ProductDetails productdetail;
    // Getters và Setters

    public OrderDetail() {
    }

    public OrderDetail(int orderId, int pdId, String productName, double productPrice, int quantity, Order order, ProductDetails productdetail) {
        this.orderId = orderId;
        this.pdId = pdId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.order = order;
        this.productdetail = productdetail;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getPdId() {
        return pdId;
    }

    public void setPdId(int pdId) {
        this.pdId = pdId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public ProductDetails getProductdetail() {
        return productdetail;
    }

    public void setProductdetail(ProductDetails productdetail) {
        this.productdetail = productdetail;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "orderId=" + orderId + ", pdId=" + pdId + ", productName=" + productName + ", productPrice=" + productPrice + ", quantity=" + quantity + ", order=" + order + ", productdetail=" + productdetail + '}';
    }

    
}
