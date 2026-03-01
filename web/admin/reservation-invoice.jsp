<%@ page import="com.oceanview.dao.ReservationDAO" %>
<%@ page import="com.oceanview.model.Reservation" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    ReservationDAO dao = new ReservationDAO();
    Reservation r = dao.getReservationById(id);
%>

<!DOCTYPE html>
<html>
<head>
<title>Invoice</title>

<style>
body{
    font-family:Arial;
    padding:40px;
}
.invoice-box{
    border:1px solid #ccc;
    padding:30px;
}
h2{
    text-align:center;
}
table{
    width:100%;
    margin-top:20px;
}
td{
    padding:8px;
}
.total{
    font-weight:bold;
    font-size:18px;
}
</style>
</head>

<body onload="window.print()">

<div class="invoice-box">

    <h2>Ocean View Resort</h2>
    <hr>

    <p><strong>Reservation No:</strong> <%= r.getReservationNumber() %></p>
    <p><strong>Guest Name:</strong> <%= r.getGuestName() %></p>
    <p><strong>Contact:</strong> <%= r.getContactNumber() %></p>
    <p><strong>Room Type:</strong> <%= r.getRoomType() %></p>
    <p><strong>Check-In:</strong> <%= r.getCheckIn() %></p>
    <p><strong>Check-Out:</strong> <%= r.getCheckOut() %></p>

    <hr>

    <h3 class="total">
        Total Amount: LKR <%= r.getTotalAmount() %>
    </h3>

</div>

</body>
</html>