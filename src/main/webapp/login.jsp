<!DOCTYPE html>
<html>
<head>
    <title>Login - Ocean View Resort</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>Ocean View Resort - Login</header>

<div class="container">
    <% if(request.getParameter("error") != null) { %>
        <p class="error">Invalid username or password</p>
    <% } %>

    <form method="post" action="LoginServlet">
        <label>Username</label>
        <input type="text" name="username" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>
    </form>
</div>

</body>
</html>
