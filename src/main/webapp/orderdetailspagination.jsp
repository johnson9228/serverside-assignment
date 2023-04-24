<%@ page import="com.serverside.model.entity.Orderdetail" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Details Pagination</title>

    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>

    <style>
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
        .form-container input[type=text]:focus, .form-container input[type=password]:focus
        {
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
        body{
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        footer{
            margin-top: auto;
        }
    </style>
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
                            <li><a href="ProductPaginationServlet?currentPage=1&recordsPerPage=12&admin=false&keyword=&sort=ASC">Catalogs</a></li>
                            <li><a href="ProductPaginationServlet?currentPage=1&recordsPerPage=12&admin=true&keyword=&sort=ASC">Product Edit</a></li>
                            <li><a href="ProductlineDisplayServlet?currentPage=1&recordsPerPage=12&&keyword=&sort=ASC">Productline</a></li>
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

%>

<div>
    <div class="row col-md-6">
        <table class="table table-striped table-bordered table-sm">
            <tr>
                <th>Order Number</th>
                <th>Product Code</th>
                <th>Quantity Ordered</th>
                <th>Price per Each</th>
                <th>Orderline Number</th>
            </tr>

            <%
                List<Orderdetail> staffs = (List<Orderdetail>) request.getAttribute("staffs");

                for(Orderdetail t : staffs) {
                    out.println("<tr>");
                    out.println("<td>" + t.getId().getOrdernumber() + "</td>");
                    out.println("<td>" + t.getId().getProductcode()+ "</td>");
                    out.println("<td>" + t.getQuantityordered() + "</td>");
                    out.println("<td>" + t.getPriceeach() + "</td>");
                    out.println("<td>" + t.getOrderlinenumber() + "</td>");
                    out.println("<td><a href=\"OrderDetailsController?id=" + t.getId().getOrdernumber() + "&ID=" + t.getId().getProductcode() + "\">Update</a></td>");
                    out.println("<td><a href=\"OrderDetailsController?id=" + t.getId().getOrdernumber() + "&ID=" + t.getId().getProductcode() + "\">Delete</a></td>");
                    out.println("</tr>");
                }

            %>

        </table>
    </div>

    <nav aria-label="Navigation for staffs">
        <ul class="pagination">
            <%
                if (currentPage != 1) {
            %>
            <%
                out.println("<li class=\"page-item\">");
                out.println("<a class=\"page-link\" href=\"" + "OrderDetailsPaginationServlet?recordsPerPage=" + recordsPerPage
                        + "&currentPage=1" + "\">First</a>");
                out.println("</li>");
            %>

            <li class="page-item">
                <%
                    out.println("<a class=\"page-link\" href=\"" + "OrderDetailsPaginationServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=" + (currentPage - 1) + "\">Previous</a>");
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
                    out.println("<a class=\"page-link\" href=\"" + "OrderDetailsPaginationServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=" + (currentPage + 1) +
                            "\">Next</a>");
                    out.println("</li>");
                    out.println("<li class=\"page-item\">");
                    out.println("<a class=\"page-link\" href=\"" + "OrderDetailsPaginationServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=" + nOfPages + "\">Last</a>");
                    out.println("</li>");
                }
            %>
        </ul>
    </nav>
    <%
        out.println("<p class=\"pageref\">");
        out.println(currentPage + " of " + nOfPages);
        out.println("</p>");

    %>
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

    <button class="open-button" onclick="openForm()">Open Form</button>

    <div class="form-popup" id="myForm">
        <form action="OrderDetailsController" class="form-container" method="post">
            <h1>Add Order Details</h1>
            <fieldset>
                <legend>Add Order Details:</legend>
                <br> Order Number:
                <input type="text" name="orderdtno"/>
                <br> Product Code:
                <input type="text" name="prcd">
                <br>Quantity Ordered:
                <input type="text" name="qtyorder" />
                <br>Price per Each:
                <input type="text" name="priceeach" />
                <br> Orderline Number:
                <input type="text" name="orderlineno" />
            </fieldset>
            <button type="submit" class="btn">Submit</button>
            <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
            <button type="reset" class="btn">Reset</button>
        </form>
    </div>
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
