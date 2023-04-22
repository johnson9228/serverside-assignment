<%@ page import="com.serverside.model.entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="com.serverside.controller.EmployeeController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Staff</title>

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
                        <a href="#">Sign Up</a>
                        <a href="#">Log In</a>
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
                            <li><a href="product-detail.html">Details</a></li>
                            <li><a href="EmployeeReadController">Staff</a></li>
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

<!-- Content section -->
<!-- Display table list of employee -->
<%
    int currentPage = (int) request.getAttribute("currentPage");
    int recordsPerPage = (int) request.getAttribute("recordsPerPage");
    int noOfPages = (int) request.getAttribute("noOfPages");
    String keyword = (String) request.getAttribute("keyword");
    String direction = (String) request.getAttribute("direction");
%>

<nav class="navbar navbar-light bg-light" style="margin: 0">
    <!-- Search bar for the table -->
    <form class="form-inline md-form mr-auto mb-4" action="EmployeeReadController" method="post">
        <input class="form-control" type="text" aria-label="Search" name="keyword"/>
        <select class="form-control" id="direction" name="direction">
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
    <div class="float-right" style="text-align: center;">
        <button class="btn btn-primary mr-0" onclick="openCreateForm()">Create new employee</button>
    </div>
</nav>

<!-- Employee table -->
<div style="display: flex">
    <table class="table table-striped table-bordered table-sm">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Extension</th>
            <th>Office Code</th>
            <th>Reports to</th>
            <th>Job Title</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <%
            List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");

            if (employeeList != null && employeeList.size() != 0) {
                for (int i = 0; i < employeeList.size(); i++) {

                    Employee emp = employeeList.get(i);

                    out.println("<tr>");
                    out.print("<td>" + emp.getId() + "</td>");
                    out.println("<td>" + emp.getFirstname() + "</td>");
                    out.println("<td>" + emp.getLastname() + "</td>");
                    out.println("<td>" + emp.getEmail() + "</td>");
                    out.println("<td>" + emp.getExtension() + "</td>");
                    out.println("<td>" + emp.getOfficecode().getId() + "</td>");
                    out.println("<td>" + emp.getReportsto() + "</td>");
                    out.println("<td>" + emp.getJobtitle() + "</td>");
                    out.println("<td><a href=\"EmployeeController?id=" + emp.getId() + "&choice=" + 3 + "\">Update</a></td>");
                    out.println("<td><a href=\"EmployeeController?id=" + emp.getId() + "&choice=" + 4 + "\">Delete</a></td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr>");
                out.println("<td colspan='10'>" + "No record" + "</td>");
                out.println("</tr>");
            }
        %>
    </table>

</div>

<!-- Navigation of the table -->
<div>
    <ul style="list-style-type: none; display: flex;
    flex-direction: row; justify-content: center;
    align-items: center">
        <%
            if (currentPage != 1 && noOfPages != 0) {
                out.println("<li style=\"padding-right: 50px\">");
                out.println("<a class=\"page-link\" href=\"" + "EmployeeReadController?recordsPerPage=" + recordsPerPage
                        + "&currentPage=1" + "&keyword=" + keyword + "&direction=" + direction + "\">First</a>");
                out.println("</li>");
        %>
        <li style="padding-right: 50px">
            <%
                out.println("<a class=\"page-link\" href=\"" + "EmployeeReadController?recordsPerPage=" + recordsPerPage
                        + "&currentPage=" + (currentPage - 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Previous</a>");
            %>
        </li>
        <%
            }
            if (currentPage < noOfPages) {
                out.println("<li style=\"padding-right: 50px\">");
                out.println("<a class=\"page-link\" href=\"" + "EmployeeReadController?recordsPerPage=" + recordsPerPage
                        + "&currentPage=" + (currentPage + 1) + "&keyword=" + keyword + "&direction=" + direction + "\">Next</a>");
                out.println("</li>");
                out.println("<li style=\"padding-right: 50px\">");
                out.println("<a class=\"page-link\" href=\"" + "EmployeeReadController?recordsPerPage=" + recordsPerPage
                        + "&currentPage=" + noOfPages + "&keyword=" + keyword + "&direction=" + direction + "\">Last</a>");
                out.println("</li>");
            }
        %>
    </ul>
</div>
<%
    if (noOfPages != 0) {
        out.println("<p style=\"text-align: center; justify-content: center\">");
        out.println(currentPage + " of " + noOfPages);
        out.println("</p>");
    }
%>

<!-- Create employee form -->
<div class="form-popup" id="createEmployeeForm" style="display: none">
    <form action="EmployeeController" method="post" class="form-container">
        <h1>Create New Employee Profile</h1>
        <fieldset>
            <legend>Employee Details</legend>
            <br>
            <input type="text" name="firstName" placeholder="First Name"/>
            <br>
            <input type="text" name="lastName" placeholder="Last Name"/>
            <br>
            <input type="email" name="email" placeholder="Email"/>
            <br>
            <input type="text" name="officeCode" placeholder="Office Code"/>
            <br>
            <input type="text" name="extension" placeholder="Extension"/>
            <br>
            <input type="text" name="reportsTo" placeholder="Reports To"/>
            <br>
            <input type="text" name="jobTitle" placeholder="Job Title"/>
            <input type="hidden" name="choice" value="2"/>
        </fieldset>
        <button type="submit">CREATE</button>
        <button type="reset">CLEAR</button>
        <button type="button" onclick="closeCreateForm()">CANCEL</button>
    </form>
</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script>
    function openCreateForm() {
        document.getElementById("createEmployeeForm").style.display = "block";
    }

    function closeCreateForm() {
        document.getElementById("createEmployeeForm").style.display = "none";
    }
</script>
</body>
</html>