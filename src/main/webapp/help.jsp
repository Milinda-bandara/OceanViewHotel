<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Help - OceanView Resort</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/help.css">

</head>
<body class="bg-light">

<!-- ===============================
     Navbar
================================ -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="login.jsp">
            <i class="bi bi-building"></i> OceanView Resort
        </a>

        <!-- Quick navigation -->
        <div class="ms-auto">
            <a href="login.jsp" class="btn btn-outline-light btn-sm">
                <i class="bi bi-box-arrow-in-left"></i> Login
            </a>
        </div>
    </div>
</nav>

<div class="container mt-5">

    <!-- Page Title -->
    <div class="text-center mb-4">
        <h2 class="fw-bold">
            <i class="bi bi-question-circle text-primary"></i>
            Help & Usage Guide
        </h2>
        <p class="text-muted">Learn how to use the Hotel Reservation System</p>
    </div>

    <!-- Help Card -->
    <div class="card shadow-lg border-0 mx-auto" style="max-width: 850px;">
        <div class="card-body p-4">

            <!-- ===============================
                 System Overview
            ================================ -->
            <div class="mb-4">
                <h4 class="text-primary">
                    <i class="bi bi-info-circle"></i> System Overview
                </h4>

                <!-- Simple explanation about the system -->
                <p>
                    The OceanView Hotel Management System is designed to help hotel staff
                    manage reservations, rooms, users, and billing in an organized and efficient way.
                    This system reduces manual work and prevents booking errors.
                </p>
            </div>

            <hr>

            <!-- ===============================
                 Login Instructions
            ================================ -->
            <div class="mb-4">
                <h5 class="text-success">
                    <i class="bi bi-box-arrow-in-right"></i> Login Instructions
                </h5>

                <ul class="list-group">
                    <li class="list-group-item">Open the login page.</li>
                    <li class="list-group-item">Enter your username and password.</li>
                    <li class="list-group-item">Click the <strong>Login</strong> button.</li>
                    <li class="list-group-item">The system will redirect you to the dashboard.</li>
                </ul>
            </div>

            <!-- ===============================
                 Admin Guide
            ================================ -->
            <div class="mb-4">
                <h5 class="text-danger">
                    <i class="bi bi-person-gear"></i> Admin Functions
                </h5>

                <ul class="list-group">
                    <li class="list-group-item">Add and manage staff users.</li>
                    <li class="list-group-item">Add and update room information.</li>
                    <li class="list-group-item">View and monitor reservations.</li>
                    <li class="list-group-item">Update room status (Available / Booked).</li>
                    <li class="list-group-item">Manage overall hotel operations.</li>
                </ul>
            </div>

            <!-- ===============================
                 Staff Guide
            ================================ -->
            <div class="mb-4">
                <h5 class="text-warning">
                    <i class="bi bi-person-workspace"></i> Staff Functions
                </h5>

                <ul class="list-group">
                    <li class="list-group-item">Create new reservations for guests.</li>
                    <li class="list-group-item">Assign available rooms.</li>
                    <li class="list-group-item">Calculate customer bills.</li>
                    <li class="list-group-item">Print bill summaries.</li>
                    <li class="list-group-item">View reservation history.</li>
                </ul>
            </div>

            <!-- ===============================
                 Important Tips
            ================================ -->
            <div class="mb-4">
                <h5 class="text-secondary">
                    <i class="bi bi-exclamation-circle"></i> Important Tips
                </h5>

                <ul class="list-group">
                    <li class="list-group-item">Always verify guest details before saving.</li>
                    <li class="list-group-item">Update room status after guest checkout.</li>
                    <li class="list-group-item">Do not share login credentials with others.</li>
                    <li class="list-group-item">Always logout after completing your work.</li>
                </ul>
            </div>

            <!-- ===============================
                 System Features
            ================================ -->
            <div class="mb-4">
                <h5 class="text-info">
                    <i class="bi bi-stars"></i> Key Features
                </h5>

                <ul class="list-group">
                    <li class="list-group-item">User Management System</li>
                    <li class="list-group-item">Room Reservation Management</li>
                    <li class="list-group-item">Billing System</li>
                    <li class="list-group-item">Admin and Staff Dashboards</li>
                    <li class="list-group-item">Real-time Room Status Tracking</li>
                </ul>
            </div>

            <!-- Buttons -->
            <div class="d-flex justify-content-between mt-4">

                <!-- Back to login -->
                <a href="login.jsp" class="btn btn-primary">
                    <i class="bi bi-arrow-left"></i> Back to Login
                </a>

                <!-- Optional: Go to Dashboard -->
                <a href="admin/adminDashboard.jsp" class="btn btn-success">
                    <i class="bi bi-speedometer2"></i> Go to Dashboard
                </a>

            </div>

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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>