package model;

public class Shipping {

    private int shippingid;
    private String name;
    private String phone;
    private String address;
    private String status;

    public Shipping() {
    }

    public Shipping(int shippingid, String name, String phone, String address, String status) {
        this.shippingid = shippingid;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.status = status;
    }

    public int getShippingid() {
        return shippingid;
    }

    public void setShippingid(int shippingid) {
        this.shippingid = shippingid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Shipping{" + "shippingid=" + shippingid + ", name=" + name + ", phone=" + phone + ", address=" + address + ", status=" + status + '}';
    }

    
}
