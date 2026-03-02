<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null || 
       !session.getAttribute("role").equals("GUEST")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Guest Dashboard</title>

<style>
body{
    font-family:'Segoe UI', sans-serif;
    margin:0;
    background:linear-gradient(135deg,#667eea,#764ba2);
    padding:40px;
}

.dashboard-card{
    background:white;
    padding:30px;
    border-radius:20px;
    max-width:900px;
    margin:auto;
    box-shadow:0 10px 40px rgba(0,0,0,0.2);
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.header h2{
    margin:0;
}

.logout{
    background:#e74c3c;
    color:white;
    padding:8px 15px;
    border-radius:8px;
    text-decoration:none;
}

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:20px;
}

.card{
    padding:25px;
    border-radius:15px;
    color:white;
    text-align:center;
    text-decoration:none;
    font-weight:bold;
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
}

.book{ background:#2ecc71; }
.view{ background:#3498db; }
.invoice{ background:#9b59b6; }
.profile{ background:#f39c12; }

.welcome{
    margin-bottom:25px;
    font-size:18px;
}
</style>

</head>

<body>

<div class="dashboard-card">

<div class="header">
    <h2>Guest Dashboard</h2>
    <a href="<%= request.getContextPath() %>/LogoutServlet" class="logout">
        Logout
    </a>
</div>

<div class="welcome">
    Welcome, <strong><%= session.getAttribute("username") %></strong>
</div>

<div class="grid">

    <a href="book-room.jsp" class="card book">
        Reserve Room
    </a>

    <a href="my-reservations.jsp" class="card view">
        My Reservations
    </a>

    <a href="my-invoices.jsp" class="card invoice">
        My Invoices
    </a>

    <a href="my-profile.jsp" class="card profile">
        My Profile
    </a>

</div>

</div>

</body>
</html>
