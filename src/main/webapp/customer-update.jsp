<%@ page import="com.serverside.model.entity.Customer" %>
<%@ page import="com.serverside.model.entity.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 18/4/2023
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Customer</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          rel="stylesheet">
    <style>
        .form-wrapper {
            width: 40%;
            margin: 1rem auto 10rem;

        }

        .right {
            float: right;
        }
        h3{
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
<% Customer c = (Customer) request.getAttribute("CUST");%>
<div class="form-wrapper">
    <form class="needs-validation" novalidate action="CustomerController" method="post">
        <div class="row justify-content-center">
            <h3>Update Customer Form</h3>
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
                out.println("  <input required class=\"col-sm form-control\" name=\"customerName\" id=\"customerName\" value=" + c.getCustomername() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Contact Last Name: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"contactLastName\" id=\"contactLastName\" value=" + c.getContactlastname() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Contact First Name: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"contactFirstName\" id=\"contactFirstName\" value=" + c.getContactfirstname() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Phone Number: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"phone\" id=\"phone\" value=" + c.getPhone() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address Line 1: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"addressLine1\" id=\"addressLine1\" value=" + c.getAddressline1() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address Line 2: </label>
            <%
                out.println("  <input  class=\"col-sm form-control\" name=\"addressLine2\" id=\"addressLine2\" value=" + c.getAddressline2() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">City: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"city\" id=\"city\" value=" + c.getCity() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">State </label>
            <%
                out.println("  <input  class=\"col-sm form-control\" name=\"state\" id=\"state\" value=" + c.getState() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Postal Code: </label>
            <%
                out.println("  <input class=\"col-sm form-control\" name=\"postalCode\" id=\"postalCode\" value=" + c.getPostalcode() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Country: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"country\" id=\"country\" value=" + c.getCountry() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Employee Number: </label>
            <%
                Employee e = c.getSalesrepemployeenumber();
                if (e != null) {
                    out.println("  <input class=\"col-sm form-control\" name=\"employeeNumber\" id=\"employeeNumber\" value=" + e.getId() + ">");
                } else {
                    out.println("  <input class=\"col-sm form-control\" name=\"employeeNumber\" id=\"employeeNumber\">");
                }
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Credit Limit: </label>
            <%
                out.println("  <input class=\"col-sm form-control\" name=\"creditLimit\" id=\"creditLimit\" value=" + c.getCreditlimit() + ">");
            %>
        </div>
        <input name="type" id="type" value="update" hidden>
        <div class="right">
            <button class="btn btn-primary" type="update">Update</button>
            <a class="btn btn-info" href="customer.html">Cancel</a>

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
