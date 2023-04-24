<%@ page import="com.serverside.model.entity.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product Information</title>
    <!-- CSS links -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    <style>
        .form-wrapper {
            width: 40%;
            margin: 1rem auto 10rem;

        }

        .right {
            float: right;
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

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>
<%
    Product product = (Product) request.getAttribute("product");
%>
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
                            <li><a href="adminProductPage.html">Product Edit</a></li>
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
    <form action="ProductController" method="post">
        <div class="row justify-content-center">
            <h3>Update Product Form</h3>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Product Code: </label>
            <%
                out.println("<input class=\"col-sm form-control\" name=\"productId\" id=\"productId\" readonly value=" + product.getId() + ">");
            %>
        </div>

        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Product Name: </label>
            <%
                out.println("  <textarea name=\"productName\" id=\"productName\" cols=\"50\" >" + product.getProductname() + "</textarea>");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Product Line: </label>
            <%
                out.println("  <textarea name=\"productline\" id=\"productline\" cols=\"50\" >" + product.getProductline().getId() + "</textarea>");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Product Scale: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"productScale\" id=\"productScale\" value=" + product.getProductscale() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Product Vendor: </label>
            <%
                out.println("  <textarea name=\"productVendor\" id=\"productVendor\" cols=\"50\" >" + product.getProductvendor() + "</textarea>");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Product Description: </label>
            <%
                out.println("  <textarea name=\"productDescription\" id=\"productDescription\" rows =\"10\" cols=\"100\" >" + product.getProductdescription() + "</textarea>");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Quantity in Stock: </label>
            <%
                out.println("  <input  class=\"col-sm form-control\" name=\"productInStock\" id=\"productInStock\" value=" + product.getQuantityinstock() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Buy Price: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"buyPrice\" id=\"buyPrice\" value=" + product.getBuyprice() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">MSRP: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"msrp\" id=\"msrp\" value=" + product.getMsrp() + ">");
            %>
        </div>
        <div class="right">
            <button class="btn btn-primary" name="UPDATE" value="UPDATE">Update</button>
            <button class="btn btn-warning" name="DELETE" value="DELETE">Delete</button>
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