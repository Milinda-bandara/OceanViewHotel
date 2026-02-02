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

</body>
</html>
