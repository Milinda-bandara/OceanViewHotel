<%@ page import="com.oceanview.model.User" %>
<%@ page import="java.util.*, com.oceanview.dao.UserDAO, com.oceanview.model.User" %>
<%@ page import="java.util.List, com.oceanview.dao.UserDAO, com.oceanview.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if(user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<header>Admin Dashboard</header>

<nav>
    <a href="../help.jsp">Help</a>
    <a href="../LogoutServlet">Logout</a>
</nav>

<div class="container">
    <h3>Welcome, Admin</h3>

    <ul>
        <li><a href="addUser.jsp">Add Staff User</a></li>
        <li><a href="addRoom.jsp">Add Room</a></li>
        <li><a href="viewReservations.jsp">View All Reservations</a></li>
    </ul>
</div>

<div>


<h2>Users List</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>DOB</th>
        <th>Registered</th>
        <th>Username</th>
        <th>Role</th>
        <th>Action</th>
    </tr>

<%
    UserDAO dao = new UserDAO();
    List<User> users = dao.getAllUsers();

    for(User u : users){
%>
    <tr>
        <td><%= u.getUserId() %></td>
        <td><%= u.getFullName() %></td>
        <td><%= u.getAddress() %></td>
        <td><%= u.getDob() %></td>
        <td><%= u.getRegisterDate() %></td>
        <td><%= u.getUsername() %></td>
        <td><%= u.getRole() %></td>
        <td>
            <a href="../DeleteUserServlet?id=<%= u.getUserId() %>"
               onclick="return confirm('Delete this user?')">
               Delete
            </a>
        </td>
    </tr>
<% } %>

</table>


</div>

</body>
</html>
