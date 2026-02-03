<%@ page import="com.oceanview.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"STAFF".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<header>Staff Dashboard</header>

<nav>
    <a href="../help.jsp">Help</a>
    <a href="../LogoutServlet">Logout</a>
</nav>

<div class="container">
    <h3>Welcome, Staff Member</h3>

    <ul>
        <li><a href="addReservation.jsp">Add Reservation</a></li>
        <li><a href="calculateBill.jsp">Calculate Bill</a></li>
        <li><a href="viewReservations.jsp">View All Reservations</a></li>
    </ul>
</div>

</body>
</html>
