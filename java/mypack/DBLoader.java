package mypack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBLoader {

    public static ResultSet executeQuery(String query) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/java", "root", "system");
            System.out.println("connection created");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("statement created");
            ResultSet rs = stmt.executeQuery(query);

            return rs;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
