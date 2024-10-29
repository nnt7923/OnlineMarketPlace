package model;

import entity.SchoolYear;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOSchoolYear extends DBConnect {

    public int insertSchoolYear(SchoolYear schoolYear) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[SchoolYear]\n"
                + "           ([SyID]\n"
                + "           ,[SyName]\n"
                + "           ,[DateStart]\n"
                + "           ,[DateEnd])\n"
                + "     VALUES(?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, schoolYear.getSyID());
            pre.setString(2, schoolYear.getSyName());
            pre.setString(3, schoolYear.getDateStart());
            pre.setString(4, schoolYear.getDateEnd());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateSchoolYear(SchoolYear schoolYear) {
        int n = 0;
        String sql = "UPDATE [dbo].[SchoolYear]\n"
                + "   SET [SyName] = ?\n"
                + "      ,[DateStart] = ?\n"
                + "      ,[DateEnd] = ?\n"
                + " WHERE [SyID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, schoolYear.getSyName());
            pre.setString(2, schoolYear.getDateStart());
            pre.setString(3, schoolYear.getDateEnd());
            pre.setString(4, schoolYear.getSyID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int removeSchoolYear(String syID) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[SchoolYear] WHERE [SyID] = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, syID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchoolYear.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Vector<SchoolYear> getAllSchoolYears(String sql) {
        Vector<SchoolYear> vector = new Vector<>();
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String syID = rs.getString(1);
                String syName = rs.getString(2);
                String dateStart = rs.getString(3);
                String dateEnd = rs.getString(4);
                SchoolYear schoolYear = new SchoolYear(syID, syName, dateStart, dateEnd);
                vector.add(schoolYear);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOSchoolYear.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }

    public static void main(String[] args) {
        DAOSchoolYear dao = new DAOSchoolYear();
        int n = dao.insertSchoolYear(new SchoolYear("SY001", "2024-2025", "2024-09-01", "2025-06-30"));
        if (n > 0) {
            System.out.println("Inserted");
        }
        Vector<SchoolYear> vector = dao.getAllSchoolYears("SELECT * FROM SchoolYear");
        for (SchoolYear schoolYear : vector) {
            System.out.println(schoolYear.getSyID() + " - " + schoolYear.getSyName() + " - " + schoolYear.getDateStart() + " - " + schoolYear.getDateEnd());
        }
    }
}
