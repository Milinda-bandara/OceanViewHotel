<%@ page import="com.oceanview.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>

<%
    // Session checking (kept same logic)
    User user = (User) session.getAttribute("user");
    if(user == null || !"STAFF".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Staff Dashboard</title>

<!-- Bootstrap 5 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">OceanView Staff</a>

        <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../help.jsp">
                        <i class="bi bi-question-circle"></i> Help
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning" href="../LogoutServlet">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Container -->
<div class="container mt-4">

    <!-- Welcome Section -->
    <div class="mb-4">
        <h3 class="fw-bold">Welcome, Staff Member</h3>
        <p class="text-muted">Manage reservations and room availability.</p>
    </div>

    <!-- Dashboard Cards -->
    <div class="row g-4 mb-4">

        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm">
                <div class="card-body text-center">
                    <i class="bi bi-plus-circle display-5 text-primary"></i>
                    <h5 class="card-title mt-2">Add Reservation</h5>
                    <a href="addReservation.jsp" class="btn btn-primary btn-sm mt-2">Open</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm">
                <div class="card-body text-center">
                    <i class="bi bi-receipt display-5 text-success"></i>
                    <h5 class="card-title mt-2">Calculate Bill</h5>
                    <a href="calculateBill.jsp" class="btn btn-success btn-sm mt-2">Open</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm">
                <div class="card-body text-center">
                    <i class="bi bi-list-check display-5 text-warning"></i>
                    <h5 class="card-title mt-2">View Reservations</h5>
                    <a href="viewReservations.jsp" class="btn btn-warning btn-sm mt-2">Open</a>
                </div>
            </div>
        </div>

    </div>

    <!-- Rooms Table -->
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Room Details</h5>
        </div>

        <div class="card-body table-responsive">

            <table class="table table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Room Type</th>
                        <th>Price Per Night</th>
                        <th>Status</th>
                        <th>Update Status</th>
                    </tr>
                </thead>
                <tbody>

<%
    RoomDAO dao = new RoomDAO();
    List<Room> list = dao.getAllRooms();

    for (Room r : list) {

        String badgeClass = "bg-secondary";

        if ("AVAILABLE".equals(r.getStatus())) {
            badgeClass = "bg-success";
        } else if ("BOOKED".equals(r.getStatus())) {
            badgeClass = "bg-danger";
        } else if ("MAINTENANCE".equals(r.getStatus())) {
            badgeClass = "bg-warning text-dark";
        }
%>

<tr>
    <td><%= r.getRoomId() %></td>
    <td><%= r.getRoomType() %></td>
    <td>$<%= r.getPricePerNight() %></td>

    <!-- Status Badge -->
    <td>
        <span class="badge <%= badgeClass %>">
            <%= r.getStatus() %>
        </span>
    </td>

    <!-- Update Form -->
    <td>
        <form class="d-flex gap-2"
              method="post"
              action="<%= request.getContextPath() %>/UpdateRoomStatusServlet">

            <input type="hidden" name="roomId" value="<%= r.getRoomId() %>">

            <select name="status" class="form-select form-select-sm">
                <option value="AVAILABLE">AVAILABLE</option>
                <option value="BOOKED">BOOKED</option>
                <option value="MAINTENANCE">MAINTENANCE</option>
            </select>

            <button type="submit" class="btn btn-primary btn-sm">
                Update
            </button>
        </form>
    </td>
</tr>

<%
    }
%>

                </tbody>
            </table>

        </div>
    </div>

</div>

<!-- Footer -->
<footer class="footer mt-5">
    <div class="container text-center">
        <p>© 2026 OceanView Hotel Management System</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
