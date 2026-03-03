<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>

<%
    // Load reservations from database
    ReservationDAO dao = new ReservationDAO();
    List<Reservation> list = dao.getAllReservations();

    int totalReservations = (list != null) ? list.size() : 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>All Reservations</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="../css/admindashboard.css">

</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="adminDashboard.jsp">
            <i class="bi bi-speedometer2"></i> OceanView Admin
        </a>
    </div>
</nav>

<div class="container mt-5">

    <!-- Page Title -->
    <div class="text-center mb-4">
        <h2 class="fw-bold">All Reservations</h2>
        <p class="text-muted">View and manage hotel reservations</p>
    </div>

    <!-- Small Statistics Card (looks professional) -->
    <div class="row mb-4">
        <div class="col-md-4 mx-auto">
            <div class="card shadow text-center">
                <div class="card-body">
                    <i class="bi bi-journal-check display-5 text-primary"></i>
                    <h4 class="mt-2"><%= totalReservations %></h4>
                    <p class="text-muted">Total Reservations</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Table Card -->
    <div class="card shadow-lg border-0">

        <div class="card-header bg-primary text-white">
            <i class="bi bi-list-check"></i> Reservation List
        </div>

        <div class="card-body p-4">

            <!-- Reservation Table -->
            <div class="table-responsive">
                <table class="table table-hover align-middle text-center">

                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Guest Name</th>
                            <th>Address</th>
                            <th>Contact</th>
                            <th>Room</th>
                            <th>Check In</th>
                            <th>Check Out</th>
                            <th>Total Bill</th>
                        </tr>
                    </thead>

                    <tbody>

<%
    if(list != null && !list.isEmpty()){
        for (Reservation r : list) {
%>

<tr>
    <td><%= r.getReservationId() %></td>

    <!-- Guest Name highlighted -->
    <td><strong><%= r.getGuestName() %></strong></td>

    <td><%= r.getAddress() %></td>
    <td><%= r.getContactNumber() %></td>

    <!-- Room Badge -->
    <td>
        <span class="badge bg-info text-dark">
            Room <%= r.getRoomId() %>
        </span>
    </td>

    <td><%= r.getCheckIn() %></td>
    <td><%= r.getCheckOut() %></td>

    <!-- Format bill -->
    <td class="fw-bold text-success">
        LKR <%= String.format("%.2f", r.getTotalBill()) %>
    </td>
</tr>

<%
        }
    } else {
%>

<tr>
    <td colspan="8" class="text-center text-muted">
        <i class="bi bi-info-circle"></i> No Reservations Found
    </td>
</tr>

<%
    }
%>

                    </tbody>
                </table>
            </div>

            <!-- Back Button -->
            <div class="d-flex justify-content-end mt-3">
                <a href="adminDashboard.jsp" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Back to Dashboard
                </a>
            </div>

        </div>
    </div>

</div>

<!-- Footer -->
<footer class="footer mt-5 bg-dark text-white py-3">
    <div class="container text-center">
        <small>© 2026 OceanView Hotel Management System</small>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>