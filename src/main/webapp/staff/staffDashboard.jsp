<%@ page import="com.oceanview.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>
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
<div class="container">
    <h3>Rooms Details</h3>

    <table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Room Type</th>
        <th>Price Per Night</th>
        <th>Status</th>
        
    </tr>

<%
    RoomDAO dao = new RoomDAO();
    List<Room> list = dao.getAllRooms();

    for (Room r : list) {
%>
    <tr>
        <td><%= r.getRoomId() %></td>
        <td><%= r.getRoomType() %></td>
        <td><%= r.getPricePerNight() %></td>
        <td><%= r.getStatus() %></td>
        
    </tr>
<%
    }
%>

</table>
</div>
</body>
</html>
