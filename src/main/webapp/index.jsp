<%@ page import="com.serverside.model.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>Kool Store - Responsive eCommerce Template</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    <style>
        .product-content h5 {
            text-transform: none;
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
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->


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

<div class="content-section">
    <div class="container">
        <div class="row">
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                for (Product p:products){
            %>
            <div class="col-md-3">
                <div class="product-item-1">
                     <div class="product-thumb">
                        <img src="images/<%=p.getProductline().getId()%>.jpg" alt alt="Product Title">
                    </div> <!-- /.product-thumb -->
                    <div class="product-content">
                        <h5><a href="ProductController?display=product&id=<%=p.getId()%>"><%=p.getProductname()%></a></h5>
                        <span class="tagline"><%=p.getProductline().getId()%></span>
                        <span class="price">RM <%=p.getMsrp()%></span>
                        <p><%=p.getProductdescription()%></p>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item -->
            </div> <!-- /.col-md-3 -->
            <%}%>
        </div> <!-- /.row -->
        <form id="moreProduct" action="ProductPaginationServlet">
            <input type="hidden" name="admin" value="false">
            <input type="hidden" id="currPage" name="currentPage" value="1">
            <input type="hidden" id="recPerPage" name="recordsPerPage" value="12">
            <input type="hidden" name="keyword" value=""/>
            <input type="hidden" name="sort" value="ASC"/>
        </form>
        <a onclick="document.getElementById('moreProduct').submit();" style="cursor: pointer;float: right;">View More >>></a>

    </div> <!-- /.container -->
</div> <!-- /.content-section -->

<div class="content-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-title">
                <h2>New Products</h2>
            </div> <!-- /.section -->
        </div> <!-- /.row -->
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="product-item">
                    <div class="product-thumb">
                        <img src="images/gallery-image-2.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><a href="#">Name of Shirt</a></h5>
                        <span class="price">$40.00</span>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item -->
            </div> <!-- /.col-md-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-item">
                    <div class="product-thumb">
                        <img src="images/gallery-image-3.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><a href="#">Sport Shirt</a></h5>
                        <span class="price">$40.00</span>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item -->
            </div> <!-- /.col-md-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-item">
                    <div class="product-thumb">
                        <img src="images/gallery-image-4.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><a href="#">Elegant Shirt</a></h5>
                        <span class="price">$60.00</span>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item -->
            </div> <!-- /.col-md-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-item">
                    <div class="product-thumb">
                        <img src="images/gallery-image-5.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><a href="#">Another New Shirt</a></h5>
                        <span class="price">$80.00</span>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item -->
            </div> <!-- /.col-md-3 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.content-section -->

<div class="content-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 section-title">
                <h2>Vote For Future Products</h2>
            </div> <!-- /.section -->
        </div> <!-- /.row -->
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="product-item-vote">
                    <div class="product-thumb">
                        <img src="images/products/1.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><a href="#">Name of Shirt</a></h5>
                        <span class="tagline">By: Catherine</span>
                        <ul class="progess-bars">
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
                                    <span>4<i class="fa fa-heart"></i></span>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar comments" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                                    <span class="comments">6<i class="fa fa-heart"></i></span>
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-vote -->
            </div> <!-- /.col-md-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-item-vote">
                    <div class="product-thumb">
                        <img src="images/products/2.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><a href="#">Name of Shirt</a></h5>
                        <span class="tagline">By: Rebecca</span>
                        <ul class="progess-bars">
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
                                    <span>4<i class="fa fa-heart"></i></span>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar comments" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                                    <span class="comments">6<i class="fa fa-heart"></i></span>
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-vote -->
            </div> <!-- /.col-md-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-item-vote">
                    <div class="product-thumb">
                        <img src="images/products/3.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><a href="#">Name of Shirt</a></h5>
                        <span class="tagline">By: Catherine</span>
                        <ul class="progess-bars">
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
                                    <span>4<i class="fa fa-heart"></i></span>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar comments" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                                    <span class="comments">6<i class="fa fa-heart"></i></span>
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-vote -->
            </div> <!-- /.col-md-3 -->
            <div class="col-md-3 col-sm-6">
                <div class="product-item-vote">
                    <div class="product-thumb">
                        <img src="images/products/4.jpg" alt="">
                    </div> <!-- /.product-thum -->
                    <div class="product-content">
                        <h5><a href="#">Name of Shirt</a></h5>
                        <span class="tagline">By: Rebecca</span>
                        <ul class="progess-bars">
                            <li>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div>
                                    <span>4<i class="fa fa-heart"></i></span>
                                </div>
                            </li>
                            <li>
                                <div class="progress">
                                    <div class="progress-bar comments" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                                    <span class="comments">6<i class="fa fa-heart"></i></span>
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.product-content -->
                </div> <!-- /.product-item-vote -->
            </div> <!-- /.col-md-3 -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.content-section -->

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




<script src="js/vendor/jquery-1.10.1.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
<script src="js/jquery.easing-1.3.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>



</body>
</html>