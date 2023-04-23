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
</head>
<body>

<form method="post" action="<%=response.encodeURL("j_security_check")%>">
    Username: <input type="text" name="j_username"/>
    Password: <input type="password" name="j_password"/>
    <input type="submit" value="Log In">
</form>

</body>
</html>
