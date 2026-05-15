<%@ page import="com.placement.model.User" %>

<%
User user = (User) session.getAttribute("user");
%>

<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="container">

<h1>Welcome <%= user.getName() %></h1>

<h2>Placement Resources</h2>

<ul>
    <li>Java Interview Questions</li>
    <li>DBMS Notes</li>
    <li>Resume Building Tips</li>
</ul>

</div>

</body>
</html>
