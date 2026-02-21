<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Add Reservation</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="../css/staffdashboard.css">

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="staffDashboard.jsp">
            OceanView Staff
        </a>
    </div>
</nav>

<div class="container mt-5">

    <!-- Page Title -->
    <div class="text-center mb-4">
        <h2 class="fw-bold">New Reservation</h2>
        <p class="text-muted">Enter guest details and booking information</p>
    </div>

    <!-- Reservation Card -->
    <div class="card shadow-lg border-0">
        <div class="card-body p-4">

            <form method="post" action="<%=request.getContextPath()%>/AddReservationServlet">

                <!-- Guest Name -->
                <div class="mb-3">
                    <label class="form-label">Guest Name</label>
                    <input type="text" name="guestName" class="form-control" required>
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" class="form-control" required>
                </div>

                <!-- Contact -->
                <div class="mb-3">
                    <label class="form-label">Contact Number</label>
                    <input type="text" name="contact" class="form-control" required>
                </div>

                <!-- Room Selection -->
                <div class="mb-3">
                    <label class="form-label">Select Room</label>
                    <select name="roomId" class="form-select" required>

<%
    RoomDAO dao = new RoomDAO();
    List<Room> rooms = dao.getAvailableRooms();
    for(Room r : rooms) {
%>
        <option value="<%= r.getRoomId() %>">
            Room <%= r.getRoomId() %> - <%= r.getRoomType() %> (Rs.<%= r.getPricePerNight() %>)
        </option>
<%
    }
%>

                    </select>
                </div>

                <!-- Dates Row -->
                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Check-in Date</label>
                        <input type="date" name="checkIn" class="form-control" required>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Check-out Date</label>
                        <input type="date" name="checkOut" class="form-control" required>
                    </div>

                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-between mt-4">

                    <a href="staffDashboard.jsp" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Back
                    </a>

                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-check-circle"></i> Add Reservation
                    </button>

                </div>

            </form>

        </div>
    </div>

</div>

<!-- Footer -->
<footer class="footer mt-5">
    <div class="container text-center">
        <p>© 2026 OceanView Hotel System</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
