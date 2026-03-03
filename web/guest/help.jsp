<%@ page session="true" %>
<%
if(session.getAttribute("role") == null ||
   !"GUEST".equals(session.getAttribute("role"))){
    response.sendRedirect("../auth/login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Guest Help Center</title>

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

<h2>Guest Help Center</h2>

<div class="card">
<h3>How to Create a Reservation</h3>
<p>Go to "Add Reservation" page, select room type, choose check-in and check-out dates, and submit the form.</p>
</div>

<div class="card">
<h3>How to View My Reservations</h3>
<p>Click on "My Reservations" to see all your bookings and their current status.</p>
</div>

<div class="card">
<h3>How to Cancel a Reservation</h3>
<p>If reservation status is PENDING, you can cancel it from My Reservations page.</p>
</div>

<div class="card">
<h3>Invoices</h3>
<p>Confirmed and completed reservations will appear in My Invoices section.</p>
</div>

<a href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>