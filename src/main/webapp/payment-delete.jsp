<%@ page import="com.serverside.model.entity.Payment" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 17/4/2023
  Time: 11:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Payment</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    <style>
        .form-wrapper {
            width: 30%;
            margin: auto;
            margin-top: 10rem;
        }

        .right {
            float: right;
        }

        h5 {
            margin-bottom: 2rem;
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
<% Payment pm = (Payment) request.getAttribute("PM");%>
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
<div class="form-wrapper">
    <div class="row justify-content-center">
        <h5>Are you sure you want to delete the following item?</h5>
    </div>

    <form class="form" action="PaymentController" method="post">
        <div class="form-group row">
            <label class="col-sm-5 col-form-label">Customer Number: </label>
            <div class="col-sm">
                <%
                    out.println("<input class=\"form-control\" name=\"customerNumber\" id=\"customerNumber\" readonly value=" + pm.getId().getCustomernumber() + ">");
                %>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-5 col-form-label">Check Number: </label>
            <div class="col-sm">
                <%
                    out.println("<input class=\"form-control\" name=\"checkNumber\" id=\"checkNumber\" readonly value=" + pm.getId().getChecknumber() + ">");
                %>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-5 col-form-label">Payment Date: </label>
            <div class="col-sm">
                <%
                    out.println("  <input class=\"form-control\" name=\"paymentDate\" id=\"paymentDate\" readonly value=" + pm.getPaymentdate() + ">");
                %>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-5 col-form-label">Amount: </label>
            <div class="col-sm">
                <%
                    out.println("  <input name=\"amount\" class=\"form-control\" id=\"amount\" readonly value=" + pm.getAmount() + ">");
                %>
            </div>
        </div>


        <input name="type" id="type" value="delete" hidden>
        <div class="right">
            <button class="btn btn-danger" type="submit">Delete</button>
            <a class="btn btn-info" href="payment.html">Cancel</a>
        </div>

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
</body>
</html>
