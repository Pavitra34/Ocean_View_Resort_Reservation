<%@ page session="true" %>
<%
if(session.getAttribute("role") == null ||
   !"RECEPTIONIST".equals(session.getAttribute("role"))){
    response.sendRedirect("../auth/login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Receptionist Help Center</title>

<style>
body{
    font-family:'Segoe UI';
    background:#f4f6f9;
    padding:40px;
}

.container{
    max-width:900px;
    margin:auto;
}

.card{
    background:white;
    padding:25px;
    border-radius:12px;
    margin-bottom:20px;
    box-shadow:0 5px 15px rgba(0,0,0,0.08);
}

h2{
    margin-bottom:30px;
}

h3{
    margin-top:0;
    color:#2c3e50;
}

a{
    display:inline-block;
    margin-top:20px;
    background:#2c3e50;
    color:white;
    padding:8px 14px;
    text-decoration:none;
    border-radius:6px;
}
</style>
</head>

<body>

<div class="container">

<h2>Receptionist Help Center</h2>

<div class="card">
<h3>Managing Reservations</h3>
<p>Use Manage Reservations page to confirm, cancel, check-in and check-out guests.</p>
</div>

<div class="card">
<h3>Room Status Management</h3>
<p>Update room status as Available, Booked, Occupied or Maintenance.</p>
</div>

<div class="card">
<h3>Daily Report</h3>
<p>View today's check-ins, check-outs, confirmed bookings and revenue.</p>
</div>

<div class="card">
<h3>Handling Guest Queries</h3>
<p>Assist guests with booking, payment confirmation and room availability.</p>
</div>

<a href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>