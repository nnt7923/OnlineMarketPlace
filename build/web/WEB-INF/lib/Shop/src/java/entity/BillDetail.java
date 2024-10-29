package entity;

public class BillDetail {
    private int bid;
    private int pid;
    private int buyQuantity;
    private double buyPrice;
    private double subtotal;

    public BillDetail() {
    }

    public BillDetail(int bid, int pid, int buyQuantity, double buyPrice, double subtotal) {
        this.bid = bid;
        this.pid = pid;
        this.buyQuantity = buyQuantity;
        this.buyPrice = buyPrice;
        this.subtotal = subtotal;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getBuyQuantity() {
        return buyQuantity;
    }

    public void setBuyQuantity(int buyQuantity) {
        this.buyQuantity = buyQuantity;
    }

    public double getBuyPrice() {
        return buyPrice;
    }

    public void setBuyPrice(double buyPrice) {
        this.buyPrice = buyPrice;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
}
