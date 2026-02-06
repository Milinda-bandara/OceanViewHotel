
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Page Meta -->
    <meta charset="UTF-8">
    <title>Login | Ocean View Resort</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<!-- Fullscreen Background Overlay -->
<div class="bg-overlay"></div>

<!-- Login Wrapper -->
<div class="login-wrapper">

    <!-- Glassmorphism Login Card -->
    <div class="login-card">

        <!-- Branding -->
        <div class="text-center mb-4">
            <h3 class="brand-title">Ocean View Resort</h3>
            <p class="brand-subtitle">Luxury Hotel Reservation System</p>
        </div>

        <!-- Error Message (JSP logic preserved) -->
        <% if (request.getParameter("error") != null) { %>
            <div class="error-message text-center mb-3">
                <i class="bi bi-exclamation-circle"></i>
                Invalid username or password
            </div>
        <% } %>

        <!-- Login Form -->
        <form method="post" action="LoginServlet">

            <!-- Username -->
            <div class="mb-3 position-relative">
                <i class="bi bi-person input-icon"></i>
                <input type="text" name="username" class="form-control" placeholder="Username" required>
            </div>

            <!-- Password -->
            <div class="mb-4 position-relative">
                <i class="bi bi-lock input-icon"></i>
                <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                <i class="bi bi-eye toggle-password" onclick="togglePassword()"></i>
            </div>

            <!-- Login Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-login">
                    <i class="bi bi-box-arrow-in-right"></i> Login
                </button>
            </div>

        </form>
    </div>
</div>

<!-- Password Toggle -->
<script>
    function togglePassword() {
        const pwd = document.getElementById("password");
        pwd.type = pwd.type === "password" ? "text" : "password";
    }
</script>

</body>
</html>

