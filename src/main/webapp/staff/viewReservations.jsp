<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>All Reservations</title>

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
        <h2 class="fw-bold">All Reservations</h2>
        <p class="text-muted">View and manage all hotel reservations</p>
    </div>

    <!-- Card -->
    <div class="card shadow-lg border-0">
        <div class="card-header bg-primary text-white">
            Reservation List
        </div>

        <div class="card-body table-responsive">

            <table class="table table-hover align-middle">
                <thead class="table-dark">
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
                </thead>

                <tbody>

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
    <td>
        <span class="badge bg-info">
            Room <%= r.getRoomId() %>
        </span>
    </td>
    <td><%= r.getCheckIn() %></td>
    <td><%= r.getCheckOut() %></td>
    <td>
        <span class="fw-bold text-success">
            Rs. <%= r.getTotalBill() %>
        </span>
    </td>
</tr>

<%
    }
%>

                </tbody>
            </table>

        </div>
    </div>

    <!-- Back Button -->
    <div class="mt-4">
        <a href="staffDashboard.jsp" class="btn btn-secondary">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
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
