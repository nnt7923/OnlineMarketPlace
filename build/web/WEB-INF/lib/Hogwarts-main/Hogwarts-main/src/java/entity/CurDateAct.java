// File: entity/CurDateAct.java
package entity;

public class CurDateAct {
    private String CdtID;
    private String Act;
    private String TimeStart;
    private String TimeEnd;
    private String CurDateID;

    public CurDateAct() {}

    public CurDateAct(String CdtID, String Act, String TimeStart, String TimeEnd, String CurDateID) {
        this.CdtID = CdtID;
        this.Act = Act;
        this.TimeStart = TimeStart;
        this.TimeEnd = TimeEnd;
        this.CurDateID = CurDateID;
    }

    public String getCdtID() { return CdtID; }
    public void setCdtID(String CdtID) { this.CdtID = CdtID; }

    public String getAct() { return Act; }
    public void setAct(String Act) { this.Act = Act; }

    public String getTimeStart() { return TimeStart; }
    public void setTimeStart(String TimeStart) { this.TimeStart = TimeStart; }

    public String getTimeEnd() { return TimeEnd; }
    public void setTimeEnd(String TimeEnd) { this.TimeEnd = TimeEnd; }

    public String getCurDateID() { return CurDateID; }
    public void setCurDateID(String CurDateID) { this.CurDateID = CurDateID; }
}
