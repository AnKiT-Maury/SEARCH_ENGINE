<%--this page is showing the search result of Keyword--%>
<%@page import= "java.util.ArrayList"%>                 <%--Import the ArrayList Class--%>
<%@page import= "com.SearchEngineProject.Search"%>       <%--Import the Search Class from SearchEngineProject Package--%>

<html>
    <head>

    <%--Adding the Links of Bootsratp Css & javaScript  --%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

        <%--Creating Style Tag to style the elemnts of This pages  --%>
        <style>
            .container {                            <%--Set the position for Showing Search Results--%>
              position: absolute;
              top: 10%;
              left: 25%;
              padding: 10px;
              width: 900px;
            }
            button {                                   <%-- Design the search button--%>
            background-color: red;
            color: white;
            padding: 5px 35px;
            text-align: center;
            font-size: 12px;
            font-weight: bold;
            border-radius: 15px;
            margin: 5px 10px;
            }
            #Box1 {                                    <%--Set the position for showing results--%>
              position: absolute;
              left: 37%;
              padding: 10px;
              width: 700px;
            }
            input {                                     <%--Increase the length of Input Area --%>
              width: 350px;
              border-radius: 15px;
            }
            body {                                      <%--Set Backgroud Image on of this Page--%>
              background-image: url("search_img.jpg");
              background-repeat: no-repeat;
              background-size: 100% 100%;
              background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <div id="Box1">
            <form action = "Search">                                                                    <%--Creating a form to trigure the search while clicking on submit--%>
                <input type ="text" name ="Keyword" placeholder="  Type Here....">                      <%--Create a Input Box to store the keyword value--%>
                <button type ="Submit"> Search </button>                                                <%--Create A search Button--%>
            </form>
        </div>
        <div  class="container">
            <table class="table table-hover" align ="center" border =1>                                 <%--Create a Table to show to result in structure way--%>
                <tr>
                    <th>Sr No</th>                                                                        <%--Create a Serial Number Column--%>
                    <th>Title</th>                                                                         <%--Create a Column for Page Title--%>
                    <th>Link</th>                                                                          <%--Create a column for Page Link--%>
                </tr>

                <%--Creating a ArrayList of Search class to store the results--%>
                <%--Create a Varible i to print the record Number--%>
                <%--Traverse a loop on Array to print record one by one--%>
                <%
                    ArrayList<Search> results =  (ArrayList<Search>)request.getAttribute("results");
                    int i=0;
                    for(Search result : results){
                %>
                <tr>
                    <td align ="center"><%out.println(++i+".");%></td>                                              <%--Print the record Number--%>
                    <td><%out.println(result.getTitle());%></td>                                                    <%--Print the Page Title Number--%>
                    <td><a href ="<%out.println(result.getLink());%>"><%out.println(result.getLink());%></a></td>   <%--Print the Page Link Number--%>
                </tr>
                <%
                    }
                %>

            </table>
        </div>
    </body>
</html>