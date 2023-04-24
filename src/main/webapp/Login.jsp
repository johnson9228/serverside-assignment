<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/23/2023
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>

<div style="width: 100%;display: grid;justify-content: center;">
    <form method="post" action="<%=response.encodeURL("j_security_check")%>" style="display: grid; justify-content: center; margin-top: 200px; padding: 50px; background-color: #E5E4E2">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon3">Username:</span>
            </div>
            <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3" name="j_username">
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon3"> Password: </span>
            </div>
            <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3" name="j_password">
        </div>
        <%--    Username: <input type="text" name="j_username"/>--%>
        <%--    Password: <input type="password" name="j_password"/>--%>
        <button type="submit" class="btn btn-primary" value="Log In">Log In</button>
    </form>

</div>
</body>
</html>
