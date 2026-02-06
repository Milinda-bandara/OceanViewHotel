<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Room</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<header>Add New Room</header>

<div class="container">
    <form method="post" action="<%=request.getContextPath()%>/AddRoomServlet">
    <label>Room Type</label>
    <input type="text" name="roomType" required>

    <label>Price Per Night</label>
    <input type="number" step="0.01" name="price" required>

    <label>Status</label>
    <select name="status">
        <option value="Available">Available</option>
        <option value="Booked">Booked</option>
    </select>

    <button type="submit">Add Room</button>
</form>


    <a href="<%=request.getContextPath()%>/admin/adminDashboard.jsp">Back</a>
</div>

<div class="container">
    <h3>Rooms Details</h3>

    <table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Room Type</th>
        <th>Price Per Night</th>
        <th>Status</th>
        <th>Action</th>
        
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

    <td>
        <form method="post" action="<%= request.getContextPath() %>/UpdateRoomStatusServlet">
            <input type="hidden" name="roomId" value="<%= r.getRoomId() %>">

            <select name="status">
                <option value="AVAILABLE">AVAILABLE</option>
                <option value="BOOKED">BOOKED</option>
                <option value="MAINTENANCE">MAINTENANCE</option>
            </select>

            <button type="submit">Update</button>
        </form>
    </td>
</tr>

<%
    }
%>

</table>
</div>
</body>
</html>
