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
        <h2 class="fw-bold">Add Staff User</h2>
        <p class="text-muted">Create a new staff account</p>
    </div>

    <!-- Form Card -->
    <div class="card shadow-lg border-0 mx-auto" style="max-width: 600px;">
        <div class="card-body p-4">

            <form method="post" action="../AddUserServlet">

                <!-- Full Name -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text"
                           name="fullName"
                           class="form-control"
                           placeholder="Enter full name"
                           required>
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input type="text"
                           name="address"
                           class="form-control"
                           placeholder="Enter address"
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
                           placeholder="Enter username"
                           required>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password"
                           name="password"
                           class="form-control"
                           placeholder="Enter password"
                           required>
                </div>

                <!-- Hidden Role -->
                <input type="hidden" name="role" value="STAFF">

                <!-- Buttons -->
                <div class="d-flex justify-content-between mt-4">

                    <a href="adminDashboard.jsp" class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Back
                    </a>

                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-person-plus"></i> Create User
                    </button>

                </div>

            </form>

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
