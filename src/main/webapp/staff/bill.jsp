<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<h2>Bill Summary</h2>

<p><strong>Reservation ID:</strong> ${reservationId}</p>
<p><strong>Guest Name:</strong> ${guestName}</p>
<p><strong>Nights:</strong> ${nights}</p>
<p><strong>Price per Night (LKR):</strong> ${price}</p>
<p><strong>Total Bill (LKR):</strong> ${totalBill}</p>

<br>
<button onclick="window.print()">🖨 Print Bill</button>

<br><br>
<a href="<%=request.getContextPath()%>/staff/staffDashboard.jsp">⬅ Back to Dashboard</a>

</body>
</html>