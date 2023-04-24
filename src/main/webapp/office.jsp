<%@ page import="java.util.List" %>
<%@ page import="com.serverside.model.entity.Office" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Office</title>

    <!-- CSS links -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>

    <style>
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

        /* Add some hover effects to buttons */
        .form-container .btn:hover, .open-button:hover {
            opacity: 1;
        }

        /* Set the content in the table to centered */
        table th, td {
            text-align: center;
        }
        body{
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        footer{
            margin-top: auto;
        }
        .row-column{
            display: flex;
            padding: 1rem 1rem 0;
        }
    </style>
</head>
<body>
<!--[if lt IE 7]>
<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to
    improve your experience.</p>
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

<!-- Content section -->
<%
    int currentPage = (int) request.getAttribute("currentPage");
    int recordsPerPage = (int) request.getAttribute("recordsPerPage");
    int noOfPages = (int) request.getAttribute("noOfPages");
    String keyword = (String) request.getAttribute("keyword");
    String direction = (String) request.getAttribute("direction");
%>

<div class="row-column">
    <!-- Search bar for the table -->
    <form class="form-inline md-form mr-auto mb-4" action="OfficeReadController" method="post">
        <input  style="margin-right: 5px;" class="form-control" type="text" aria-label="Search" name="keyword"/>
        <select  style="margin-right: 5px;" class="form-control" id="direction" name="direction">
            <option value="ASC">ascending</option>
            <option value="DESC">descending</option>
        </select>
        <button class="btn btn-primary" type="submit">
            Search
        </button>
        <input type="hidden" name="currentPage" value="<%=currentPage%>"/>
        <input type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>"/>
        <input type="hidden" name="currentPage" value="<%=currentPage%>"/>
        <input type="hidden" name="recordsPerPage" value="<%=recordsPerPage%>"/>
        <input type="hidden" name="keyword" value="<%=keyword%>"/>
    </form>

    <!-- Create employee button -->
    <div >
        <button class="btn btn-primary mr-0" onclick="openCreateForm()">Create new employee</button>
    </div>
</div>



<!-- Office table -->
<div style="display: flex">
    <table class="table table-striped table-bordered table-sm" style="text-align: center;">
        <tr>
            <th>ID</th>
            <th>City</th>
            <th>Phone</th>
            <th>Address Line 1</th>
            <th>Address Line 2</th>
            <th>State</th>
            <th>Country</th>
            <th>Postal Code</th>
            <th>Territory</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <%
            List<Office> officeList = (List<Office>) request.getAttribute("officeList");

            if (officeList != null && officeList.size() != 0) {
                for (int i = 0; i < officeList.size(); i++) {

                    Office office = officeList.get(i);

                    out.println("<tr>");
                    out.print("<td>" + office.getId() + "</td>");
                    out.println("<td>" + office.getCity() + "</td>");
                    out.println("<td>" + office.getPhone() + "</td>");
                    out.println("<td>" + office.getAddressline1() + "</td>");
                    out.println("<td>" + office.getAddressline2() + "</td>");
                    out.println("<td>" + office.getState() + "</td>");
                    out.println("<td>" + office.getCountry() + "</td>");
                    out.println("<td>" + office.getPostalcode() + "</td>");
                    out.println("<td>" + office.getTerritory() + "</td>");
                    out.println("<td><a href=\"OfficeController?id=" + office.getId() + "&choice=" + 3 + "\">Update</a></td>");
                    out.println("<td><a href=\"OfficeController?id=" + office.getId() + "&choice=" + 4 + "\">Delete</a></td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr>");
                out.println("<td colspan='11'>" + "No record" + "</td>");
                out.println("</tr>");
            }
        %>
    </table>

</div>

<!-- Navigation of the table -->
<div>
    <ul style="list-style-type: none; display: flex;
    flex-direction: row; justify-content: center;
    align-items: center" ;>
        <%
            if (currentPage != 1 && noOfPages != 0) {
                out.println("<li style=\"padding-right: 50px\">");
                out.println("<a class=\"page-link\" href=\"" + "OfficeReadController?recordsPerPage=" + recordsPerPage
                        + "&currentPage=1" + "&keyword=" + keyword + "&direction=" + direction + "\">First</a>");
                out.println("</li>");
        %>
        <li style="padding-right: 50px">
            <%
                out.println("<a class=\"page-link\" href=\"" + "OfficeReadController?recordsPerPage=" + recordsPerPage
                        + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Previous</a>");
            %>
        </li>
        <%
            }
            if (currentPage < noOfPages) {
                out.println("<li style=\"padding-right: 50px\">");
                out.println("<a class=\"page-link\" href=\"" + "OfficeReadController?recordsPerPage=" + recordsPerPage
                        + "&currentPage=" + (currentPage + 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Next</a>");
                out.println("</li>");
                out.println("<li style=\"padding-right: 50px\">");
                out.println("<a class=\"page-link\" href=\"" + "OfficeReadController?recordsPerPage=" + recordsPerPage
                        + "&currentPage=" + noOfPages + "&keyword=" + keyword + "&direction=" + direction + "\">Last</a>");
                out.println("</li>");
            }
        %>
    </ul>
</div>
<%
    if (noOfPages != 0) {
        out.println("<p style=\"text-align: center;\">");
        out.println(currentPage + " of " + noOfPages);
        out.println("</p>");
    }
%>

<!-- Create office form -->
<div class="form-popup" id="createOfficeForm" style="display: none">
    <form action="OfficeController" method="post" class="form-container">
        <h1>Create New Office</h1>
        <fieldset>
            <legend>Office Details</legend>
            <br>
            <input type="text" name="city" placeholder="City"/>
            <br>
            <input type="text" name="phone" placeholder="Phone Number"/>
            <br>
            <input type="text" name="addressLine1" placeholder="Address Line 1"/>
            <br>
            <input type="text" name="addressLine2" placeholder="Address Line 2"/>
            <br>
            <input type="text" name="state" placeholder="State"/>
            <br>
            <input type="text" name="country" placeholder="Country"/>
            <br>
            <input type="text" name="postalCode" placeholder="Postal Code"/>
            <br>
            <input type="text" name="territory" placeholder="Territory"/>
            <input type="hidden" name="choice" value="2"/>
        </fieldset>
        <button type="submit">CREATE</button>
        <button type="reset">CLEAR</button>
        <button type="button" onclick="closeCreateForm()">CANCEL</button>
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

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script>
    function openCreateForm() {
        document.getElementById("createOfficeForm").style.display = "block";
    }

    function closeCreateForm() {
        document.getElementById("createOfficeForm").style.display = "none";
    }
</script>
</body>
</html>
