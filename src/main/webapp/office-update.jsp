<%@ page import="com.serverside.model.entity.Office" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Office</title>

    <!-- CSS links -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
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
    </style>

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>
<!-- Update office form -->
<%
    Office office = (Office) request.getAttribute("officeObject");
%>
<div class="form-wrapper">
    <form class="needs-validation" novalidate action="OfficeController" method="post">
        <div class="row justify-content-center">
            <h3>Update Office Form</h3>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Office ID: </label>
            <%
                out.println("<input class=\"col-sm form-control\" name=\"id\" id=\"id\" readonly value=" + office.getId() + ">");
            %>
        </div>

        <div class="form-group row">
            <label class="col-sm-4 col-form-label">City: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"city\" id=\"city\" value=" + office.getCity() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Phone: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"phone\" id=\"phone\" value=" + office.getPhone() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address Line 1: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"addressLine1\" id=\"addressLine1\" value=" + office.getAddressline1() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Address Line 2: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"addressLine2\" id=\"addressLine2\" value=" + office.getAddressline2() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">State: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"state\" id=\"state\" value=" + office.getState() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Country: </label>
            <%
                out.println("  <input  class=\"col-sm form-control\" name=\"country\" id=\"country\" value=" + office.getCountry() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Postal Code: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"postalCode\" id=\"postalCode\" value=" + office.getPostalcode() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Territory: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"territory\" id=\"territory\" value=" + office.getTerritory() + ">");
            %>
        </div>
        <input type="hidden" name="choice" value="3"/>
        <input type="hidden" name="update" value="UPDATE"/>
        <div class="right">
            <button class="btn btn-primary" type="update">Update</button>
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
