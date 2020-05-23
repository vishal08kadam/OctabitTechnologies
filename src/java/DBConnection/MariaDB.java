/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnection;
import java.sql.*;
/**
 *
 * @author kadam_08
 */
public class MariaDB {
    public static Connection getConnection() throws SQLException {
        
        Connection mariadbcon = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            mariadbcon = DriverManager.getConnection("jdbc:mariadb://localhost:3306/admission_201920", "root", "2285");
        } catch (ClassNotFoundException e) {
            
            System.err.println("ERROR" + e);
        }
        return mariadbcon;
}
}
