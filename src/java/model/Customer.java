package model;

import java.util.Date;

public class Customer {
    private int customerId;
    private String customerName;
    private String customerType;
    private int accountId;
    private Date customerDob;
    private String customerGender;
    private String customerImages;
    

    public Customer() {
    }

    public Customer(int customerId, String customerName, String customerType, int accountId, Date customerDob, String customerGender, String customerImages) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerType = customerType;
        this.accountId = accountId;
        this.customerDob = customerDob;
        this.customerGender = customerGender;
        this.customerImages = customerImages;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public Date getCustomerDob() {
        return customerDob;
    }

    public void setCustomerDob(Date customerDob) {
        this.customerDob = customerDob;
    }

    public String getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }

    public String getCustomerImages() {
        return customerImages;
    }

    public void setCustomerImages(String customerImages) {
        this.customerImages = customerImages;
    }

    

    @Override
    public String toString() {
        return "Customer{" + "customerId=" + customerId + ", customerName=" + customerName + ", customerType=" + customerType + ", accountId=" + accountId + ", customerDob=" + customerDob + ", customerGender=" + customerGender + ", customerImages=" + customerImages + '}';
    }

    
}
