<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<header>New Reservation</header>

<div class="container">
   <form method="post" action="<%=request.getContextPath()%>/AddReservationServlet">

    <label>Guest Name</label>
    <input type="text" name="guestName" required>

    <label>Address</label>
    <input type="text" name="address" required>

    <label>Contact Number</label>
    <input type="text" name="contact" required>

    <label>Room</label>
<select name="roomId" required>
<%
    RoomDAO dao = new RoomDAO();
    List<Room> rooms = dao.getAvailableRooms();
    for(Room r : rooms) {
%>
    <option value="<%= r.getRoomId() %>">
        Room <%= r.getRoomId() %> - <%= r.getRoomType() %> (Rs.<%= r.getPricePerNight() %>)
    </option>
<% } %>
</select>


    <label>Check-in Date</label>
    <input type="date" name="checkIn" required>

    <label>Check-out Date</label>
    <input type="date" name="checkOut" required>

    <button type="submit">Add Reservation</button>
</form>



    <a href="staffDashboard.jsp">Back</a>
</div>

</body>
</html>
