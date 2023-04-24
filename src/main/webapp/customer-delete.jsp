<%@ page import="com.serverside.model.entity.Customer" %>
<%@ page import="com.serverside.model.entity.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 18/4/2023
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <title>Delete Customer</title>
    <style>
        .form-wrapper {
            width: 40%;
            margin: 1rem auto 5rem;

        }
        .right {
            float: right;
        }
        h6{
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
    <% Customer c = (Customer) request.getAttribute("CUST");%>

    <form class="needs-validation" novalidate action="CustomerController" method="post">
        <div class="row justify-content-center">
            <h6>Are you sure you want to delete the following item?</h6>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Customer Number: </label>
            <%
                out.println("<input class=\"col-sm form-control\" name=\"customerNumber\" id=\"customerNumber\" readonly value=" + c.getId() + ">");
            %>
        </div>

        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Customer Name: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"customerName\" id=\"customerName\" value=" + c.getCustomername() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Contact Last Name: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"contactLastName\" id=\"contactLastName\" value=" + c.getContactlastname() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Contact First Name: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"contactFirstName\" id=\"contactFirstName\" value=" + c.getContactfirstname() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Phone Number: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"phone\" id=\"phone\" value=" + c.getPhone() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address Line 1: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"addressLine1\" id=\"addressLine1\" value=" + c.getAddressline1() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address Line 2: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"addressLine2\" id=\"addressLine2\" value=" + c.getAddressline2() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">City: </label>
            <%
                out.println("  <input readonly required class=\"col-sm form-control\" name=\"city\" id=\"city\" value=" + c.getCity() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">State </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"state\" id=\"state\" value=" + c.getState() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Postal Code: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"postalCode\" id=\"postalCode\" value=" + c.getPostalcode() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Country: </label>
            <%
                out.println("  <input readonly required class=\"col-sm form-control\" name=\"country\" id=\"country\" value=" + c.getCountry() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Employee Number: </label>
            <%
                Employee e = c.getSalesrepemployeenumber();
                if (e != null) {
                    out.println("  <input readonly class=\"col-sm form-control\" name=\"employeeNumber\" id=\"employeeNumber\" value=" + e.getId() + ">");
                } else {
                    out.println("  <input  readonly  class=\"col-sm form-control\" name=\"employeeNumber\" id=\"employeeNumber\">");
                }
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Credit Limit: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"creditLimit\" id=\"creditLimit\" value=" + c.getCreditlimit() + ">");
            %>
        </div>
        <input name="type" id="type" value="delete" hidden>
        <div class="right">
            <button class="btn btn-danger" type="submit">Delete</button>
            <a class="btn btn-info" href="customer.html">Cancel</a>
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
