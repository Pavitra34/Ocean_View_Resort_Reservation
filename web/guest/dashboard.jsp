<%@ page session="true" %>
<h2>Admin Dashboard</h2>
Welcome, <%= session.getAttribute("username") %>
<br>
<a href="../LogoutServlet">Logout</a>
