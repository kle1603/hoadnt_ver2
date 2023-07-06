/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author namdh
 */
public class DBUtils {

    private static final String DB_NAME = "UserManagement";
    private static final String USER_NAME = "sa";
    private static final String PASSWORD = "12345";

    public static Connection getConnectionV1() throws ClassNotFoundException, SQLException {
        Connection con = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
        con = DriverManager.getConnection(url, USER_NAME, PASSWORD);
        return con;
    }
    public static Connection getConnection() throws ClassNotFoundException, SQLException, NamingException {
        Connection con = null;
        Context context = new InitialContext();
        Context end = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) end.lookup("DBCon");
        con = ds.getConnection();
        return con;
    }
}
