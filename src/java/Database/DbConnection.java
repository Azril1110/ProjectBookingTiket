package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
    Connection conn;

    public DbConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            // Handle exception, throw or log as needed
        }
    }

    public Connection driverConnect() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/konser";
        String user = "root";
        String pass = "";
        conn = DriverManager.getConnection(url, user, pass); 
        return conn;
    }
}
