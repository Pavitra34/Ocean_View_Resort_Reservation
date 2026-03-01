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
    font-family: Arial, sans-serif;
    padding:40px;
}

.invoice-box{
    max-width:800px;
    margin:auto;
    border:1px solid #eee;
    padding:30px;
}

.header{
    text-align:center;
    margin-bottom:30px;
}

table{
    width:100%;
    border-collapse:collapse;
}

td, th{
    padding:10px;
    border-bottom:1px solid #ddd;
}

.total{
    text-align:right;
    font-weight:bold;
    font-size:18px;
}
</style>
</head>

<body onload="window.print()">

<div class="invoice-box">

    <div class="header">
        <h2>Ocean View Resort</h2>
        <p>Hotel Invoice</p>
    </div>

    <table>
        <tr>
            <td><strong>Reservation No:</strong></td>
            <td><%= r.getReservationNumber() %></td>
        </tr>
        <tr>
            <td><strong>Guest Name:</strong></td>
            <td><%= r.getGuestName() %></td>
        </tr>
        <tr>
            <td><strong>Room Type:</strong></td>
            <td><%= r.getRoomType() %></td>
        </tr>
        <tr>
            <td><strong>Check-In:</strong></td>
            <td><%= r.getCheckIn() %></td>
        </tr>
        <tr>
            <td><strong>Check-Out:</strong></td>
            <td><%= r.getCheckOut() %></td>
        </tr>
    </table>

    <br><br>

    <table>
        <tr>
            <th>Description</th>
            <th>Amount (LKR)</th>
        </tr>
        <tr>
            <td>Room Charges</td>
            <td><%= r.getTotalAmount() %></td>
        </tr>
    </table>

    <br>

    <div class="total">
        Total: LKR <%= r.getTotalAmount() %>
    </div>

    <br><br>
    <p>Thank you for staying with us!</p>

</div>

</body>
</html>