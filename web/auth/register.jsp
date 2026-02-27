
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
<div class="container">
<h2>Ocean View Resort - Guest Register</h2>

<form action="../RegisterServlet" method="post">

<input type="text" name="firstname" placeholder="First Name" required/>
<input type="text" name="lastname" placeholder="Last Name" required/>
<input type="text" name="username" placeholder="Username" required/>
<input type="email" name="email" placeholder="Email" required/>
<input type="password" name="password" placeholder="Password" required/>
<input type="text" name="contact" placeholder="Contact Number"/>
<textarea name="address" placeholder="Address"></textarea>

<input type="hidden" name="role" value="GUEST"/>

<button type="submit">Register</button>
</form>

<p>Already have account? <a href="<%= request.getContextPath() %>/auth/login.jsp">Login</a></p>
</div>
</body>
</html>
