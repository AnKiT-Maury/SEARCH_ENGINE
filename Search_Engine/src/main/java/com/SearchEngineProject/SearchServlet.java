// Store the search results
// And Show thw search results on webpage

package com.SearchEngineProject;
import javax.servlet.ServletException;                      //import for Handle the servlet Exception
import javax.servlet.annotation.WebServlet;                 //import for Creating a webcrawler
import javax.servlet.http.HttpServlet;                      //import for make a httpServlet
import javax.servlet.http.HttpServletRequest;               //import for create a request httpServlet
import javax.servlet.http.HttpServletResponse;              //import for create a response httpServlet
import java.io.IOException;                                 //import for handle the Input exception
import java.io.PrintWriter;                                 //import for showing the results on webpage
import java.sql.Connection;                                 //import for Execute the SQL Queries
import java.sql.PreparedStatement;                          //import for prepared the SQL Query before Executing
import java.sql.ResultSet;                                  //import for store the results in a set
import java.sql.SQLException;                               //import for handle the SQL exception
import java.util.ArrayList;                                 //import for creating an Arraylist


@WebServlet(value = "/Search")
public class SearchServlet extends HttpServlet {
    protected void doGet ( HttpServletRequest request, HttpServletResponse response) throws IOException {
        String keyword = request.getParameter("Keyword");           //Storing the searched keyword

        //Printing the Keyword In console
        System.out.println(keyword);
        Connection connection = DatabaseConnection.getConnection();                                                             // creating an object of Connection class
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into history value(?,?);");            //Execute a Query to insert the records in SQL
            preparedStatement.setString(1,keyword);                                                                 //Set the page title by using setKeyword function
            preparedStatement.setString(2,"http://localhost:8080/Search_Engine/Search?Keyword="+keyword);       //Set the page title by using setKeyword function
            preparedStatement.executeUpdate();                                                                                  //after getting all the values execute the SQL Query

            //OUR PAGE RANKING ALGORITHM (by Using keyword occurrence)
            //first replace all the keyword in pageText with empty string
            //then subtract the length of Original pageText & length of replaced pageText
            //then divide it with keyword length
            // then show the result in descending order by their length

            // String pageText = length of all text;
            //String replacedText = replace the Keyword with Empty String;
            //int lengthOfKeyword = length(pageText)-length(replacedText);
            //int keywordOccurrence = legthofkeyword/length(keyword);

            ResultSet resultSet = connection.createStatement().executeQuery("select pagetitle,pagelink, (length(lower(pageText))-length(replace(lower(pageText), '" + keyword + "' ,' ')))/ length('" + keyword + "') as  countOccurence from Pages order by countOccurence desc limit 30;");
            ArrayList<Search> results = new ArrayList<Search>();         // ArrayList of Search Class Type to store the results

            while (resultSet.next()) {                                                               //Traversing the whole Array
                Search searchResult = new Search();                                                  // creating an object of Search Class to store Title or link
                searchResult.setTitle(resultSet.getString("pagetitle"));                  //Set the title by calling settitle function
                searchResult.setLink(resultSet.getString("pagelink"));                    //Set the link by calling set link class
                results.add(searchResult);                                                           // Add the results into ArrayList
            }
            for(Search searchResult : results){                                                        //Printing all the results in console
                System.out.println(searchResult.getTitle()+""+searchResult.getLink()+"\n");
            }
            request.setAttribute("results", results);                                            // Requesting for result
            request.getRequestDispatcher("/search.jsp").forward(request,response);                //forwarding request to search.jsp File
            response.setContentType("text/html");                                                       //set the result content in html
            PrintWriter out = response.getWriter();                                                     // Used to write the result on Webpages
        }
        catch (SQLException | ServletException | IOException sqlException){                         //Handling all the exceptions
            sqlException.printStackTrace();
        }
    }
}