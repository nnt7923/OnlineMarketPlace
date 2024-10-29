package entity;

public class Curriculum {
    private String curID;
    private String curName;
    private String cateID;

    public Curriculum() {
    }

    public Curriculum(String curID, String curName, String cateID) {
        this.curID = curID;
        this.curName = curName;
        this.cateID = cateID;
    }

    public String getCurID() {
        return curID;
    }

    public void setCurID(String curID) {
        this.curID = curID;
    }

    public String getCurName() {
        return curName;
    }

    public void setCurName(String curName) {
        this.curName = curName;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }
}
