package entity;

public class Product {
    private int pID;
    private String pName;
    private String pImage;
    private double price;
    private String title;
    private String description;
    private int cateID;
    private int sell_ID;

    public Product() {
    }

    public Product(String pName, String pImage, double price, String title, String description, int cateID, int sell_ID) {
        this.pName = pName;
        this.pImage = pImage;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateID = cateID;
        this.sell_ID = sell_ID;
    }

    public Product(int pID, String pName, String pImage, double price, String title, String description, int cateID, int sell_ID) {
        this.pID = pID;
        this.pName = pName;
        this.pImage = pImage;
        this.price = price;
        this.title = title;
        this.description = description;
        this.cateID = cateID;
        this.sell_ID = sell_ID;
    }

    public int getPID() {
        return pID;
    }

    public void setPID(int pID) {
        this.pID = pID;
    }

    public String getPName() {
        return pName;
    }

    public void setPName(String pName) {
        this.pName = pName;
    }

    public String getPImage() {
        return pImage;
    }

    public void setPImage(String pImage) {
        this.pImage = pImage;
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

    public int getSellID() {
        return sell_ID;
    }

    public void setSellID(int sell_ID) {
        this.sell_ID = sell_ID;
    }
}
