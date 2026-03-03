<%@ page import="com.oceanview.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.UserDAO" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.dao.ReservationDAO" %>

<%
    // ===============================
    // Session Security Check
    // ===============================
    // This checks if the user is logged in and is an ADMIN
    User user = (User) session.getAttribute("user");

    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }

    // ===============================
    // Load Dashboard Data from Database
    // ===============================
    UserDAO userDAO = new UserDAO();
    RoomDAO roomDAO = new RoomDAO();
    ReservationDAO reservationDAO = new ReservationDAO();

    int totalUsers = userDAO.getTotalUsers();
    int totalRooms = roomDAO.getTotalRooms();
    int availableRooms = roomDAO.countAvailableRooms();
    int bookedRooms = roomDAO.countBookedRooms();
    int totalReservations = reservationDAO.getTotalReservations();
    double totalRevenue = reservationDAO.getTotalRevenue();

    // Get all users list
    List<User> users = userDAO.getAllUsers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin Dashboard</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="../css/admindashboard.css">

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body class="bg-light">

<!-- ===============================
     Navbar
================================ -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold">
            <i class="bi bi-building"></i> OceanView Admin
        </a>

        <div class="ms-auto">
            <span class="text-white me-3">
                Welcome Admin
            </span>

            <a class="btn btn-outline-light me-2" href="../help.jsp">
                <i class="bi bi-question-circle"></i> Help
            </a>

            <a class="btn btn-warning" href="../LogoutServlet">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4">

    <!-- Page Title -->
    <div class="mb-4">
        <h3 class="fw-bold">Admin Dashboard</h3>
        <p class="text-muted">System overview and management panel</p>
    </div>

    <!-- ===============================
         Management Cards
    ================================ -->
    <div class="row g-4 mb-4">

        <!-- Add User -->
        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm border-0 h-100">
                <div class="card-body text-center">
                    <i class="bi bi-person-plus display-5 text-primary"></i>
                    <h5 class="mt-3">Add Staff User</h5>
                    <p class="text-muted small">Create new staff accounts</p>
                    <a href="addUser.jsp" class="btn btn-primary btn-sm">
                        Open
                    </a>
                </div>
            </div>
        </div>

        <!-- Add Room -->
        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm border-0 h-100">
                <div class="card-body text-center">
                    <i class="bi bi-door-open display-5 text-success"></i>
                    <h5 class="mt-3">Add Room</h5>
                    <p class="text-muted small">Register new hotel rooms</p>
                    <a href="addRoom.jsp" class="btn btn-success btn-sm">
                        Open
                    </a>
                </div>
            </div>
        </div>

        <!-- View Reservations -->
        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm border-0 h-100">
                <div class="card-body text-center">
                    <i class="bi bi-journal-text display-5 text-warning"></i>
                    <h5 class="mt-3">Reservations</h5>
                    <p class="text-muted small">View and manage bookings</p>
                    <a href="viewReservations.jsp" class="btn btn-warning btn-sm">
                        Open
                    </a>
                </div>
            </div>
        </div>

    </div>

    <!-- ===============================
         Statistics Cards
    ================================ -->
    <div class="row g-4 mb-4">

        <!-- Total Users -->
        <div class="col-md-3">
            <div class="card shadow border-0 text-center">
                <div class="card-body">
                    <i class="bi bi-people display-5 text-primary"></i>
                    <h4 class="mt-2"><%= totalUsers %></h4>
                    <p class="text-muted">Total Users</p>
                </div>
            </div>
        </div>

        <!-- Total Rooms -->
        <div class="col-md-3">
            <div class="card shadow border-0 text-center">
                <div class="card-body">
                    <i class="bi bi-door-open display-5 text-success"></i>
                    <h4 class="mt-2"><%= totalRooms %></h4>
                    <p class="text-muted">Total Rooms</p>
                </div>
            </div>
        </div>

        <!-- Reservations -->
        <div class="col-md-3">
            <div class="card shadow border-0 text-center">
                <div class="card-body">
                    <i class="bi bi-journal-check display-5 text-warning"></i>
                    <h4 class="mt-2"><%= totalReservations %></h4>
                    <p class="text-muted">Reservations</p>
                </div>
            </div>
        </div>

        <!-- Available Rooms -->
        <div class="col-md-3">
            <div class="card shadow border-0 text-center">
                <div class="card-body">
                    <i class="bi bi-check-circle display-5 text-info"></i>
                    <h4 class="mt-2"><%= availableRooms %></h4>
                    <p class="text-muted">Available Rooms</p>
                </div>
            </div>
        </div>

    </div>

    <!-- ===============================
         Chart + Revenue
    ================================ -->
    <div class="row mb-4">

        <!-- Room Chart -->
        <div class="col-md-6">
            <div class="card shadow border-0 h-100">
                <div class="card-header bg-dark text-white">
                    Room Status Chart
                </div>
                <div class="card-body">
                    <canvas id="roomChart"></canvas>
                </div>
            </div>
        </div>

        <!-- Revenue -->
        <div class="col-md-6">
            <div class="card shadow border-0 text-center h-100">
                <div class="card-body d-flex flex-column justify-content-center">
                    <i class="bi bi-cash-coin display-5 text-success"></i>
                    <h3 class="mt-3">LKR <%= String.format("%.2f", totalRevenue) %></h3>
                    <p class="text-muted">Total Revenue</p>
                </div>
            </div>
        </div>

    </div>

    <!-- ===============================
         Users Table
    ================================ -->
    <div class="card shadow-lg border-0">
        <div class="card-header bg-primary text-white">
            <i class="bi bi-person-lines-fill"></i> Users List
        </div>

        <div class="card-body table-responsive">

            <table class="table table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>DOB</th>
                        <th>Registered</th>
                        <th>Username</th>
                        <th>Role</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

<%
for(User u : users){
%>

<tr>
    <td><%= u.getUserId() %></td>
    <td><%= u.getFullName() %></td>
    <td><%= u.getAddress() %></td>
    <td><%= u.getDob() %></td>
    <td><%= u.getRegisterDate() %></td>
    <td><%= u.getUsername() %></td>

    <!-- Role Badge -->
    <td>
        <% if("ADMIN".equals(u.getRole())) { %>
            <span class="badge bg-danger">ADMIN</span>
        <% } else { %>
            <span class="badge bg-success">STAFF</span>
        <% } %>
    </td>

    <!-- Delete Button -->
    <td>
        <a href="../DeleteUserServlet?id=<%= u.getUserId() %>"
           class="btn btn-sm btn-danger"
           onclick="return confirm('Are you sure you want to delete this user?');">
           <i class="bi bi-trash"></i>
        </a>
    </td>
</tr>

<% } %>

                </tbody>
            </table>

        </div>
    </div>

</div>

<!-- ===============================
     Footer
================================ -->
<footer class="footer mt-5 bg-dark text-white py-3">
    <div class="container text-center">
        <small>© 2026 OceanView Hotel Management System</small>
    </div>
</footer>

<!-- ===============================
     Chart Script
================================ -->
<script>
document.addEventListener("DOMContentLoaded", function () {

    // Room status pie chart
    const ctx = document.getElementById('roomChart');

    new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Available Rooms', 'Booked Rooms'],
            datasets: [{
                data: [<%= availableRooms %>, <%= bookedRooms %>],
                backgroundColor: [
                    '#198754', // green
                    '#dc3545'  // red
                ]
            }]
        }
    });

});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>