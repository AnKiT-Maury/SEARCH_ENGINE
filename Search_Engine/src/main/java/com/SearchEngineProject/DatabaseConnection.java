// In this class we can create the Connection
// between MySql And Java

package com.SearchEngineProject;
import java.sql.Connection;                 // Import the SQL Connection Class  to execute query from java file
import java.sql.DriverManager;               // Import Driver Manager Class to establish the SQL Connection
import java.sql.SQLException;               // Import SQL Exception to handle the exception thrown by SQL Queries

public class DatabaseConnection {
    static Connection connection;
    public static Connection getConnection(){           // Creating Connection Constructor
        if(connection!=null){                           // If Connection is Already Established
            return connection;
        }

        String user= "root";                    //Server Name
        String pwd = "ankit";                   // Server Password
        String db= "searchenginejava";          // Database Name
        return getConnetion(user,pwd,db);

    }
    private static Connection getConnetion(String user, String pwd , String db) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");      //Used SSQL Driver manager to esablished the SQL connection

            // SQL Connection Query to connect with databse by using password and DB Name
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/searchenginejava","root","ankit");
        }

        //Catch the SQLException & Class NOt Found Exception
        catch (SQLException | ClassNotFoundException sqlException){
            sqlException.printStackTrace();
        }
        return connection;
    }
}
