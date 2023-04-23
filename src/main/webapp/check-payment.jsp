<%@ page import="java.util.List" %>
<%@ page import="com.serverside.model.entity.Payment" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 17/4/2023
  Time: 2:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check Payment</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          rel="stylesheet">
    <style>
        .wrapper {
            margin: 2rem 5.5rem;
        }

        .pagination-wrapper {
            margin: 1rem 4rem;
            float: right;
            text-align: right;
        }
        .pagination-wrapper p {
            padding-right: 1rem;
        }


        .item {
            margin-right: 1rem;
        }

        .table-wrapper {
            width: 90%;
            margin: auto;
        }

        tr td a {
            padding-right: 1rem;
            padding-left: 1rem;
        }

        th, td {
            text-align: center;
        }
        .right{
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
              action="CheckPaymentServlet" method="get">
            <input class="form-control item mr-sm-2" type="text" aria-label="Search"
                   name="keyword"/>
            <select class="form-control item" id="direction" name="direction">
                <option value="ASC">ascending</option>
                <option value="DESC">descending</option>
            </select>
            <button class="btn btn-rounded btn-sm btn-info"
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
            <a class=" btn btn btn-info" href="create-payment.html">Create Payment</a>
        </div>
    </div>

</div>


<div class="table-wrapper">
    <table class="table table-striped table-bordered ">
        <tr class="table-primary">
            <th>Customer Number</th>
            <th>Check Number</th>
            <th>Customer Name</th>
            <th>Payment Date</th>
            <th>Payment Amount</th>
            <th></th>

        </tr>

        <%
            List<Payment> payments = (List<Payment>) request.getAttribute("PMList");
            if (payments.size() != 0) {
                for (Payment p : payments) {
                    out.println("<tr>");
                    out.println("<td>" + p.getId().getCustomernumber() + "</td>");
                    out.println("<td>" + p.getId().getChecknumber() + "</td>");
                    out.println("<td>" + p.getCustomernumber().getCustomername() + "</td>");
                    out.println("<td>" + p.getPaymentdate() + "</td>");
                    out.println("<td>" + p.getAmount() + "</td>");
                    out.println("<td><a href=\"PaymentController?customernumber=" + p.getId().getCustomernumber()
                            + "&checknumber=" + p.getId().getChecknumber() + "&type=update" + "\">Update</a>");
                    out.println("<a class=\"text-danger\" href=\"PaymentController?customernumber=" + p.getId().getCustomernumber()
                            + "&checknumber=" + p.getId().getChecknumber() + "&type=delete" + "\">Delete</a></td>");
                    out.println("</tr>");
                }
            } else {
                out.println("<tr>");
                String status = "No records";
                for (int i = 0; i < 5; i++) {
                    out.println("<td>" + status + "</td>");
                    if (i == 4) {
                        out.println("<td>Invalid</td>");
                    }
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
                    out.println("<a class=\"page-link item\" href=\"" + "CheckPaymentServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=1" + "&keyword=" + keyword + "&direction="
                            + direction + "\">First</a>");
                    out.println("</li>");
            %>
            <li class="page-item">
                <%
                    out.println("<a class=\"page-link item\" href=\"" + "CheckPaymentServlet?recordsPerPage=" + recordsPerPage
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
                    out.println("<a class=\"page-link\" href=\"" + "CheckPaymentServlet?recordsPerPage=" + recordsPerPage
                            + "&currentPage=" + (currentPage + 1) + "&keyword=" + keyword + "&direction=" + direction +
                            "\">Next</a>");
                    out.println("</li>");
                    out.println("<li class=\"page-item item\">");
                    out.println("<a class=\"page-link\" href=\"" + "CheckPaymentServlet?recordsPerPage=" + recordsPerPage
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
