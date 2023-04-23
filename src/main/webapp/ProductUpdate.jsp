<%@ page import="com.serverside.model.entity.Product" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Product Information</title>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
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
                <div class="col-md-8 col-sm-6 col-xs-4">
                    <div class="main-menu">
                        <a href="#" class="toggle-menu">
                            <i class="fa fa-bars"></i>
                        </a>
                        <ul class="menu">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Catalogs</a></li>
                            <li><a href="#">FAQs</a></li>
                            <li><a href="#">Policies</a></li>
                            <li><a href="#">About</a></li>
                        </ul>
                    </div> <!-- /.main-menu -->
                </div> <!-- /.col-md-8 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-header -->
    <div class="main-nav">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-7">
                    <div class="list-menu">
                        <ul>
                            <li><a href="index.html">Shop</a></li>
                            <li><a href="ProductPaginationServlet?currentPage=1&recordsPerPage=12&admin=false&keyword=&sort=ASC">Catalogs</a></li>
                            <li><a href="ProductlineDisplayServlet?currentPage=1&recordsPerPage=12&&keyword=&sort=ASC">Productline</a></li>
                            <li><a href="contact.html">Contact</a></li>
                            <li><a href="adminProductPage.html">Product Edit</a></li>
                        </ul>
                    </div> <!-- /.list-menu -->
                </div> <!-- /.col-md-6 -->
                <div class="col-md-6 col-sm-5">
                    <div class="notification">
                        <span>Free Shipping on any order above $50</span>
                    </div>
                </div> <!-- /.col-md-6 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.main-nav -->
</header> <!-- /.site-header -->
<%
Product product = (Product) request.getAttribute("product");
%>
    <form action="ProductController" method="post">
        <table>
            <tr>
                <td>Product Code</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"productId\" readonly value=" + product.getId() + ">");
                    %>
                </td>
            </tr>
            <tr>
                <td>Product Name</td>
                <td>
                    <%
                        out.println("<textarea name=\"productName\" cols=\"50\" >" + product.getProductname() +"</textarea>");
                    %>
                </td>
            </tr>
            <tr>
                <td>Productline</td>
                <td>
                    <%
                        out.println("<textarea name=\"productline\" cols=\"50\" >" + product.getProductline().getId() +"</textarea>");
                    %>
                </td>
            </tr>
            <tr>
                <td>Product Scale</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"productScale\" value=" + product.getProductscale());
                    %>
                </td>
            </tr>
            <tr>
                <td>Product Vendor</td>
                <td>
                    <%
                        out.println("<textarea name=\"productVendor\" cols=\"50\" >" + product.getProductvendor() +"</textarea>");
                    %>
                </td>
            </tr>
            <tr>
                <td>Product Description</td>
                <td>
                    <%
                        out.println("<textarea name=\"productDescription\" rows =\"10\" cols=\"100\" >" + product.getProductdescription() +"</textarea>");
                    %>
                </td>
            </tr>
            <tr>
                <td>Quantity in Stock</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"productInStock\" value=" + product.getQuantityinstock());
                    %>
                </td>

            </tr>
            <tr>
                <td>Buy Price</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"buyPrice\" value=" + product.getBuyprice());
                    %>
                </td>
            </tr>
            <tr>
                <td>MSRP</td>
                <td>
                    <%
                        out.println("<input type=\"text\" name=\"msrp\" value=" + product.getMsrp());
                    %>
                </td>
            </tr>
        </table>
        <input type="submit" name="UPDATE" value="UPDATE" />
        <input type="submit" name="DELETE" value="DELETE" />
    </form>
</body>
</html>