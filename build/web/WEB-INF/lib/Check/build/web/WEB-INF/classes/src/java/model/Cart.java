package model;

public class Cart {
    private int customerId;
    private int productId;
    private int amount;

    // Getters và Setters

    public Cart() {
    }

    public Cart(int customerId, int productId, int amount) {
        this.customerId = customerId;
        this.productId = productId;
        this.amount = amount;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
}
