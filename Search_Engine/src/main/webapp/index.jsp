<%-- This page is main page of Search Engine --%>

<html>
    <head>
        <%--Adding the Links of Bootsratp Css & javaScript  --%>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

        <%--Creating Style Tag to style the elemnts of This pages  --%>
        <style>
            body {                                          <%--Set the Backgroud Image on Main Page--%>
              background-image: url("home_img.jpg");
              background-repeat: no-repeat;
              background-size: 100% 100%;
            }
            .container {                                    <%--set the center position of Search Box--%>
                  position: absolute;
                  top: 35%;
                  left: 33%;
                  padding: 10px;
                  width: 600px;
            }
            input {                                         <%--Increase the length of Input Area --%>
              width: 400px;
                border-radius: 15px;
            }
            .search {                                       <%-- Design the search button--%>
              background-color: red;
              color: white;
              padding: 5px 35px;
              text-align: center;
              font-size: 12px;
              font-weight: bold;
              border-radius: 15px;
              margin: 5px 0px;
            }
            .History {                                      <%-- Design the histoy button--%>
                  background-color: green;
                  color: white;
                  padding: 5px 130px;
                  text-align: center;
                  font-size: 12px;
                  font-weight: bold;
                  border-radius: 15px;
                 }
            .inner_container{                           <%--Set the position of history Button--%>
                position: absolute;
                top: 40%;
                left: 40%;
                padding: 15px;
                width: 600px;
                }
            h1 {                                        <%--Design & set the position of page Label--%>
                position: absolute;
                font-size: 55px;
                top: 20%;
                left: 32%;
                padding: 15px;
                width: 600px;
            }
        </style>
    </head>

    <body>
        <div>
            <h1 >Simple Search Engine<h1>
        </div>
        <div class="container">
        <form action = "Search">
            <input type ="text" name ="Keyword" placeholder="  Type Here.............">
            <button type ="Submit" class="search"> Search </button>
        </form>
        </div>
        <div class ="inner_container">
            <form action ="History">
             <button type ="Submit"  class="history">Search History </button>
            </form>
        </div>
    </body>
</html>
