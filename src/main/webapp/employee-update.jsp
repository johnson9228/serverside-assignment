<%@ page import="com.serverside.model.entity.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Staff</title>

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
<!-- Update employee form -->
<%
    Employee emp = (Employee) request.getAttribute("employeeObject");
%>
<div class="form-wrapper">
    <form class="needs-validation" novalidate action="EmployeeController" method="post">
        <div class="row justify-content-center">
            <h3>Update Employee Form</h3>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Staff ID: </label>
            <%
                out.println("<input class=\"col-sm form-control\" name=\"id\" id=\"id\" readonly value=" + emp.getId() + ">");
            %>
        </div>

        <div class="form-group row">
            <label class="col-sm-4 col-form-label">First Name: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"firstName\" id=\"firstName\" value=" + emp.getFirstname() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Last Name: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"lastName\" id=\"lastName\" value=" + emp.getLastname() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Email: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"email\" id=\"email\" value=" + emp.getEmail() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Extension: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"extension\" id=\"extension\" value=" + emp.getExtension() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Office Code: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"officeCode\" id=\"officeCode\" value=" + emp.getOfficecode().getId() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Reports To: </label>
            <%
                out.println("  <input  class=\"col-sm form-control\" name=\"reportsTo\" id=\"reportsTo\" value=" + emp.getReportsto() + ">");
            %>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Job Title: </label>
            <%
                out.println("  <input required class=\"col-sm form-control\" name=\"jobTitle\" id=\"jobTitle\" value=" + emp.getJobtitle() + ">");
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
