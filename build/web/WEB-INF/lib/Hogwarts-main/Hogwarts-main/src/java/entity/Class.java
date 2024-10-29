package entity;

public class Class {
    private String classID;
    private String className;
    private String cateID;

    public Class() {
    }

    public Class(String classID, String className, String cateID) {
        this.classID = classID;
        this.className = className;
        this.cateID = cateID;
    }

    public String getClassID() {
        return classID;
    }

    public void setClassID(String classID) {
        this.classID = classID;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }
}
