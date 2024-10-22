package model;

public class ProductDetails {
    private int pdId;
    private int productId;
    private String pdname;
    private double pdpriceDiscount;
    private String pdcolor;
    private String pdimg;
    private String pdcriteria;
    private int pdquantity;
    private String pddescribe;
    private String pdspecification;

    public ProductDetails(int pdId, int productId, String pdname, double pdpriceDiscount, String pdcolor, String pdimg, String pdcriteria, int pdquantity, String pddescribe, String pdspecification) {
        this.pdId = pdId;
        this.productId = productId;
        this.pdname = pdname;
        this.pdpriceDiscount = pdpriceDiscount;
        this.pdcolor = pdcolor;
        this.pdimg = pdimg;
        this.pdcriteria = pdcriteria;
        this.pdquantity = pdquantity;
        this.pddescribe = pddescribe;
        this.pdspecification = pdspecification;
    }

    
    // Getters và Setters
    public int getPdId() {
        return pdId;
    }

    public void setPdId(int pdId) {
        this.pdId = pdId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getPdname() {
        return pdname;
    }

    public void setPdname(String pdname) {
        this.pdname = pdname;
    }

    public double getPdpriceDiscount() {
        return pdpriceDiscount;
    }

    public void setPdpriceDiscount(double pdpriceDiscount) {
        this.pdpriceDiscount = pdpriceDiscount;
    }

    public String getPdcolor() {
        return pdcolor;
    }

    public void setPdcolor(String pdcolor) {
        this.pdcolor = pdcolor;
    }

    public String getPdimg() {
        return pdimg;
    }

    public void setPdimg(String pdimg) {
        this.pdimg = pdimg;
    }

    public String getPdcriteria() {
        return pdcriteria;
    }

    public void setPdcriteria(String pdcriteria) {
        this.pdcriteria = pdcriteria;
    }

    public int getPdquantity() {
        return pdquantity;
    }

    public void setPdquantity(int pdquantity) {
        this.pdquantity = pdquantity;
    }

    public String getPddescribe() {
        return pddescribe;
    }

    public void setPddescribe(String pddescribe) {
        this.pddescribe = pddescribe;
    }

    public String getPdspecification() {
        return pdspecification;
    }

    public void setPdspecification(String pdspecification) {
        this.pdspecification = pdspecification;
    }
}
