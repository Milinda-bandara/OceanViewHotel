<%@ page import="com.oceanview.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>

<%
    // Session security: only STAFF can access
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

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
    .dashboard-card {
        border-radius: 0.75rem;
        transition: transform 0.2s;
    }
    .dashboard-card:hover {
        transform: translateY(-5px);
    }
    .badge-status {
        font-size: 0.9rem;
        padding: 0.4em 0.7em;
    }
</style>
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
                    <a class="nav-link" href="../help.jsp"><i class="bi bi-question-circle"></i> Help</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning" href="../LogoutServlet"><i class="bi bi-box-arrow-right"></i> Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">

    <!-- Welcome -->
    <div class="mb-4 text-center">
        <h3 class="fw-bold">Welcome, Staff Member</h3>
        <p class="text-muted">Manage reservations and monitor room availability</p>
    </div>

    <!-- Dashboard Cards -->
    <div class="row g-4 mb-4">
        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm text-center p-3">
                <i class="bi bi-plus-circle display-5 text-primary"></i>
                <h5 class="mt-2">Add Reservation</h5>
                <a href="addReservation.jsp" class="btn btn-primary btn-sm mt-2">Open</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm text-center p-3">
                <i class="bi bi-receipt display-5 text-success"></i>
                <h5 class="mt-2">Calculate Bill</h5>
                <a href="calculateBill.jsp" class="btn btn-success btn-sm mt-2">Open</a>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm text-center p-3">
                <i class="bi bi-list-check display-5 text-warning"></i>
                <h5 class="mt-2">View Reservations</h5>
                <a href="viewReservations.jsp" class="btn btn-warning btn-sm mt-2">Open</a>
            </div>
        </div>
    </div>

    <!-- Rooms Table -->
    <div class="card shadow-sm mb-5">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Room Details</h5>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Room Type</th>
                        <th>Price Per Night (LKR)</th>
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
                        if ("AVAILABLE".equalsIgnoreCase(r.getStatus())) badgeClass = "bg-success";
                        else if ("BOOKED".equalsIgnoreCase(r.getStatus())) badgeClass = "bg-danger";
                        else if ("MAINTENANCE".equalsIgnoreCase(r.getStatus())) badgeClass = "bg-warning text-dark";
                %>
                    <tr>
                        <td><%= r.getRoomId() %></td>
                        <td><%= r.getRoomType() %></td>
                        <td><%= r.getPricePerNight() %></td>
                        <td>
                            <span class="badge badge-status <%= badgeClass %>">
                                <%= r.getStatus() %>
                            </span>
                        </td>
                        <td>
                            <form class="d-flex gap-2 justify-content-center" method="post" action="<%= request.getContextPath() %>/UpdateRoomStatusServlet">
                                <input type="hidden" name="roomId" value="<%= r.getRoomId() %>">
                                <select name="status" class="form-select form-select-sm">
                                    <option value="AVAILABLE">AVAILABLE</option>
                                    <option value="BOOKED">BOOKED</option>
                                    <option value="MAINTENANCE">MAINTENANCE</option>
                                </select>
                                <button type="submit" class="btn btn-primary btn-sm">Update</button>
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
<footer class="footer mt-5 py-3 bg-light">
    <div class="container text-center text-muted">
        <p>© 2026 OceanView Hotel Management System</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>