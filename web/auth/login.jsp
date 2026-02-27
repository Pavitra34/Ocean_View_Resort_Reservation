<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="login-container">
    <div class="login-card">

        <h2>Ocean View Resort</h2>

        <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>

    <a href="<%= request.getContextPath() %>/auth/register.jsp">Register</a>

        <% if(request.getParameter("error") != null){ %>
            <div class="error-msg">
                Invalid Username or Password!
            </div>
        <% } %>

    </div>
</div>

</body>
</html>