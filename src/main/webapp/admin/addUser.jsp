<!DOCTYPE html>
<html>
<head>
    <title>Add Staff User</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<header>Add Staff User</header>

<div class="container">
    <form method="post" action="../AddUserServlet">

        <label>Full Name</label>
        <input type="text" name="fullName" required>

        <label>Address</label>
        <input type="text" name="address" required>

        <label>Date of Birth</label>
        <input type="date" name="dob" required>

        <label>Username</label>
        <input type="text" name="username" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <input type="hidden" name="role" value="STAFF">

        <button type="submit">Create User</button>
    </form>

    <a href="adminDashboard.jsp">Back</a>
</div>

</body>
</html>


 
