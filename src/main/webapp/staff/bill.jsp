<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Bill Summary</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="../css/bill.css">

</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">
            OceanView Staff 
        </a>
    </div>
</nav>

<div class="container mt-5">

    <!-- Page Title -->
    <div class="text-center mb-4">
        <h2 class="fw-bold">Bill Summary</h2>
        <p class="text-muted">Reservation payment details</p>
    </div>

    <!-- Bill Card -->
    <div class="card shadow-lg border-0 mx-auto" style="max-width: 600px;">
        <div class="card-body p-4">

            <div class="bill-details">

                <div class="bill-row">
                    <span>Reservation ID : </span>
                    <strong>${reservationId}</strong>
                </div>

                <div class="bill-row">
                    <span>Guest Name : </span>
                    <strong>${guestName}</strong>
                </div>

                <div class="bill-row">
                    <span>Nights : </span>
                    <strong>${nights}</strong>
                </div>

                <div class="bill-row">
                    <span>Price per Night (LKR) : </span>
                    <strong>${price}</strong>
                </div>

                <hr>

                <div class="bill-total">
                    <span>Total Bill : </span>
                    <strong>LKR ${totalBill}</strong>
                </div>

            </div>

            <!-- Buttons -->
            <div class="d-flex justify-content-between mt-4">

                <a href="<%=request.getContextPath()%>/staff/staffDashboard.jsp" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Back
                </a>

                <button onclick="window.print()" class="btn btn-primary">
                    <i class="bi bi-printer"></i> Print Bill
                </button>

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