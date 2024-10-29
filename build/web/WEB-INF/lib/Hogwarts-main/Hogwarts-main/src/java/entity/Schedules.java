// File: entity/Schedules.java
package entity;

import java.sql.Date;

public class Schedules {
    private String SchedulesID;
    private String Date;
    private String CurDateID;
    private String SyC_ID;

    public Schedules() {}

    public Schedules(String SchedulesID, String Date, String CurDateID, String SyC_ID) {
        this.SchedulesID = SchedulesID;
        this.Date = Date;
        this.CurDateID = CurDateID;
        this.SyC_ID = SyC_ID;
    }

    public String getSchedulesID() { return SchedulesID; }
    public void setSchedulesID(String SchedulesID) { this.SchedulesID = SchedulesID; }

    public String getDate() { return Date; }
    public void setDate(String Date) { this.Date = Date; }

    public String getCurDateID() { return CurDateID; }
    public void setCurDateID(String CurDateID) { this.CurDateID = CurDateID; }

    public String getSyC_ID() { return SyC_ID; }
    public void setSyC_ID(String SyC_ID) { this.SyC_ID = SyC_ID; }
}
