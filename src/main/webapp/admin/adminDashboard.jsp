<%@ page import="com.oceanview.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.UserDAO" %>

<%
    // Session security check (unchanged)
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Admin Dashboard</title>

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
        <a class="navbar-brand fw-bold" href="#">
            OceanView Admin
        </a>

        <div class="ms-auto">
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

    <!-- Welcome Section -->
    <div class="mb-4">
        <h3 class="fw-bold">Welcome, Admin</h3>
        <p class="text-muted">Manage users, rooms, and reservations</p>
    </div>

    <!-- Dashboard Cards -->
    <div class="row g-4 mb-4">

        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm">
                <div class="card-body text-center">
                    <i class="bi bi-person-plus display-5 text-primary"></i>
                    <h5 class="card-title mt-2">Add Staff User</h5>
                    <a href="addUser.jsp" class="btn btn-primary btn-sm mt-2">
                        Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm">
                <div class="card-body text-center">
                    <i class="bi bi-door-open display-5 text-success"></i>
                    <h5 class="card-title mt-2">Add Room</h5>
                    <a href="addRoom.jsp" class="btn btn-success btn-sm mt-2">
                        Open
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card dashboard-card shadow-sm">
                <div class="card-body text-center">
                    <i class="bi bi-journal-text display-5 text-warning"></i>
                    <h5 class="card-title mt-2">View Reservations</h5>
                    <a href="viewReservations.jsp" class="btn btn-warning btn-sm mt-2">
                        Open
                    </a>
                </div>
            </div>
        </div>

    </div>

    <!-- Users Table -->
    <div class="card shadow-lg border-0">
        <div class="card-header bg-primary text-white">
            Users List
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
    UserDAO dao = new UserDAO();
    List<User> users = dao.getAllUsers();

    for(User u : users){
%>

<tr>
    <td><%= u.getUserId() %></td>
    <td><%= u.getFullName() %></td>
    <td><%= u.getAddress() %></td>
    <td><%= u.getDob() %></td>
    <td><%= u.getRegisterDate() %></td>
    <td><%= u.getUsername() %></td>
    <td>
        <% if("ADMIN".equals(u.getRole())) { %>
            <span class="badge bg-danger">ADMIN</span>
        <% } else { %>
            <span class="badge bg-success">STAFF</span>
        <% } %>
    </td>

    <td>
        <a href="../DeleteUserServlet?id=<%= u.getUserId() %>"
           class="btn btn-sm btn-danger"
           onclick="return confirm('Delete this user?')">
           <i class="bi bi-trash"></i> Delete
        </a>
    </td>
</tr>

<% } %>

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
