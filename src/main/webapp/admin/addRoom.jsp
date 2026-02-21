<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Add Room</title>

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
        <h2 class="fw-bold">Add New Room</h2>
        <p class="text-muted">Create and manage hotel rooms</p>
    </div>

    <!-- Add Room Form -->
    <div class="card shadow-lg border-0 mb-5">
        <div class="card-body p-4">

            <form method="post" action="<%=request.getContextPath()%>/AddRoomServlet">

                <div class="mb-3">
                    <label class="form-label">Room Type</label>
                    <input type="text" name="roomType" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Price Per Night</label>
                    <input type="number" step="0.01" name="price" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Status</label>
                    <select name="status" class="form-select">
                        <option value="AVAILABLE">Available</option>
                        <option value="BOOKED">Booked</option>
                        <option value="MAINTENANCE">Maintenance</option>
                    </select>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <a href="<%=request.getContextPath()%>/admin/adminDashboard.jsp"
                       class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i> Back
                    </a>

                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Add Room
                    </button>
                </div>

            </form>

        </div>
    </div>

    <!-- Room List -->
    <div class="card shadow-lg border-0">
        <div class="card-header bg-primary text-white">
            Rooms Details
        </div>

        <div class="card-body table-responsive">

            <table class="table table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Room Type</th>
                        <th>Price Per Night</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

<%
    RoomDAO dao = new RoomDAO();
    List<Room> list = dao.getAllRooms();

    for (Room r : list) {
%>

<tr>
    <td><%= r.getRoomId() %></td>
    <td><%= r.getRoomType() %></td>
    <td>Rs. <%= r.getPricePerNight() %></td>

    <td>
        <% if("AVAILABLE".equalsIgnoreCase(r.getStatus())) { %>
            <span class="badge bg-success">Available</span>
        <% } else if("BOOKED".equalsIgnoreCase(r.getStatus())) { %>
            <span class="badge bg-danger">Booked</span>
        <% } else { %>
            <span class="badge bg-warning text-dark">Maintenance</span>
        <% } %>
    </td>

    <td>
        <form method="post"
              action="<%= request.getContextPath() %>/UpdateRoomStatusServlet"
              class="d-flex gap-2">

            <input type="hidden" name="roomId" value="<%= r.getRoomId() %>">

            <select name="status" class="form-select form-select-sm">
                <option value="AVAILABLE">AVAILABLE</option>
                <option value="BOOKED">BOOKED</option>
                <option value="MAINTENANCE">MAINTENANCE</option>
            </select>

            <button type="submit" class="btn btn-sm btn-primary">
                Update
            </button>
        </form>
    </td>
</tr>

<%
    }
%>

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
