<%@ page import="com.serverside.model.entity.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="com.serverside.model.entity.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 18/4/2023
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check Customer</title>
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
        .wrapper {
            margin: 2rem 3.5rem;
        }

        .table-wrapper {
            width: 95%;
            margin: auto;
        }

        tr td a {
            padding-right: 1rem;
            padding-left: 1rem;
        }

        th, td {
            text-align: center;
        }

        .item {
            margin-right: 1rem;
        }

        .pagination-wrapper {
            margin: 1rem 1.5rem;
            float: right;
            text-align: right;
        }

        .pagination-wrapper p {
            padding-right: 1rem;
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
</head>
<body>
<%
    int currentPage = (int) request.getAttribute("currentPage");
    int recordsPerPage = (int) request.getAttribute("recordsPerPage");
    int nOfPages = (int) request.getAttribute("nOfPages");
    String keyword = (String) request.getAttribute("keyword");
    String direction = (String) request.getAttribute("direction");
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
<div class="wrapper">
    <div class="row">
        <form class="form-inline md-form mr-auto mb-4"
              action="CheckCustomerServlet" method="get">
            <input class="form-control item mr-sm-2" type="text" aria-label="Search"
                   name="keyword"/>
            <select class="form-control item" id="direction" name="direction">
                <option value="ASC">ascending</option>
                <option value="DESC">descending</option>
            </select>
            <button class="btn btn btn-info btn-sm"
                    type="submit">Search
            </button>
            <input type="hidden" name="currentPage" value="<%=currentPage%>"/> <input
                type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>"/>
            <input type="hidden" name="currentPage" value="<%=currentPage%>"/> <input
                type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>"/>
            <input
                    type="hidden" name="keyword" value="<%=keyword%>"/>


        </form>
        <div class="right">
            <a class=" btn btn btn-info" href="create-customer.html">Create Customer</a>
        </div>
    </div>
</div>

<div class="table-wrapper">
    <table class="table table-striped table-bordered">
        <tr class="table-primary">
            <th>Customer Number</th>
            <th>Customer Name</th>
            <th>Contact Last Name</th>
            <th>Contact First Name</th>
            <th>Phone Number</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Postal Code</th>
            <th>Country</th>
            <th>Employee Number</th>
            <th>Credit Limit</th>
            <th></th>

        </tr>

        <%
            List<Customer> customers = (List<Customer>) request.getAttribute("CList");

            if (customers.size() != 0) {
                for (Customer c : customers) {

                    out.println("<tr>");
                    out.println("<td>" + c.getId() + "</td>");
                    out.println("<td>" + c.getCustomername() + "</td>");
                    out.println("<td>" + c.getContactlastname() + "</td>");
                    out.println("<td>" + c.getContactfirstname() + "</td>");
                    out.println("<td>" + c.getPhone() + "</td>");
                    out.println("<td>" + c.getAddressline1());
                    if (c.getAddressline2() != null) {
                        out.println(", " + c.getAddressline2() + "</td>");
                    } else {
                        out.println("");
                    }
                    if (c.getCity() != null) {
                        out.println("<td>" + c.getCity() + "</td>");
                    } else {
                        out.println("<td>-</td>");
                    }
                    if (c.getState() != null) {
                        out.println("<td>" + c.getState() + "</td>");
                    } else {
                        out.println("<td>-</td>");
                    }
                    if (c.getPostalcode() != null) {
                        out.println("<td>" + c.getPostalcode() + "</td>");
                    } else {
                        out.println("<td>-</td>");
                    }
                    if (c.getCountry() != null) {
                        out.println("<td>" + c.getCountry() + "</td>");
                    } else {
                        out.println("<td>-</td>");
                    }

                    Employee employee = c.getSalesrepemployeenumber();
                    if (employee != null) {
                        out.println("<td>" + employee.getId() + "</td>");
                    } else {
                        out.println("<td>-</td>");
                    }
                    if (c.getCreditlimit() != null) {
                        out.println("<td>" + c.getCreditlimit() + "</td>");
                    } else {
                        out.println("<td>-</td>");
                    }
                    out.println("<td><a href=\"CustomerController?customernumber=" + c.getId() + "&type=update" + "\">Update</a>");
                    out.println("<a class=\"text-danger\" href=\"CustomerController?customernumber=" + c.getId() + "&type=delete" + "\">Delete</a></td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr>");
                String status = "No records";
                for (int i = 0; i < 8; i++) {
                    out.println("<td>" + status + "</td>");
                }
                out.println("</tr>");
            }
        %>
    </table>
</div>
<div class="pagination-wrapper">
    <%
        if (nOfPages != 0) {
            out.println("<p class=\"pageref\">");
            out.println(currentPage + " of " + nOfPages);
            out.println("</p>");
        }
    %>
    <nav>
        <ul class="pagination">
            <%
                if (currentPage != 1 && nOfPages != 0) {
                    out.println("<li class=\"page-item\">");
                    out.println("<a class=\"page-link item\" href=\"" + "CheckCustomerServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=1" + "&keyword=" + keyword + "&direction="
                            + direction + "\">First</a>");
                    out.println("</li>");
            %>
            <li class="page-item">
                <%
                    out.println("<a class=\"page-link item\" href=\"" + "CheckCustomerServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Previous</a>");
                %>
            </li>
            <%
                }
            %>
            <%
            %>
            <%
                if (currentPage < nOfPages) {
                    out.println("<li class=\"page-item item\">");
                    out.println("<a class=\"page-link\" href=\"" + "CheckCustomerServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=" + (currentPage + 1) + "&keyword=" + keyword + "&direction=" + direction +
                            "\">Next</a>");
                    out.println("</li>");
                    out.println("<li class=\"page-item item\">");
                    out.println("<a class=\"page-link\" href=\"" + "CheckCustomerServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=" + nOfPages + "&keyword=" +
                            keyword + "&direction=" + direction + "\">Last</a>");
                    out.println("</li>");
                }
            %>
        </ul>
    </nav>

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
