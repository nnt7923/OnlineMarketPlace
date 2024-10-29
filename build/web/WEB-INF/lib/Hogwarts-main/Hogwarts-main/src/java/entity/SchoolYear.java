package entity;

import java.sql.Date;

public class SchoolYear {
    private String syID;
    private String syName;
    private String dateStart;
    private String dateEnd;

    public SchoolYear() {
    }

    public SchoolYear(String syID, String syName, String dateStart, String dateEnd) {
        this.syID = syID;
        this.syName = syName;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    public String getSyID() {
        return syID;
    }

    public void setSyID(String syID) {
        this.syID = syID;
    }

    public String getSyName() {
        return syName;
    }

    public void setSyName(String syName) {
        this.syName = syName;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }
}
