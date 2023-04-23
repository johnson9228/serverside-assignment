<%@ page import="com.serverside.model.entity.Order" %><%--
  Created by IntelliJ IDEA.
  User: honle
  Date: 18/4/2023
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Update</title>
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
    Order o = (Order) request.getAttribute("ODR");
%>

<form action ="OrderController" method="post">
    <table>
        <tr>
            <td>Order ID</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"OID\" readonly value=" + o.getId());
                %>
            </td>
        </tr>
        <tr>
            <td>Customer Number</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"CNM\" value=" + o.getCustomernumber());
                %>
            </td>
        </tr>
        <tr>
            <td>Order Date</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"OD\"  value=" + o.getOrderdate());
                %>
            </td>
        </tr>
        <tr>
            <td>Required Date</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"RD\"  value=" + o.getRequireddate());
                %>
            </td>
        </tr>
        <tr>
            <td>Shipped Date</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"SD\" value=" + o.getShippeddate());
                %>
            </td>
        </tr>
        <tr>
            <td>Status</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"ST\" value=" + o.getStatus());
                %>
            </td>
        </tr>
        <tr>
            <td>Comments</td>
            <td>
                <%
                    out.println("<input type=\"text\" name=\"COM\" value=" + o.getComments());
                %>
            </td>
        </tr>
    </table>

    <input type="submit" name="UPDATE" value="UPDATE" />
    <input type="submit" name="DELETE" value="DELETE" />
</form>

</body>
</html>

