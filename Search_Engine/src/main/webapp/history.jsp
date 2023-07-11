
<%--this page is showing the history of searches--%>

<%@page import= "java.util.ArrayList"%>                                      <%--Import the ArrayList Class--%>
<%@page import= "com.SearchEngineProject.getHistoryresult"%>                <%--Import the getHistoryresult Class from SearchEngineProject Package--%>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <style>
            .container {                            <%--Set the position for Showing history Results--%>
              border: 3px solid black;
              position: absolute;
              top: 10%;
              left: 32%;
              padding: 10px;
              width: 600px;
            }
            input {                                 <%--Increase the length of Input Area --%>
              width: 300px;
                border-radius: 15px;
            }
            .list-group {
                padding: 10px;
            }
            button {                                <%-- Design the search button--%>
              background-color: red;
              color: white;
              padding: 5px 35px;
              text-align: center;
              font-size: 12px;
              font-weight: bold;
              border-radius: 15px;
              margin: 5px 10px;
            }
            #Box1 {                                 <%--Set the position for showing results--%>
              position: absolute;
              left: 35%;
              padding: 10px;
              width: 700px;
            }
            body {                                  <%--Set Backgroud Image on of this Page--%>
              background-image: url("search_img.jpg");
              background-repeat: no-repeat;
              background-size: 100% 100%;
              background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <div id="Box1">

        <%--Creating a form to trigure the search while clicking on submit--%>
         <%--Create a Input Box to store the keyword value--%>
         <%--Create A search Button--%>

            <form action = "Search">
                <input type ="text" name ="Keyword"  placeholder="  Type Here....">
                <button type ="Submit" > Search </button>
            </form>
        </div>
        <div class="container">

            <%--Creating a ArrayList of getHistoryresult class to store the results--%>
            <%--Create a Varible i to print the record Number--%>
            <%--Traverse a loop on Array to print record one by one--%>
              <%
                  ArrayList<getHistoryresult> results =  (ArrayList<getHistoryresult>)request.getAttribute("results");
                  int i=0;
                  for(getHistoryresult result : results){
              %>
            <ol class="list-group">                                                                             <%--Creating a list & Designed by using bootsrtap classes--%>
               <li class="list-group-item d-flex justify-content-between align-items-start">
                 <div class="ms-2">
                   <div class="fw-bold"> <%out.println(result.getKeyword());%></div>
                   <a href ="<%out.println(result.getLink());%>"> <%out.println(result.getLink());%></a>        <%--Show the page title--%>
                 </div>
                 <span class="badge bg-primary rounded-pill"><% out.println(++i);%></span>                       <%--Show the page link--%>
               </li>
            </ol>
            <%
            }
            %>
        </div>
    </body>
</html>