// Store the history reults
// And Show thw History resuls on webpage

package com.SearchEngineProject;
import javax.servlet.ServletException;                      //import for Handle the servlet Exception
import javax.servlet.annotation.WebServlet;                 //import for Creating a webcrawler
import javax.servlet.http.HttpServlet;                      //import for make a httpServlet
import javax.servlet.http.HttpServletRequest;               //import for create a request httpServlet
import javax.servlet.http.HttpServletResponse;              //import for create a response httpServlet
import java.io.IOException;                                 //import for handle the Input exception
import java.io.PrintWriter;                                 //import for showing the results on webpage
import java.sql.Connection;                                 //import for Execute the SQL Queries
import java.sql.ResultSet;                                  //import for store the results in a set
import java.sql.SQLException;                               //import for handle the SQL exception
import java.util.ArrayList;                                 //import for creating an Arraylist

@WebServlet("/History")
public class HistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        Connection connection = DatabaseConnection.getConnection();                                                      // creating an object of Connection class
        try{
            ResultSet resultSet = connection.createStatement().executeQuery("select * from history;");     //Execute a Query to show the 30 search results
            ArrayList<getHistoryresult> results = new ArrayList<getHistoryresult>();                                                    //creating a Arraylist to store the result

            while(resultSet.next()){                                                                                     //Traversing the whole Array
                getHistoryresult historyResult = new getHistoryresult();                                                 // creating an object of gethistoryresult to store Keyword or link
                historyResult.setKeyword(resultSet.getString("keyword"));                                     //Set the keyword by calling set keyword function
                historyResult.setLink(resultSet.getString("link"));                                           //Set the link by calling set link class
                results.add(historyResult);                                                                              // Add th results into ArrayList
            }
            request.setAttribute("results",results);                                        // Requesting for result
            request.getRequestDispatcher("/history.jsp").forward(request,response);         //forwarding request to history.jsp File
            response.setContentType("text/html");                                                 //set the result content in html
            PrintWriter out = response.getWriter();                                                // Used to write the result on Webpages

        }catch (SQLException | IOException | ServletException sqlException){                        //Handling all the exceptions
            sqlException.printStackTrace();
        }
    }
}
