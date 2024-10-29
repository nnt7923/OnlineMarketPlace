package entity;

public class Cart {
    private int accountID;
    private int productID;
    private int amount;

    public Cart() {
    }

    public Cart(int accountID, int productID, int amount) {
        this.accountID = accountID;
        this.productID = productID;
        this.amount = amount;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
