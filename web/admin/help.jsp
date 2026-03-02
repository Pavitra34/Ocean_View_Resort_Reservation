<%@ page session="true" %>
<%
    if(session.getAttribute("role") == null ||
       !session.getAttribute("role").equals("ADMIN")){
        response.sendRedirect("../auth/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Help Center</title>

<style>
body{
    font-family:'Segoe UI', sans-serif;
    background:#f4f6f9;
    margin:0;
    padding:40px;
}

.page-card{
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 25px rgba(0,0,0,0.08);
}

h2{
    margin-bottom:20px;
}

.section{
    margin-bottom:30px;
}

.section h3{
    background:#1e2a38;
    color:white;
    padding:10px;
    border-radius:8px;
}

ul{
    line-height:1.8;
}

.back-btn{
    display:inline-block;
    margin-top:20px;
    padding:10px 18px;
    background:#34495e;
    color:white;
    text-decoration:none;
    border-radius:8px;
}

.back-btn:hover{
    background:#2c3e50;
}
</style>

</head>

<body>

<div class="page-card">

<h2>Reservation System Help Guide</h2>

<div class="section">
<h3>1. Add Reservation</h3>
<ul>
<li>Go to Reservation ? Add Reservation</li>
<li>Fill guest details correctly</li>
<li>Check-in date must be today or future</li>
<li>Contact number is mandatory</li>
<li>Status will be set to PENDING automatically</li>
</ul>
</div>

<div class="section">
<h3>2. Confirm Reservation</h3>
<ul>
<li>Go to View Reservation</li>
<li>Click Confirm button</li>
<li>Complete payment in booking screen</li>
<li>Status will change to CONFIRMED</li>
<li>Invoice can be generated after confirmation</li>
</ul>
</div>

<div class="section">
<h3>3. Cancel Reservation</h3>
<ul>
<li>Click Cancel button</li>
<li>Status will change to CANCELLED</li>
<li>Cancelled bookings will not count in revenue</li>
</ul>
</div>

<div class="section">
<h3>4. Dashboard Statistics</h3>
<ul>
<li>Total Guests = Unique guest names</li>
<li>Total Reservations = All bookings</li>
<li>Total Revenue = Confirmed bookings only</li>
</ul>
</div>

<div class="section">
<h3>5. Invoice & QR Code</h3>
<ul>
<li>QR code contains reservation details</li>
<li>Includes Tax (10%) and Service Charge (5%)</li>
<li>Printable format</li>
</ul>
</div>

<a href="dashboard.jsp" class="back-btn"> Back to Dashboard</a>

</div>

</body>
</html>