package entity;

public class CurriculumDate {
    private String curDateID;
    private String dateNumber;
    private String curID;

    public CurriculumDate() {
    }

    public CurriculumDate(String curDateID, String dateNumber, String curID) {
        this.curDateID = curDateID;
        this.dateNumber = dateNumber;
        this.curID = curID;
    }

    public String getCurDateID() {
        return curDateID;
    }

    public void setCurDateID(String curDateID) {
        this.curDateID = curDateID;
    }

    public String getDateNumber() {
        return dateNumber;
    }

    public void setDateNumber(String dateNumber) {
        this.dateNumber = dateNumber;
    }

    public String getCurID() {
        return curID;
    }

    public void setCurID(String curID) {
        this.curID = curID;
    }
}
