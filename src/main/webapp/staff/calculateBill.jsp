<!DOCTYPE html>
<html>
<head>
    <title>Calculate Bill</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<h2>Calculate Bill</h2>

<% if (request.getParameter("error") != null) { %>
    <p style="color:red;">Reservation not found</p>
<% } %>

<form method="post" action="<%=request.getContextPath()%>/CalculateBillServlet">

    <label>Reservation ID</label>
    <input type="number" name="reservationId" required>

    <button type="submit">Calculate</button>
</form>

    <a href="<%=request.getContextPath()%>/staff/staffDashboard.jsp">Back</a>
</div>

</body>
</html>
