package fa.training.util;

import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class DBContext {
    protected Connection connection = null;
    protected PreparedStatement ps = null;
    protected ResultSet rs = null;

    private Properties properties = new Properties();
    public DBContext() {
        try {
            properties.load(DBContext.class.getResourceAsStream("/dbConfig.properties"));
            String driver = properties.getProperty("driver");
            String url = properties.getProperty("url");
            String username = properties.getProperty("userName");
            String password = properties.getProperty("password");
            Class.forName(driver);
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        DBContext db = new DBContext();
        System.out.println(db.connection);
    }
}
