package model;

public class Product {
    private int productId;
    private String name;
    private String img;
    private double price;
    private String title;
    private int cateID;
    private int seller_id;
    private int brandId;

    public Product() {
    }

    public Product(int productId, String name, String img, double price, String title, int cateID, int seller_id, int brandId) {
        this.productId = productId;
        this.name = name;
        this.img = img;
        this.price = price;
        this.title = title;
        this.cateID = cateID;
        this.seller_id = seller_id;
        this.brandId = brandId;
    }
    
    public Product(int productId, String name, String img) {
        this.productId = productId;
        this.name = name;
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

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", name=" + name + ", img=" + img + ", price=" + price + ", title=" + title + ", cateID=" + cateID + ", seller_id=" + seller_id + ", brandId=" + brandId + '}';
    }


       

    
}
