<%@ page import="com.serverside.model.entity.Payment" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 17/4/2023
  Time: 11:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Payment</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          rel="stylesheet">
    <style>
        .form-wrapper {
            width: 30%;
            margin: auto;
            margin-top: 10rem;
        }

        .right {
            float: right;
        }

        h5 {
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>
<% Payment pm = (Payment) request.getAttribute("PM");%>
<div class="form-wrapper">
    <div class="row justify-content-center">
        <h5>Are you sure you want to delete the following item?</h5>
    </div>

    <form class="form" action="PaymentController" method="post">
        <div class="form-group row">
            <label class="col-sm-5 col-form-label">Customer Number: </label>
            <div class="col-sm">
                <%
                    out.println("<input class=\"form-control\" name=\"customerNumber\" id=\"customerNumber\" readonly value=" + pm.getId().getCustomernumber() + ">");
                %>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-5 col-form-label">Check Number: </label>
            <div class="col-sm">
                <%
                    out.println("<input class=\"form-control\" name=\"checkNumber\" id=\"checkNumber\" readonly value=" + pm.getId().getChecknumber() + ">");
                %>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-5 col-form-label">Payment Date: </label>
            <div class="col-sm">
                <%
                    out.println("  <input class=\"form-control\" name=\"paymentDate\" id=\"paymentDate\" readonly value=" + pm.getPaymentdate() + ">");
                %>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-5 col-form-label">Amount: </label>
            <div class="col-sm">
                <%
                    out.println("  <input name=\"amount\" class=\"form-control\" id=\"amount\" readonly value=" + pm.getAmount() + ">");
                %>
            </div>
        </div>


        <input name="type" id="type" value="delete" hidden>
        <div class="right">
            <button class="btn btn-danger" type="submit">Delete</button>
            <a class="btn btn-info" href="payment.html">Cancel</a>
        </div>

    </form>
</div>


</body>
</html>
