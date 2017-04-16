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
        <%!
            private static ResultSet rset;
            private static int colCount;
            private static int records = 0;
        %>
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
                            <li><a href="/Group1Milestone4/droptables.jsp">Drop Tables</a></li>
                            <li><a href="/Group1Milestone4/insertdata.jsp">Insert Data</a></li>
                            <li class="active"><a href="/Group1Milestone4/displaydata.jsp">Display Data</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4">
                        <a href="/Group1Milestone4/droptables.jsp">
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
                        <a href="/Group1Milestone4/insertdata.jsp">
                            <div class="panel panel-default text-center">
                                <div class="panel-heading">
                                    <h3>Insert Data</h3>
                                </div>
                                <div class="panel-body">
                                    <i class="fa fa-4x fa-keyboard-o"></i>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div class="panel panel-default text-center">
                            <div class="panel-heading">
                                <h3>Display Data</h3>
                            </div>
                            <div class="panel-body">
                                <i class="fa fa-4x fa-file-text-o"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row well">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                    #
                                </th>
                                <th>
                                    Product Name
                                </th>
                                <th>
                                    Product SKU
                                </th>
                                <th>
                                    Product Price
                                </th>
                                <th>
                                    Product Category
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            try{
                                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1", "pass");

                                Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

                                System.out.println("Connection established - now executing SELECT");
                                rset = stmt.executeQuery("SELECT * FROM BD_PRODUCTS ORDER BY ID");
                                colCount = rset.getMetaData().getColumnCount();

                            } catch(java.lang.Exception e){
                                e.printStackTrace();
                            }

                            try{
                                while(rset.next()) {%>
                                <tr>
                                    <td>
                                        <%= rset.getString(1) %>
                                    </td>
                                    <td>
                                        <%= rset.getString(2) %>
                                    </td>
                                    <td>
                                        <%= rset.getString(3) %>
                                    </td>
                                    <td>
                                        <%= rset.getString(4) %>
                                    </td>
                                    <td>
                                        <%= rset.getString(5) %>
                                    </td>
                                </tr>
                                <%} 
                            } catch (java.lang.Exception ex) {

                            }

                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
        <footer>
            
        </footer>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>