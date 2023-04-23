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

</body>
</html>
