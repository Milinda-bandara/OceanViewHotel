<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.dao.RoomDAO" %>
<%@ page import="com.oceanview.model.Room" %>

<%
    // Load all rooms from database
    RoomDAO dao = new RoomDAO();
    List<Room> list = dao.getAllRooms();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Add Room - Admin</title>

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
        <h2 class="fw-bold">Add New Room</h2>
        <p class="text-muted">Create and manage hotel rooms</p>
    </div>

    <div class="row">

        <!-- ===============================
             Add Room Form
        ================================ -->
        <div class="col-lg-4">

            <div class="card shadow-lg border-0 mb-4">
                <div class="card-header bg-dark text-white">
                    <i class="bi bi-plus-circle"></i> Add Room
                </div>

                <div class="card-body">

                    <!-- Room Form -->
                    <form method="post" action="<%=request.getContextPath()%>/AddRoomServlet">

                        <!-- Room Type -->
                        <div class="mb-3">
                            <label class="form-label">Room Type</label>
                            <input 
                                type="text" 
                                name="roomType" 
                                class="form-control"
                                placeholder="Example: Deluxe Room"
                                required>
                        </div>

                        <!-- Price -->
                        <div class="mb-3">
                            <label class="form-label">Price Per Night (LKR)</label>
                            <input 
                                type="number" 
                                step="0.01" 
                                name="price" 
                                class="form-control"
                                placeholder="Enter price"
                                required>
                        </div>

                        <!-- Room Status -->
                        <div class="mb-3">
                            <label class="form-label">Room Status</label>
                            <select name="status" class="form-select">
                                <option value="AVAILABLE">Available</option>
                                <option value="BOOKED">Booked</option>
                                <option value="MAINTENANCE">Maintenance</option>
                            </select>
                        </div>

                        <!-- Buttons -->
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

        </div>

        <!-- ===============================
             Room List Table
        ================================ -->
        <div class="col-lg-8">

            <div class="card shadow-lg border-0">
                <div class="card-header bg-primary text-white">
                    <i class="bi bi-door-open"></i> Rooms Details
                </div>

                <div class="card-body table-responsive">

                    <table class="table table-hover align-middle">

                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Room Type</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Update Status</th>
                            </tr>
                        </thead>

                        <tbody>

<%
    for (Room r : list) {
%>

<tr>
    <!-- Room ID -->
    <td><%= r.getRoomId() %></td>

    <!-- Room Type -->
    <td>
        <strong><%= r.getRoomType() %></strong>
    </td>

    <!-- Price -->
    <td>
        LKR <%= String.format("%.2f", r.getPricePerNight()) %>
    </td>

    <!-- Room Status Badge -->
    <td>
        <% if("AVAILABLE".equalsIgnoreCase(r.getStatus())) { %>
            <span class="badge bg-success">Available</span>
        <% } else if("BOOKED".equalsIgnoreCase(r.getStatus())) { %>
            <span class="badge bg-danger">Booked</span>
        <% } else { %>
            <span class="badge bg-warning text-dark">Maintenance</span>
        <% } %>
    </td>

    <!-- Update Status -->
    <td>
        <form method="post"
              action="<%= request.getContextPath() %>/UpdateRoomStatusServlet"
              class="d-flex gap-2">

            <!-- Hidden Room ID -->
            <input type="hidden" name="roomId" value="<%= r.getRoomId() %>">

            <!-- Status Select -->
            <select name="status" class="form-select form-select-sm">

                <option value="AVAILABLE"
                    <%= "AVAILABLE".equalsIgnoreCase(r.getStatus()) ? "selected" : "" %>>
                    AVAILABLE
                </option>

                <option value="BOOKED"
                    <%= "BOOKED".equalsIgnoreCase(r.getStatus()) ? "selected" : "" %>>
                    BOOKED
                </option>

                <option value="MAINTENANCE"
                    <%= "MAINTENANCE".equalsIgnoreCase(r.getStatus()) ? "selected" : "" %>>
                    MAINTENANCE
                </option>

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