package model;

public class Product {
    private int productId;
    private String name;
    private double price;
    private String title;
    private int cid;  // changed from 'cid' to 'categoryId' for clarity
    private int brandId;
    private int sellerId;
    private String img;  // added the img field

    // Default constructor

    public Product() {
    }

    public Product(int productId, String name, double price, String title, int cid, int brandId, int sellerId, String img) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.title = title;
        this.cid = cid;
        this.brandId = brandId;
        this.sellerId = sellerId;
        this.img = img;
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

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }




}
