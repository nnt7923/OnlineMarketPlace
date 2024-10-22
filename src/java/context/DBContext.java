package context;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    public Connection conn = null;
    // Connection

    public DBContext(String URL, String userName, String password) {
        try {
            //driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //connect
            conn = DriverManager.getConnection(URL, userName, password);
            System.out.println("Connected");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public DBContext() {
        this("jdbc:sqlserver://localhost:1433;databaseName=mk3;encrypt=true;trustServerCertificate=true",
                "sa","123456");

    }

    public static void main(String[] args) {
        new DBContext();
    }

}
