<%@ page import="com.serverside.model.entity.Payment" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 17/4/2023
  Time: 5:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Update</title>
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
        h3{
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>
<% Payment pm = (Payment) request.getAttribute("PM");%>
<div class="form-wrapper">
    <div class="justify-content-center row">
        <h3>Update Payment</h3>
    </div>

    <form class="needs-validation" novalidate action="PaymentController" method="post">
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
                    out.println("  <input required class=\"form-control\" name=\"paymentDate\" id=\"paymentDate\" value=" + pm.getPaymentdate() + ">");
                %>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-5 col-form-label">Amount: </label>
            <div class="col-sm">
                <%
                    out.println("  <input required class=\"form-control\" name=\"amount\" id=\"amount\" value=" + pm.getAmount() + ">");
                %>
            </div>
        </div>

        <input name="type" id="type" value="update" hidden>
        <div class="right">
            <button class="btn-primary btn" type="submit">Update</button>
            <a class="btn btn-info" href="payment.html">Cancel</a>
        </div>

    </form>
</div>
<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>
