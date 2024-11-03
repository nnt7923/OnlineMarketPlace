package model;

import java.util.Date;
import java.util.List;

public class Order {
    private int orderId;
    private Customer customer;
    private double totalPrice;
    private String note;
    private Date ordertime;
    private Shipping shipping;
    private List <OrderDetail> orderDetail;
    private Status status;
    private String payment;
    private Seller seller;
    
    public Order() {
    }

    public Order(int orderId, Customer customer, double totalPrice, String note, Date ordertime, Shipping shipping, List<OrderDetail> orderDetail, Status status, String payment, Seller seller) {
        this.orderId = orderId;
        this.customer = customer;
        this.totalPrice = totalPrice;
        this.note = note;
        this.ordertime = ordertime;
        this.shipping = shipping;
        this.orderDetail = orderDetail;
        this.status = status;
        this.payment = payment;
        this.seller = seller;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    public List<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(List<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", customer=" + customer + ", totalPrice=" + totalPrice + ", note=" + note + ", ordertime=" + ordertime + ", shipping=" + shipping + ", orderDetail=" + orderDetail + ", status=" + status + ", payment=" + payment + ", seller=" + seller + '}';
    }


}
