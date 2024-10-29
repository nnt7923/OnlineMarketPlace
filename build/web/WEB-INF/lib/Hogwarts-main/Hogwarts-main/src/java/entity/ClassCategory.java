package entity;

public class ClassCategory {
    private String cateID;
    private String cateName;

    public ClassCategory() {
    }

    public ClassCategory(String cateID, String cateName) {
        this.cateID = cateID;
        this.cateName = cateName;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
}
