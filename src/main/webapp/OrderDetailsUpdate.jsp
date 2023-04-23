<%@ page import="com.serverside.model.entity.Order" %>
<%@ page import="com.serverside.model.entity.Orderdetail" %><%--
  Created by IntelliJ IDEA.
  User: honle
  Date: 18/4/2023
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Details Update</title>
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


<%
    Orderdetail od = (Orderdetail) request.getAttribute("OD");
%>

<form action ="OrderDetailsController" method="post">
    <table>
        <tr>
            <td>Order Number</td>
            <td>

                <%
                    out.println("<input type=\"text\" id=\"orderdetailsno\" name=\"orderdetailsno\" readonly value=" + od.getId().getOrdernumber());
                %>
            </td>
        </tr>
        <tr>
            <td>Product Code</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"productcode\" readonly value=" + od.getId().getProductcode());
                %>
            </td>
        </tr>
        <tr>
            <td>Quantity Order</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"quantityorder\"  value=" + od.getQuantityordered());
                %>
            </td>
        </tr>
        <tr>
            <td>Price per Each</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"priceeach\"  value=" + od.getPriceeach());
                %>
            </td>
        </tr>
        <tr>
            <td>Orderline Number</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"orderlineno\" value=" + od.getOrderlinenumber());
                %>
            </td>
        </tr>
    </table>

    <input type="submit" name="UPDATE" value="UPDATE" />
    <input type="submit" name="DELETE" value="DELETE" />
</form>

</body>
</html>


