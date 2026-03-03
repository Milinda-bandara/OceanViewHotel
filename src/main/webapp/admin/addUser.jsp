<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Add Staff User</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="../css/admindashboard.css">

</head>
<body class="bg-light">

<!-- ===============================
     Navbar
================================ -->
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
        <h2 class="fw-bold">Add Staff User</h2>
        <p class="text-muted">Create a new staff account</p>
    </div>

    <!-- Form Card -->
    <div class="card shadow-lg border-0 mx-auto" style="max-width: 650px;">
        <div class="card-header bg-primary text-white">
            <i class="bi bi-person-plus"></i> Staff Registration
        </div>

        <div class="card-body p-4">

            <!-- Staff User Form -->
            <form method="post" action="../AddUserServlet">

                <!-- Full Name -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text"
                           name="fullName"
                           class="form-control"
                           placeholder="Enter staff full name"
                           required>
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input type="text"
                           name="address"
                           class="form-control"
                           placeholder="Enter home address"
                           required>
                </div>

                <!-- Date of Birth -->
                <div class="mb-3">
                    <label class="form-label">Date of Birth</label>
                    <input type="date"
                           name="dob"
                           class="form-control"
                           required>
                </div>

                <!-- Username -->
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text"
                           name="username"
                           class="form-control"
                           placeholder="Create a username"
                           required>

                    <!-- Small helper text -->
                    <small class="text-muted">
                        Username should be unique.
                    </small>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password"
                           name="password"
                           class="form-control"
                           placeholder="Enter secure password"
                           minlength="6"
                           required>

                    <!-- Password guidance -->
                    <small class="text-muted">
                        Use at least 6 characters for security.
                    </small>
                </div>

                <!-- Hidden Role (system automatically sets STAFF role) -->
                <input type="hidden" name="role" value="STAFF">

                <!-- Buttons -->
                <div class="d-flex justify-content-between mt-4">

                    <!-- Back Button -->
                    <a href="adminDashboard.jsp" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Back
                    </a>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-person-plus"></i> Create User
                    </button>

                </div>

            </form>

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