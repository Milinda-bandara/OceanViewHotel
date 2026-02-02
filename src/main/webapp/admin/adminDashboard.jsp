<%@ page import="com.oceanview.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<header>Admin Dashboard</header>

<nav>
    <a href="../help.jsp">Help</a>
    <a href="../LogoutServlet">Logout</a>
</nav>

<div class="container">
    <h3>Welcome, Admin</h3>

    <ul>
        <li><a href="addUser.jsp">Add Staff User</a></li>
        <li><a href="addRoom.jsp">Add Room</a></li>
        <li><a href="viewReservations.jsp">View All Reservations</a></li>
    </ul>
</div>

</body>
</html>
