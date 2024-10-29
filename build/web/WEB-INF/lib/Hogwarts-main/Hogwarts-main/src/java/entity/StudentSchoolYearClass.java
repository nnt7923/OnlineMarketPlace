// File: entity/StudentSchoolYearClass.java
package entity;

public class StudentSchoolYearClass {
    private String StudentID;
    private String SyC_ID;

    public StudentSchoolYearClass() {}

    public StudentSchoolYearClass(String StudentID, String SyC_ID) {
        this.StudentID = StudentID;
        this.SyC_ID = SyC_ID;
    }

    public String getStudentID() { return StudentID; }
    public void setStudentID(String StudentID) { this.StudentID = StudentID; }
    
    public String getSyC_ID() { return SyC_ID; }
    public void setSyC_ID(String SyC_ID) { this.SyC_ID = SyC_ID; }
}
