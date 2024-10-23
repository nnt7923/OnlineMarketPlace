package model;

public class Product {
    private int productId;
    private String name;
    private String img;
    private double price;
    private String title;
    private String description;
    private int cateID;
    private int seller_id;
    private int brandId;
    private int quantity;

    public Product() {
    }

    public Product(int productId, String name, String img, double price, String title, String description, int cateID, int seller_id, int brandId) {
        this.productId = productId;
        this.name = name;
        this.img = img;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateID = cateID;
        this.seller_id = seller_id;
        this.brandId = brandId;
    }

    public Product(int productId, String name, String img, double price, String title, String description, int cateID, int seller_id, int brandId, int quantity) {
        this.productId = productId;
        this.name = name;
        this.img = img;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateID = cateID;
        this.seller_id = seller_id;
        this.brandId = brandId;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public int getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(int seller_id) {
        this.seller_id = seller_id;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    
}
