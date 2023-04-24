<%@ page import="com.serverside.model.entity.Order" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Pagination</title>

    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>

    <style>
        /*body {
            font-family: Arial, Helvetica, sans-serif;
        }
        * {
            box-sizing: border-box;
        }*/
        /* Button used to open the contact form - fixed at the bottom of the page */
        .open-button {
            background-color: #555;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            bottom: 23px;
            right: 28px;
            width: 280px;
        }

        /* The popup form - hidden by default */
        .form-popup {
            overflow-x: hidden;
            overflow-y: auto;
            height: 400px;
            display: none;
            position: fixed;
            top: 60%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        /* Add styles to the form container */
        .form-container {
            max-width: 500px;
            padding: 10px;
            background-color: white;
        }

        /* Full-width input fields */
        .form-container input[type=text], .form-container input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }

        /* When the inputs get focus, do something */
        .form-container input[type=text]:focus, .form-container input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for the submit button */
        .form-container .btn {
            background-color: #4CAF50;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom: 10px;
            opacity: 0.8;
        }

        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: red;
        }

        /* Add some hover effects to buttons */
        .form-container .btn:hover, .open-button:hover {
            opacity: 1;
        }

        .pageref {
            text-align: center;
            font-weight: bold;
        }

        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        footer {
            margin-top: auto;
        }
    </style>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">--%>

</head>

<body>
<header class="site-header">
    <div class="top-header">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="top-header-left">
                        <a href="Logout.jsp">Logout</a>

                    </div> <!-- /.top-header-left -->
                </div> <!-- /.col-md-6 -->
                <div class="col-md-6 col-sm-6">
                    <div class="social-icons">
                        <ul>
                            <li><a href="#" class="fa fa-facebook"></a></li>
                            <li><a href="#" class="fa fa-dribbble"></a></li>
                            <li><a href="#" class="fa fa-twitter"></a></li>
                            <li><a href="#" class="fa fa-linkedin"></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div> <!-- /.social-icons -->
                </div> <!-- /.col-md-6 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.top-header -->
    <div class="main-header">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-8">
                    <div class="logo">
                        <h1><a href="#">Kool Store</a></h1>
                    </div> <!-- /.logo -->
                </div> <!-- /.col-md-4 -->

            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-header -->
    <div class="main-nav">
        <div class="container">
            <div class="row">
                <div class="col-md">
                    <div class="list-menu">
                        <ul>
                            <li><a href="index.html">Shop</a></li>
                            <li>
                                <a href="ProductPaginationServlet?currentPage=1&recordsPerPage=12&admin=false&keyword=&sort=ASC">Catalogs</a>
                            </li>
                            <li><a href="adminProductPage.html">Product Edit</a>
                            </li>
                            <a href="ProductlineDisplayServlet?currentPage=1&recordsPerPage=12&&keyword=&sort=ASC">Productline</a>
                            </li>
                            <li><a href="EmployeeReadController">Staff</a></li>
                            <li><a href="customer.html">Customer</a></li>
                            <li><a href="OfficeReadController">Office</a></li>
                            <li><a href="payment.html">Payment</a></li>
                            <li><a href="order.html">Order</a></li>
                            <li><a href="orderdetails.html">Order Details</a></li>

                        </ul>
                    </div> <!-- /.list-menu -->
                </div> <!-- /.col-md-6 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-nav -->
</header> <!-- /.site-header -->


<% //Relate the following codes to PaginationServlet
    int currentPage = (int) request.getAttribute("currentPage");
    int recordsPerPage = (int) request.getAttribute("recordsPerPage");
    int nOfPages = (int) request.getAttribute("nOfPages");
    String keyword = (String) request.getAttribute("keyword");
%>

<form class="form-inline md-form mr-auto mb-4"
      action="OrderPaginationServlet" method="get">
    <input class="form-control mr-sm-2" type="text" aria-label="Search"
           name="keyword"/>
    <button class="btn aqua-gradient btn-rounded btn-sm my-0 btn btn-info"
            type="submit">Search
    </button>
    <input type="hidden" name="currentPage" value="<%=currentPage%>"/> <input
        type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>"/>
</form>

<div class="content-section">
    <div class="row col-md-6" style="width: 100%; padding: 0;margin: 0;">
        <table class="table table-striped table-bordered table-sm">
            <tr>
                <th>Order Number</th>
                <th>Customer Number</th>
                <th>Order Date</th>
                <th>Required Date</th>
                <th>Shipped Date</th>
                <th>Status</th>
                <th>Comments</th>
            </tr>
            <% //Relate the following code to OrderPaginationServlet
                List<Order> staffs = (List<Order>) request.getAttribute("staffs");
                if (staffs.size() != 0) {
                    for (Order t : staffs) {
                        out.println("<tr>");
                        out.println("<td>" + t.getId() + "</td>");
                        out.println("<td>" + t.getCustomernumber() + "</td>");
                        out.println("<td>" + t.getOrderdate() + "</td>");
                        out.println("<td>" + t.getRequireddate() + "</td>");
                        out.println("<td>" + t.getShippeddate() + "</td>");
                        out.println("<td>" + t.getStatus() + "</td>");
                        out.println("<td>" + t.getComments() + "</td>");
                        out.println("<td><a href=\"OrderController?id=" + t.getId() + "\">Update</a></td>");
                        out.println("<td><a href=\"OrderController?id=" + t.getId() + "\">Delete</a></td>");
                        out.println("</tr>");
                    }

                } else {
                    out.println("<tr>");
                    String status = "No records";
                    for (int i = 0; i < 100; i++) {
                        out.println("<td>" + status + "</td>");
                    }
                    out.println("</tr>");
                }
            %>
        </table>

        <nav aria-label="Navigation for staffs">
            <ul class="pagination">
                <%
                    if (currentPage != 1 && nOfPages != 0) {
                %>


                <%
                    out.println("<li class=\"page-item\">");
                    out.println("<a class=\"page-link\" href=\"" + "OrderPaginationServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=1" + "&keyword=" + keyword + "\">First</a>");
                    out.println("</li>");
                %>

                <li class="page-item">
                    <%
                        out.println("<a class=\"page-link\" href=\"" + "OrderPaginationServlet?recordsPerPage=" + recordsPerPage
                                + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "\">Previous</a>");
                    %>
                </li>
                <%
                    }
                %>
                <%
                %>
                <%
                    if (currentPage < nOfPages) {
                        out.println("<li class=\"page-item\">");
                        out.println("<a class=\"page-link\" href=\"" + "OrderPaginationServlet?recordsPerPage=" + recordsPerPage
                                + "&currentPage=" + (currentPage + 1) + "&keyword=" + keyword +
                                "\">Next</a>");
                        out.println("</li>");
                        out.println("<li class=\"page-item\">");
                        out.println("<a class=\"page-link\" href=\"" + "OrderPaginationServlet?recordsPerPage=" + recordsPerPage
                                + "&currentPage=" + nOfPages + "&keyword=" + keyword + "\">Last</a>");
                        out.println("</li>");
                    }
                %>
            </ul>
        </nav>
            <%
            if(nOfPages != 0){
 out.println("<p class=\"pageref\">");
 out.println(currentPage + " of " + nOfPages);
 out.println("</p>");
 }


%>

        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
        <script
                src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
        <script
                src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

        <button class="open-button" onclick="openForm()">Add New Order</button>
        <div class="form-popup" id="myForm">
            <form action="OrderController" class="form-container" method="post">
                <h1>Add Order</h1>
                <fieldset>
                    <legend>Add New Order:</legend>
                    <br> Customer Number:
                    <input type="text" name="cnm"/>
                    <br> Order Date:
                    <input type="text" name="od"/>
                    <br>Required Date:
                    <input type="text" name="rd"/>
                    <br>Shipped Date:
                    <input type="text" name="sd"/>
                    <br>Status:
                    <input type="text" name="st"/>
                    <br>Comment:
                    <input type="text" name="com"/>
                </fieldset>
                <button type="submit" class="btn">Submit</button>
                <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                <button type="reset" class="btn">Reset</button>
            </form>
        </div>
        <footer class="site-footer">
            <div class="bottom-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <span>Copyright &copy; 2084 <a href="#">Kool Store</a> </span>
                        </div> <!-- /.col-md-12 -->
                    </div> <!-- /.row -->
                </div> <!-- /.container -->
            </div> <!-- /.bottom-footer -->
        </footer> <!-- /.site-footer -->
        <script>
            function openForm() {
                document.getElementById("myForm").style.display = "block";
            }

            function closeForm() {
                document.getElementById("myForm").style.display = "none";
            }
        </script>

</body>
</html>
