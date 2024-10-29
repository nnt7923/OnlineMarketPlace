package entity;

public class SchoolYearClass {
    private String SyC_ID;
    private String SyID;
    private String ClassID;
    private String CurID;

    public SchoolYearClass() {
    }

    public SchoolYearClass(String SyC_ID, String SyID, String ClassID, String CurID) {
        this.SyC_ID = SyC_ID;
        this.SyID = SyID;
        this.ClassID = ClassID;
        this.CurID = CurID;
    }

    public String getSyC_ID() {
        return SyC_ID;
    }

    public void setSyC_ID(String SyC_ID) {
        this.SyC_ID = SyC_ID;
    }

    public String getSyID() {
        return SyID;
    }

    public void setSyID(String SyID) {
        this.SyID = SyID;
    }

    public String getClassID() {
        return ClassID;
    }

    public void setClassID(String ClassID) {
        this.ClassID = ClassID;
    }

    public String getCurID() {
        return CurID;
    }

    public void setCurID(String CurID) {
        this.CurID = CurID;
    }
}
