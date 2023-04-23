<%@ page import="com.serverside.model.entity.Customer" %>
<%@ page import="com.serverside.model.entity.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 18/4/2023
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          rel="stylesheet">
    <title>Delete Customer</title>
    <style>
        .form-wrapper {
            width: 40%;
            margin: 1rem auto 5rem;

        }
        .right {
            float: right;
        }
        h6{
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>

<div class="form-wrapper">
    <% Customer c = (Customer) request.getAttribute("CUST");%>

    <form class="needs-validation" novalidate action="CustomerController" method="post">
        <div class="row justify-content-center">
            <h6>Are you sure you want to delete the following item?</h6>
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
                out.println("  <input readonly class=\"col-sm form-control\" name=\"customerName\" id=\"customerName\" value=" + c.getCustomername() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Contact Last Name: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"contactLastName\" id=\"contactLastName\" value=" + c.getContactlastname() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Contact First Name: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"contactFirstName\" id=\"contactFirstName\" value=" + c.getContactfirstname() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Phone Number: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"phone\" id=\"phone\" value=" + c.getPhone() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address Line 1: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"addressLine1\" id=\"addressLine1\" value=" + c.getAddressline1() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address Line 2: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"addressLine2\" id=\"addressLine2\" value=" + c.getAddressline2() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">City: </label>
            <%
                out.println("  <input readonly required class=\"col-sm form-control\" name=\"city\" id=\"city\" value=" + c.getCity() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">State </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"state\" id=\"state\" value=" + c.getState() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Postal Code: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"postalCode\" id=\"postalCode\" value=" + c.getPostalcode() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Country: </label>
            <%
                out.println("  <input readonly required class=\"col-sm form-control\" name=\"country\" id=\"country\" value=" + c.getCountry() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Employee Number: </label>
            <%
                Employee e = c.getSalesrepemployeenumber();
                if (e != null) {
                    out.println("  <input readonly class=\"col-sm form-control\" name=\"employeeNumber\" id=\"employeeNumber\" value=" + e.getId() + ">");
                } else {
                    out.println("  <input  readonly  class=\"col-sm form-control\" name=\"employeeNumber\" id=\"employeeNumber\">");
                }
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Credit Limit: </label>
            <%
                out.println("  <input readonly class=\"col-sm form-control\" name=\"creditLimit\" id=\"creditLimit\" value=" + c.getCreditlimit() + ">");
            %>
        </div>
        <input name="type" id="type" value="delete" hidden>
        <div class="right">
            <button class="btn btn-danger" type="submit">Delete</button>
            <a class="btn btn-info" href="customer.html">Cancel</a>
        </div>

    </form>
</div>


</body>
</html>
