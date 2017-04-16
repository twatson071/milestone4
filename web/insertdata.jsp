<%@page import="oracle.jdbc.*, java.io.IOException, java.io.PrintWriter, 
        javax.servlet.ServletException, javax.servlet.annotation.WebServlet,
        javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, 
        javax.servlet.http.HttpServletResponse, java.sql.*, oracle.jdbc.*" 
        contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
              
    </head>
    <body>
        <jsp:useBean id='first' class='finalbeans.DatabaseBean' />
        <%!
            private static ResultSet rset;
            private static int colCount;
            private static int records = 0;
        %>
        <jsp:setProperty name='first' property='prodName' param='prodName' />
        <jsp:setProperty name='first' property='prodSKU' param='prodSKU' />
        <jsp:setProperty name='first' property='prodPrice' param='prodPrice' />
        <jsp:setProperty name='first' property='prodCat' param='prodCat' />
        ${first.storeBean()}
        
        <nav>
            <div class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-header">
                        <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapseable" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="/Group1Milestone4/"><i class="fa fa-users"></i> Group 1 Milestone 4</a>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-collapseable">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#" data-toggle="modal" data-target="#droptables">Drop Tables</a></li>
                            <li class="active"><a href="/Group1Milestone4/insertdata.jsp">Insert Data</a></li>
                            <li><a href="/Group1Milestone4/displaydata.jsp">Display Data</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <a href="#" data-toggle="modal" data-target="#droptables">
                            <div class="panel panel-default text-center">
                                <div class="panel-heading">
                                    <h3>Drop Tables</h3>
                                </div>
                                <div class="panel-body">
                                    <i class="fa fa-4x fa-trash"></i>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="panel panel-default text-center">
                            <div class="panel-heading">
                                <h3>Insert Data</h3>
                            </div>
                            <div class="panel-body">
                                <i class="fa fa-4x fa-keyboard-o"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <a href="/Group1Milestone4/displaydata.jsp">
                            <div class="panel panel-default text-center">
                                <div class="panel-heading">
                                    <h3>Display Data</h3>
                                </div>
                                <div class="panel-body">
                                    <i class="fa fa-4x fa-file-text-o"></i>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <form action="insertdata.jsp" method="POST">
                        <label for="prodName">Product Name: </label>
                        <input style="margin-bottom: 20px" type="text" name="prodName">
                        <br>

                        <label for="prodSKU">Product SKU: </label>
                        <input style="margin-bottom: 20px" type="text" name="prodSKU">
                        <br>

                        <label for="prodPrice">Product Price: </label>
                        <input style="margin-bottom: 20px" type="text" name="prodPrice">
                        <br>
                        
                        <label for="prodCat">Product Category: </label>
                        <input style="margin-bottom: 20px" type="text" name="prodCat">
                        <br>

                        <input type="Submit">
                    </form>
                </div>
            </div>
        </main>
        <footer>
            <!-- Modal -->
            <div class="modal fade" id="droptables" tabindex="-1" role="dialog" aria-labelledby="droptablesLabel">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="droptablesLabel">Drop Table</h4>
                  </div>
                  <div class="modal-body">
                    <h3>Are you sure you want to drop the table?</h3>
                    <p>This will also remove all data that you have entered. The table will be recreated upon entering new data.</p>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <a href="droptables.jsp" class="btn btn-primary">Drop Table</a>
                  </div>
                </div>
              </div>
            </div>
        </footer>
        <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>