<%@ page import="java.util.*,com.oceanview.model.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Reservations</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<header>All Reservations</header>

<div class="container">
    <table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Guest Name</th>
        <th>Address</th>
        <th>Contact</th>
        <th>Room ID</th>
        <th>Check In</th>
        <th>Check Out</th>
        <th>Total Bill</th>
    </tr>

<%
    ReservationDAO dao = new ReservationDAO();
    List<Reservation> list = dao.getAllReservations();

    for (Reservation r : list) {
%>
    <tr>
        <td><%= r.getReservationId() %></td>
        <td><%= r.getGuestName() %></td>
        <td><%= r.getAddress() %></td>
        <td><%= r.getContactNumber() %></td>
        <td><%= r.getRoomId() %></td>
        <td><%= r.getCheckIn() %></td>
        <td><%= r.getCheckOut() %></td>
        <td><%= r.getTotalBill() %></td>
    </tr>
<%
    }
%>

</table>

    <a href="adminDashboard.jsp">Back</a>
</div>

</body>
</html>
