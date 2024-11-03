package model;

public class Product {
    private int productId;
    private String name;
    private String img; 
    private double price;
    private String title;
    private int cid; 
    private int sellerId;
    private int brandId;
    private ProductDetails productdetail;
    // Default constructor

    public Product() {
    }

    public Product(int productId, String name, String img, double price, String title, int cid, int sellerId, int brandId, ProductDetails productdetail) {
        this.productId = productId;
        this.name = name;
        this.img = img;
        this.price = price;
        this.title = title;
        this.cid = cid;
        this.sellerId = sellerId;
        this.brandId = brandId;
        this.productdetail = productdetail;
    }

    public Product(int productId, String name, String img, double price, String title, int cid, int sellerId, int brandId) {
        this.productId = productId;
        this.name = name;
        this.img = img;
        this.price = price;
        this.title = title;
        this.cid = cid;
        this.sellerId = sellerId;
        this.brandId = brandId;
    }

    
    public Product(int productId, String name, String img) {
        this.productId = productId;
        this.name = name;
        this.img = img;
    }
    
    

    public Product(int productId, String name, double price, String title, String img) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.title = title;
        this.img = img;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public ProductDetails getProductdetail() {
        return productdetail;
    }

    public void setProductdetail(ProductDetails productdetail) {
        this.productdetail = productdetail;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", name=" + name + ", img=" + img + ", price=" + price + ", title=" + title + ", cid=" + cid + ", sellerId=" + sellerId + ", brandId=" + brandId + ", productdetail=" + productdetail + '}';
    }

    
}
