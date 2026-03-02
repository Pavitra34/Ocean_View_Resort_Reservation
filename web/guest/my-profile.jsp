<%@ page import="com.oceanview.dao.UserDAO" %>
<%@ page import="com.oceanview.model.User" %>

<%
    Integer userIdObj = (Integer) session.getAttribute("userId");

    if(userIdObj == null){
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }

    int userId = userIdObj;

    UserDAO dao = new UserDAO();
    User user = dao.getUserById(userId);

    if(user == null){
        response.sendRedirect(request.getContextPath() + "/guest/dashboard.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>My Profile</title>

<style>
body{
    font-family:'Segoe UI', sans-serif;
    background:linear-gradient(135deg,#f4f6f9,#e9f2ff);
    padding:40px;
}

.card{
    background:white;
    padding:40px;
    border-radius:20px;
    max-width:600px;
    margin:auto;
    box-shadow:0 15px 40px rgba(0,0,0,0.08);
    transition:0.3s ease;
}

.card:hover{
    transform:translateY(-3px);
}

h2{
    margin-bottom:30px;
    text-align:center;
}

label{
    font-weight:600;
}

input{
    width:100%;
    padding:12px;
    margin:8px 0 18px 0;
    border-radius:10px;
    border:1px solid #ddd;
    transition:0.3s;
}

input:focus{
    border-color:#3498db;
    outline:none;
    box-shadow:0 0 5px rgba(52,152,219,0.3);
}

button{
    width:100%;
    padding:14px;
    background:#3498db;
    color:white;
    border:none;
    border-radius:10px;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button:hover{
    background:#2980b9;
}

.success{
    background:#d4edda;
    color:#155724;
    padding:12px;
    margin-bottom:15px;
    border-radius:10px;
}

.error{
    background:#f8d7da;
    color:#721c24;
    padding:12px;
    margin-bottom:15px;
    border-radius:10px;
}

.back-link{
    display:block;
    margin-top:25px;
    text-align:center;
    text-decoration:none;
    font-weight:600;
    color:#555;
}
.back-link:hover{
    color:#000;
}
</style>
</head>

<body>

<div class="card">

<h2>My Profile</h2>

<% if(request.getParameter("success") != null){ %>
    <div class="success">Profile Updated Successfully</div>
<% } %>

<% if(request.getParameter("error") != null){ %>
    <div class="error">Something went wrong. Please try again.</div>
<% } %>

<form action="<%= request.getContextPath() %>/UpdateProfileServlet" method="post">

    <input type="hidden" name="id" value="<%= user.getId() %>">

    <label>Username</label>
    <input type="text" name="username" value="<%= user.getUsername() %>" required>

    <label>Email</label>
    <input type="email" name="email" value="<%= user.getEmail() %>" required>

    <label>Contact Number</label>
    <input type="text" name="contact" value="<%= user.getContactNumber() %>">

    <button type="submit">Update Profile</button>

</form>

<a href="<%= request.getContextPath() %>/guest/dashboard.jsp" class="back-link">
    Back to Dashboard
</a>

</div>

</body>
</html>