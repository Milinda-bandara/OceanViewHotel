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
<link rel="stylesheet" href="../css/admindashboard.css">

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="adminDashboard.jsp">
            OceanView Admin
        </a>
    </div>
</nav>

<div class="container mt-5">

    <!-- Page Title -->
    <div class="text-center mb-4">
        <h2 class="fw-bold">All Reservations</h2>
        <p class="text-muted">View all hotel reservations</p>
    </div>

    <!-- Table Card -->
    <div class="card shadow-lg border-0">
        <div class="card-body p-4">

            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle text-center">
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

                            if(list != null && !list.isEmpty()){
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
                            <td>LKR <%= r.getTotalBill() %></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="8" class="text-center">No Reservations Found</td>
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
<footer class="footer mt-5">
    <div class="container text-center">
        <p>© 2026 OceanView Hotel Management System</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
