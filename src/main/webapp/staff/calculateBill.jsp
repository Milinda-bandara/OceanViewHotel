<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Calculate Bill</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="../css/staffdashboard.css">

<style>
    .card { border-radius: 0.75rem; }
    .alert i { margin-right: 0.5rem; }
</style>

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="staffDashboard.jsp">
            <i class="bi bi-person-workspace"></i> OceanView Staff
        </a>
    </div>
</nav>

<div class="container mt-5">

    <!-- Page Title -->
    <div class="text-center mb-4">
        <h2 class="fw-bold">Calculate Bill</h2>
        <p class="text-muted">Enter reservation ID to generate the bill</p>
    </div>

    <!-- Form Card -->
    <div class="card shadow-lg border-0 mx-auto" style="max-width: 500px;">
        <div class="card-body p-4">

            <!-- Error Message -->
            <% if ("true".equals(request.getParameter("error"))) { %>
                <div class="alert alert-danger text-center">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                    Reservation not found. Please check the ID.
                </div>
            <% } %>

            <!-- Form -->
            <form method="post" action="<%=request.getContextPath()%>/CalculateBillServlet">

                <div class="mb-3">
                    <label class="form-label">Reservation ID</label>
                    <input type="number"
                           name="reservationId"
                           class="form-control"
                           placeholder="Enter reservation ID"
                           required>
                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-between mt-4">
                    <a href="<%=request.getContextPath()%>/staff/staffDashboard.jsp" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left"></i> Back
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-calculator"></i> Calculate
                    </button>
                </div>

            </form>

        </div>
    </div>

</div>

<!-- Footer -->
<footer class="footer mt-5">
    <div class="container text-center text-muted">
        <p>© 2026 OceanView Hotel Management System</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>