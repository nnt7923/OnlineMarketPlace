package entity;

import java.util.Date;

public class Bill {
    private int bid;
    private Date dateCreate;
    private String recAddress;
    private String recPhone;
    private String note;
    private double totalMoney;
    private boolean status;
    private int cid;

    public Bill() {
    }

    public Bill(int bid, Date dateCreate, String recAddress, String recPhone, String note, double totalMoney, boolean status, int cid) {
        this.bid = bid;
        this.dateCreate = dateCreate;
        this.recAddress = recAddress;
        this.recPhone = recPhone;
        this.note = note;
        this.totalMoney = totalMoney;
        this.status = status;
        this.cid = cid;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getRecAddress() {
        return recAddress;
    }

    public void setRecAddress(String recAddress) {
        this.recAddress = recAddress;
    }

    public String getRecPhone() {
        return recPhone;
    }

    public void setRecPhone(String recPhone) {
        this.recPhone = recPhone;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
}
