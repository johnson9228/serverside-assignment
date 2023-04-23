<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 4/23/2023
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logged out</title>
</head>
<body>
Logged out

<%
    session.invalidate();
%>
<p>
    <a href="index.html">Back to Main Page</a>
</p>
</body>
</html>

