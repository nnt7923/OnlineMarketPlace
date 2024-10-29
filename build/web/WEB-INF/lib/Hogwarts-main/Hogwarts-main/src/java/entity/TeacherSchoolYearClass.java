// File: entity/TeacherSchoolYearClass.java
package entity;

public class TeacherSchoolYearClass {
    private String TeacherID;
    private String SyC_ID;

    public TeacherSchoolYearClass() {}

    public TeacherSchoolYearClass(String TeacherID, String SyC_ID) {
        this.TeacherID = TeacherID;
        this.SyC_ID = SyC_ID;
    }

    public String getTeacherID() { return TeacherID; }
    public void setTeacherID(String TeacherID) { this.TeacherID = TeacherID; }
    
    public String getSyC_ID() { return SyC_ID; }
    public void setSyC_ID(String SyC_ID) { this.SyC_ID = SyC_ID; }
}
